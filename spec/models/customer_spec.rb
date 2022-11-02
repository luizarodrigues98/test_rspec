require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr.")
  end

  it '#full_name -- Sobrescrevendo atributo' do
    customer = create(:user, name: "Jackson Pires", vip: false, days_to_pay: 10)
    expect(customer.full_name).to start_with("Sr.Jackson Pires")
    expect(customer.vip).to eq(false)
  end

  it '#Herança vip' do
    customer = create( :customer_vip)
    expect(customer.vip).to eq(true)
  end

  it '#Herança default' do
    customer = create( :customer_default)
    expect(customer.vip).to eq(false)
  end
  
  it { expect { create(:customer)}.to change {Customer.all.size}.by(1) }
end
