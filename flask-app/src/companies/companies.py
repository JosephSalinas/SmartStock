from flask import Blueprint, request, jsonify, make_response
from src import db
import logging
from pymysql.err import OperationalError

# define a logger for debugging
logger = logging.getLogger(__name__)

companies = Blueprint('companies', __name__)

@companies.route('/update-listing')
def get_update_form():

     return '''
        <h2>Update Stock Listing Information</h2>
        <h3>All Fields are required.</h3>

        <form action="/companies/update-listing/success" method="POST">
        <label for="stockid">StockID:</label><br>
        <input type="number" id="stockid" name="stockid" required><br><br>

        <h3>New Stock information</h3>
        <label for="name">Stock Name:</label><br> 
        <input type="text" id="name" name="name" required><br>
        <label for="available">Available shares:</label><br>
        <input type="number" id="available" name="available" required><br>
        <label for="limit">Customer purchase limit:</label><br>
        <input type="number" id="limit" name="limit" required><br>
        <label for="price">Individual Share Price:</label><br> 
        <input type="text" id="price" name="price" value="$" required><br>
        <input type="submit" value="Update Your Listing">
        </form>
    '''

@companies.route('/update-listing/success', methods=['POST'])
def post_admin_form(): 
    '''
    POST: Allows a company to edit their stock listing
    '''
    # get the form data for the updated listing
    stock_id = request.form['stockid']
    name = request.form['name']
    share_count = request.form['available']
    limit = request.form['limit']
    price = request.form['price']

    cursor = db.get_db().cursor()
    query = (
        f"UPDATE Stock SET Name = \"{name}\", QuantityAvailable = \"{share_count}\", " 
        f"PurchaseLimit = \"{limit}\", currPrice = \"{price}\" WHERE StockID = \"{stock_id}\";"
    )
    
    #try:
    cursor.execute(query)
    #except OperationalError as e:
    #    logger.warning(f'Error updating the stock.')
    #    response = make_response({'message': 'Error updating stock. Ensure values are correct.'})
    #   response.status_code = 422
    #    return response

    db.get_db().commit()

    response = make_response({'message': 'Your stock listing has successfully been updated.'})
    response.status_code = 200
    return response
