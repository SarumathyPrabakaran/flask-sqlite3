from flask import Flask, request,render_template
from sqlitedb import insert,select, create_table, table_exists
from details import Details
app = Flask(__name__)

TABLE_NAME = 'Users'


@app.route('/',methods=['GET','POST'])
def home():
    data = []
    if(request.method=='POST'):
        if not table_exists(TABLE_NAME):
            create_table(TABLE_NAME)

        name = request.form.get('name')
        city = request.form['city']
        
        print(name,city)

        data = Details(name,city)
        insert(TABLE_NAME, data)

        
        print("Successfully Added.")
        data  = select(TABLE_NAME)
    return render_template('index.html',data=data)


if(__name__ == '__main__'):
    app.run(debug=True, host="0.0.0.0")