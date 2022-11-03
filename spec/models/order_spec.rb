require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)

    expect(order.customer).to be_kind_of(Customer) 
  end
  it 'Tem 3 pedidos -- create_list' do 
    orders = create_list(:order, 3) #cria 3 pedidos com o list e o parametro 
    
    expect(orders.count).to eq(3) 
  end
  it 'has_many' do 
    customer = create(:customer, :with_orders, qtt_orders: 5) #sobrescreve a qtt para 5 e não precisa utilizar o create_list por causa da factory qtt_orders
    # outra opção: customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(5) 
  end

end
