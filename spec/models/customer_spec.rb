require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers #invoca o nome da fixture que ta na pasta fixture e o nome 
  # pode utilizar fixtures :all e utiliza todas
  it 'Create a Customer' do
    customer = customers(:jose)

    expect(customer.full_name).to eq('Sr.Jose da Silva')
  end
end
