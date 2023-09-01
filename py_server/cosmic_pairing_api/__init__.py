import os
from dotenv import load_dotenv, find_dotenv
import psycopg2
from flask import Flask, jsonify
from flask_cors import CORS

from .mocks.signs import SIGNS


load_dotenv(find_dotenv())


def get_db_connection():
    conn = psycopg2.connect(host='localhost',
                            database=os.getenv('DB_NAME'),
                            user=os.getenv('DB_USERNAME'),
                            password=os.getenv('DB_PASSWORD'))
    return conn


def create_app(test_config=None):

    app = Flask(__name__, instance_relative_config=True)

    app.config.from_mapping(
        SECRET_KEY=os.environ.get("SECRET_KEY"),
    )

    # TODO: enable CORS
    # CORS(app, resources={r"/*": {"origins": "*"}})

    if test_config is None:
        app.config.from_pyfile("config.py", silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # sanity check
    @app.route("/ping", methods=["GET"])
    def ping_pong():
        return jsonify("pong!")

    # mock
    @app.route("/signs", methods=["GET"])
    def get_signs():
        return jsonify({
            "code": 200,
            "status": "success",
            "signs": SIGNS
        })

    @app.route("/test", methods=["GET"])
    def get_test():
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT * FROM helloworld;")
        hello = cur.fetchall()
        cur.close()
        conn.close()

        return jsonify({
            "code": 200,
            "status": "success",
            "result": hello[0][1]
        })
    
    @app.teardown_appcontext
    def close_db(error):
        get_db_connection().close()
    
    return app
