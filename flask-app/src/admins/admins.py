from flask import Blueprint, request, jsonify, make_response
from src import db
import logging
from pymysql.err import OperationalError

# define a logger for debugging
logger = logging.getLogger(__name__)

admins = Blueprint('admins', __name__)

@admins.route('/login')
def get_admin_form():
    '''
    Provides a form for which an admin can enter their adminID.
    Importantly, a production-level application would include some form of authentication.
    This form exists soley for querying functionality.
    '''
    return '''
        <h2>Admin Authentication Portal</h2>

        <form action="/admin/loginForm" method="POST">
        <label for="first">AdminID:</label><br>
        <input type="text" id="first" name="first" value="Your AdminID"<br>
        <input type="submit" value="Submit">
        </form>
    '''

@admins.route('/loginForm', methods=['POST'])
def post_admin_form():
    '''
    POST: Return a comprehensive list of customers of whom the admin was a support rep for.
    '''
    admin_id = request.form['first']

    cursor = db.get_db().cursor()
    query = (
        'SELECT * FROM Customer NATURAL JOIN Customer_Transactions ' 
        f'WHERE Customer.CustID = {admin_id};'
    )
    try:
        cursor.execute(query)
    except OperationalError as e:
        logger.warning(f'User {admin_id} is invalid.')
        response = make_response({'message': 'Given userID is an invalid data type.'})
        response.status_code = 422
        return response

    cursor.execute(query)

    column_headers = [x[0] for x in cursor.description]

    json_data = []
    data = cursor.fetchall()

    for row in data:
        json_data.append(dict(zip(column_headers, row)))

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

@admins.route('/userbase/<user_id>', methods=['GET'])
def get_user_info(user_id):
    '''
    GET: Return detailed information for a specific user.
    '''
    cursor = db.get_db().cursor()
    query = f'SELECT * FROM Customers WHERE Customers.CustID = {user_id}'

    try:
        cursor.execute(query)
    except OperationalError as e:
        logger.warning(f'User {user_id} is invalid.')
        response = make_response({'message': 'Given userID is an invalid data type.'})
        response.status_code = 422
        return response

    cursor.execute(query)

    column_headers = [x[0] for x in cursor.description]

    json_data = []
    data = cursor.fetchall()

    for row in data:
        json_data.append(dict(zip(column_headers, row)))

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response
