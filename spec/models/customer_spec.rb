require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr.")
  end

  it '#full_name -- Sobrescrevendo atributo' do
    customer = create(:user, name: "Jackson Pires", vip: false, days_to_pay: 10)
    puts customer.email
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

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr.")

  end

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino VIP' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino VIP' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')

  end 

  it 'Cliente NÃO BINÁRIO VIP' do
    customer = create(:customer_no_binary_vip)
    expect(customer.gender).to eq('N Binário')
  end

  it { expect { create(:customer)}.to change {Customer.all.size}.by(1) }
end
