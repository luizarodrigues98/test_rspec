require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem 1 pedido' do
    order = create(:order)

    expect(order.customer).to be_kind_of(Customer) 
  end
  it 'Tem 3 pedidos' do 
    orders = create_list(:order, 3) #cria 3 pedidos com o list e o parametro 

    expect(orders.count).to eq(3) 
  end
end
