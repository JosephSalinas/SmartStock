from flask import Blueprint, request, jsonify, make_response
from src import db
import logging
from pymysql.err import OperationalError

# define a logger for debugging
logger = logging.getLogger(__name__)

customers = Blueprint('customers', __name__)

@customers.route('/stocks', methods=['GET'])
def get_company_stock_list():
    '''
    GET: Return a list of available company stocks to purchase.
    '''
    cursor = db.get_db().cursor()
    query = (
        '''
        SELECT DISTINCT Company.Name as Company, Stock.Name as Stock
        FROM Company JOIN Company_Invoice ON Company.CompanyID = Company_Invoice.CompanyID
        JOIN Stock ON Company_Invoice.StockID = Stock.StockID;
        '''
    )
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

@customers.route('/stocks/<user_id>', methods=['GET'])
def get_customer_stock_list(user_id):
    '''
    GET: Return a list of the user's stocks and their current price.
    '''
    cursor = db.get_db().cursor()

    query = (
        f'''
        SELECT DISTINCT Stock.Name as Stock, Stock.CurrPrice as Price
        FROM Customer JOIN Customer_Transactions ON Customer.CustID = Customer_Transactions.CustomerID
        JOIN Stock ON Customer_Transactions.StockID = Stock.StockID
        WHERE Customer.CustID = {user_id}
        ORDER BY Stock.Name ASC;
        '''
    )
    try:
        cursor.execute(query)
    except OperationalError as e:
        logger.warning(f'User {user_id} is invalid.')
        response = make_response({'message': 'Given userID is an invalid data type.'})
        response.status_code = 422
        return response

    row_headers = [x[0] for x in cursor.description]

    json_data = []
    data = cursor.fetchall()

    for row in data:
        json_data.append(dict(zip(row_headers, row)))

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

@customers.route('/stocks/<stock_id>/info', methods=['GET'])
def get_stock_info(stock_id):
    '''
    GET: Returns detailed data for a specific stock.
    '''
    cursor = db.get_db().cursor()

    query = f'SELECT * FROM Stock WHERE Stock.StockID = {stock_id};'

    try:
        cursor.execute(query)
    except OperationalError as e:
        logger.warning(f'Stock {stock_id} is invalid.')
        response = make_response({'message': 'Given stockID is an invalid data type.'})
        response.status_code = 422
        return response

    row_headers = [x[0] for x in cursor.description]

    json_data = []
    data = cursor.fetchall()

    for row in data:
        json_data.append(dict(zip(row_headers, row)))

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

@customers.route('/companies/<company_id>/info', methods=['GET'])
def get_company_info(company_id):
    '''
    GET: Returns detailed financial data for a given company.
    '''
    cursor = db.get_db().cursor()

    query = (
        'SELECT * FROM Revenue '
        f'WHERE Revenue.CompanyID = {company_id} '
        'UNION '
        'SELECT * FROM Market_Share '
        f'WHERE Market_Share.CompanyID = {company_id} '
        'UNION '
        'SELECT * FROM Profit '
        f'WHERE Profit.CompanyID = {company_id};'
    )

    try:
        cursor.execute(query)
    except OperationalError as e:
       logger.warning(f'Stock {company_id} is invalid.')
       response = make_response({'message': 'Given stockID is an invalid data type.'})
       response.status_code = 422
       return response

    row_headers = [x[0] for x in cursor.description]

    json_data = []
    data = cursor.fetchall()

    for row in data:
        json_data.append(dict(zip(row_headers, row)))

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

@customers.route('/register')
def get_account_form():

     return '''
        <h2>1. Account Registration</h2>
        <h3>All Fields are required.</h3>

        <form action="/customers/register/success" method="POST">
        <label for="first">First Name:</label><br>
        <input type="text" id="first" name="first" value="John" required><br>
        <label for="last">Last Name:</label><br> 
        <input type="text" id="last" name="last" value="Doe" required><br>
        <label for="phone">Phone Number:</label><br>
        <input type="text" id="phone" name="phone" value="(xxx) xxxxxxx" required><br>
        <label for="dob">Date of Birth:</label><br>
        <input type="text" id="dob" name="dob" value="yyyy-mm-dd" required><br>

        <h2>2. Financial History</h2>
        <h3>Please answer a few financial questions.</h3>
        <label for="credit">Current Credit Score:</label><br>
        <input type="number" id="credit" name="credit" required><br>
        <label for="income">Annual household income:</label><br>
        <input type="text" id="income" name="income" required><br>
      
        <h2>3. Verification</h2>
        <h3>We need to verify your identity for security purposes before you can make purchases.</h3>
        <label for="document">Document Type:</label><br>
        <select name="documents" id="document">
        <option value="passport">Passport</option>
        <option value="stateid">StateID</option></select><br>
        <label for="auth">Authorization Number:</label><br>
        <input type="text" id="auth" name="auth" required><br><br>
        <input type="submit" value="Create Account!">
        </form>
    '''

@customers.route('/register/success', methods=['POST'])
def post_account_form():
    '''
    POST: Return a comprehensive list of customers of whom the admin was a support rep for.
    '''
    # Get all information from form
    f_name = request.form['first']
    l_name = request.form['last']
    phone = request.form['phone']
    dob = request.form['dob']

    credit = request.form['credit']
    income = request.form['income']

    doc_type = request.form['documents']
    auth_id = request.form['auth']

    cursor = db.get_db().cursor()

    # Insert customer data
    query1 = (
        f'INSERT INTO Customer(First_Name, Last_Name, DOB, Phone) VALUES(\"{f_name}\", \"{l_name}\", \"{dob}\", \"{phone}\");'
    )
    try:
        cursor.execute(query1)
    except OperationalError as e:
       logger.warning('Customer table insert query failed')
       response = make_response(
        {'message': 'An unexpected error occurred when creating your account. ' +  
        'Ensure each field in step 1 was entered correctly.'}
        )
       response.status_code = 422
       return response
    
    db.get_db().commit()
   
    # Insert financial details data
    query2 = f'INSERT INTO Customer_Finance_Details(CreditScore, Income) VALUES(\"{credit}\", \"{income}\")'

    try:
        cursor.execute(query2)
    except OperationalError as e:
       logger.warning('Financial details insert query failed')
       response = make_response(
        {'message': 'An unexpected error occurred when creating your account. ' +  
        'Ensure each field in step 2 was entered correctly.'}
        )
       response.status_code = 422
       return response
    
    db.get_db().commit()

     # Insert authentication data
    query3 = f'INSERT INTO Authentication(Type, AuthNum) VALUES(\"{doc_type}\", \"{auth_id}\")'
    try:
        cursor.execute(query3)
    except OperationalError as e:
       logger.warning('Authentication table insert query failed')
       response = make_response(
        {'message': 'An unexpected error occurred when creating your account. ' +  
        'Ensure each field in step 3 was entered correctly.'}
        )
       response.status_code = 422
       return response
    
    db.get_db().commit()

    response = make_response({'message': 'Your account has been successfully created.'})
    response.status_code = 200
    return response
