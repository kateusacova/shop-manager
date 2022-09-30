require_relative "../lib/database_connection.rb"
require_relative "../lib/item.rb"

class ItemRepository
  def all
    query = "SELECT id, name, price, quantity FROM items;"
    params = []
    result = DatabaseConnection.exec_params(query, params)
    
    items = []

    result.each {|record|
      items << object_to_item(record)
    }
    
    items
  end

  def create(item)
    query = "INSERT INTO items (name, price, quantity) VALUES ($1, $2, $3);"
    params = [item.name, item.price, item.quantity]
    result = DatabaseConnection.exec_params(query, params)
  end

  def find(id)
    query = "SELECT id, name, price, quantity FROM items WHERE id = $1;"
    params = [id]
    result = DatabaseConnection.exec_params(query, params)

    object_to_item(result[0])
  end

  def update(item)
    query = "UPDATE items SET name = $1, price = $2, quantity = $3 WHERE id = $4;"
    params = [item.name, item.price, item.quantity, item.id]
    result = DatabaseConnection.exec_params(query, params)
  end

  private

  def object_to_item(record)
    item = Item.new
    item.id = record["id"]
    item.name = record["name"]
    item.price = record["price"]
    item.quantity = record["quantity"]

    item
  end
end