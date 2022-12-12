from flask import Blueprint, request, jsonify, make_response
import json
from src import db

customers = Blueprint('customers', __name__)

# Get a list of available company stocks for customers to view
@customers.route('/stocks', methods=['GET'])
def get_company_stock_list():

    cursor = db.get_db().cursor()

    query = '''
        SELECT DISTINCT Company.Name as Company, Stock.Name as Stock
        FROM Company JOIN Company_Invoice ON Company.CompanyID = Company_Invoice.CompanyID
        JOIN Stock ON Company_Invoice.StockID = Stock.StockID;
    '''
    cursor.execute(query)

    column_headers = [x[0] for x in cursor.description]

    json_data = []
    data = cursor.fetchall()

    for row in data:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get customer detail for customer with particular userID
@customers.route('/stocks/monk', methods=['GET'])
def get_customer():
    cursor = db.get_db().cursor()

    query = '''
        SELECT DISTINCT Stock.Name as Stock, Stock.CurrPrice as Price
        FROM Customer JOIN Customer_Transactions ON Customer.CustID = Customer_Transactions.CustomerID
        JOIN Stock ON Customer_Transactions.StockID = Stock.StockID
        WHERE Customer.CustID = 5
        ORDER BY Stock.Name ASC;
    '''
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response