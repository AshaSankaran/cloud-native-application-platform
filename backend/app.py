from flask import Flask, jsonify
import psycopg
import os

app = Flask(__name__)


DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "dbname": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "port": 5432
}

@app.route("/")
def home():
    return "Welcome to Cloud Native Application Platform"


@app.route("/health")
def health():
    return jsonify({"status": "healthy"})

@app.route("/ready")
def ready():
    try:
        conn = psycopg.connect(**DB_CONFIG)
        conn.close()

        return jsonify({
            "status": "ready"
        }), 200

    except Exception as e:
        return jsonify({
            "status": "not ready",
            "error": str(e)
        }), 503


@app.route("/version")
def version():
    return jsonify({
        "version": os.getenv("APP_VERSION")
    })


@app.route("/db-status")
def db_status():
    conn = psycopg.connect(**DB_CONFIG)

    cur = conn.cursor()
    cur.execute("SELECT service_name, status FROM app_status LIMIT 1")

    row = cur.fetchone()

    cur.close()
    conn.close()

    return jsonify({
        "service_name": row[0],
        "status": row[1]
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)