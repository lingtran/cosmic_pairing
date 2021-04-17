import os
import json
from dotenv import load_dotenv, find_dotenv
from flask import Flask, jsonify, g
from flask_cors import CORS

from neo4j import GraphDatabase, basic_auth

from cosmic_pairing_api.mocks.signs import SIGNS


load_dotenv(find_dotenv())

def create_app(test_config=None):

    app = Flask(__name__, instance_relative_config=True)

    uri = os.getenv("NEO4J_URI")
    username = os.getenv("NEO4J_USERNAME")
    password =os.getenv("NEO4J_PW")
    neo4jVersion = os.getenv("NEO4J_VERSION", "")
    database = os.getenv("NEO4J_DATABASE", "neo4j")

    port = os.getenv("PORT")

    driver = GraphDatabase.driver(uri, auth=basic_auth(username, password))

    app.config.from_mapping(
        SECRET_KEY=os.environ.get("SECRET_KEY"),
        DATABASE=driver
    )

    # enable CORS
    CORS(app, resources={r"/*": {"origins": "*"}})

    if test_config is None:
        app.config.from_pyfile("config.py", silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # sanity check route
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


    # test hello world
    def get_db():
        if not hasattr(g, 'neo4j_db'):
            g.neo4j_db = driver.session()
        return g.neo4j_db


    @app.teardown_appcontext
    def close_db(error):
        if hasattr(g, 'neo4j_db'):
            g.neo4j_db.close()


    @app.route("/test", methods=["GET"])
    def get_test():
        def hello_world(tx):
            return tx.run(
                '''
                MATCH (n) WHERE EXISTS(n.name)
                RETURN DISTINCT "node" as entity, n.name AS name
                '''
            )

        db = get_db()
        results = db.read_transaction(hello_world)
        filtered_results = [record["name"] for record in results]

        return jsonify({
            "code": 200,
            "status": "success",
            "results": filtered_results
        })


    return app
