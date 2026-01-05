from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import os
from openai import OpenAI

# Initialize OpenAI client (NEW SDK)
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

app = FastAPI(title="AIOps Service")

class IncidentRequest(BaseModel):
    logs: str
    context: str

@app.post("/analyze")
def analyze_incident(req: IncidentRequest):
    try:
        prompt = f"""
You are a senior Site Reliability Engineer.

Context:
{req.context}

Logs:
{req.logs}

Tasks:
1. Identify the root cause
2. Summarize the incident in 3 bullet points
3. Suggest remediation steps
4. Generate a short operational runbook
"""

        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "user", "content": prompt}
            ],
            temperature=0.2
        )

        return {
            "analysis": response.choices[0].message.content
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

