require_relative "../lib/database_connection.rb"

class OrderRepository
  def all
    query = "SELECT id, customer_name, order_date FROM orders;"
    params = []
    result = DatabaseConnection.exec_params(query, params)
  end
end