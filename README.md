# SmartStock

SmartStock is a web application showcasing a proof-of-concept stock-trading and portfolio manager.
Using Flask connected to a MySQL database, data exists within 3 primary entities: Customers,
Admins, and Companies. Each persona can interact with the application in specific ways, leveraging existing data or creating new data.

## Querying Example 

```python
@customers.route('/stocks/<stock_id>/info', methods=['GET'])
def get_stock_info(stock_id):
    '''
    GET: Returns detailed data for a specific stock.
    '''
    cursor = db.get_db().cursor()

    query = f'SELECT * FROM Stock WHERE Stock.StockID = {stock_id};'
```

Each defined route, such as the one above, issues a database query to fetch, insert, or update data.