import os

from flask import Flask, jsonify
from flask_cors import CORS

from cosmic_pairing_api.mocks.signs import SIGNS

def create_app(test_config=None):
  app = Flask(__name__, instance_relative_config=True)
  app.config.from_mapping(
    SECRET_KEY=os.environ.get('SECRET_KEY'),
    DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
  )

  # enable CORS
  CORS(app, resources={r'/*': {'origins': '*'}})

  if test_config is None:
    app.config.from_pyfile('config.py', silent=True)
  else:
    app.config.from_mapping(test_config)

  try:
    os.makedirs(app.instance_path)
  except OSError:
    pass

  # sanity check route
  @app.route('/ping', methods=['GET'])
  def ping_pong():
      return jsonify('pong!')

  # mock
  @app.route('/signs', methods=['GET'])
  def get_signs():
      return jsonify({
          'code': 200,
          'status': 'success',
          'signs': SIGNS
      })

  return app

