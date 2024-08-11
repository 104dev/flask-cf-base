from flask import Flask, request, jsonify
import psycopg2
import logging
from psycopg2.extras import RealDictCursor

logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host='db',
        database='mydatabase',
        user='myuser',
        password='mypassword'
    )
    return conn

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/data', methods=['POST'])
def save_data():
    data = request.json
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO mytable (name, value) VALUES (%s, %s)',
        (data['name'], data['value'])
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'status': 'success'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
