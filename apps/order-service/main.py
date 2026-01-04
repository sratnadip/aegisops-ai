from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/order")
def create_order(order: dict):
    return {"order_id": "12345", "status": "CREATED"}

