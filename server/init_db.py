import os
import psycopg2

conn = psycopg2.connect(
    host="localhost",
    dbname=os.getenv('DB_NAME'),
    user=os.getenv('DB_USERNAME'),
    password=os.getenv('DB_PASSWORD')
)

cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS helloworld;')
cur.execute('CREATE TABLE helloworld (id serial PRIMARY KEY,'
            'title varchar (150) NOT NULL,'
            'date_added date DEFAULT CURRENT_TIMESTAMP);'
            )

cur.execute('INSERT INTO helloworld (id, title) VALUES (%s, %s)',
            (1, 'Hello, world! Let the cosmos pair'))

conn.commit()

cur.close()
conn.close()
