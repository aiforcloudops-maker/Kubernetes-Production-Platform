from flask import Flask, jsonify
import os
import socket

app = Flask(__name__)


@app.get("/")
def home():
    return jsonify(
        {
            "application": "AI Cloud Labs Kubernetes Platform",
            "status": "running",
            "hostname": socket.gethostname(),
            "environment": os.getenv("ENVIRONMENT", "development"),
        }
    )


@app.get("/health")
def health():
    return jsonify({"status": "healthy"})


@app.get("/ready")
def ready():
    return jsonify({"status": "ready"})


@app.get("/metrics")
def metrics():
    return "app_up 1\n"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
