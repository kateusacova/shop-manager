require_relative "../lib/order_repository.rb"

def reset_tables
  seed_sql = File.read('spec/orders_items_seeds.sql')
  connection = PG.connect({ host: ENV['HOST'], dbname: 'shop_test', user: 'postgres', password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end

RSpec.describe OrderRepository do
  before(:each) do
    reset_tables
  end

  xit "Returns a list of Order objects" do
    repo = OrderRepository.new
    expect(repo.all.length).to eq 3

  end
end