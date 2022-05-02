from flask import Flask
import yaml

app = Flask(__name__)

file = open("config/config.yaml")
config = yaml.load(file, Loader=yaml.FullLoader)
address = config['server']['listen']['address']
port = config['server']['listen']['port']


@app.route('/', methods=['GET'])
def hello_world():
    return 'Hello Doodle'


if __name__ == '__main__':
    app.run(host=address, port=port)
