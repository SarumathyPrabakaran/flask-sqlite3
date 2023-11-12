import sqlite3

conn = sqlite3.connect('Users.db',check_same_thread=False)

c = conn.cursor()

def table_exists(table_name):

    c.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='{table_name}'")
    return c.fetchone()


def create_table(table_name):
    c.execute(f"CREATE TABLE {table_name}(id INTEGER PRIMARY KEY AUTOINCREMENT, name text, city text)")

def insert(table_name, data):
    with conn:
        c.execute(f'INSERT INTO {table_name}(name,city) VALUES (?,?)',(data.name,data.city))
    
def select(table_name):
    with conn:
        c.execute(f'SELECT * FROM {table_name}')
        return c.fetchall()
    
conn.commit()

