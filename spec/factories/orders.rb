FactoryBot.define do
  factory :order do
    sequence(:description) {|n| "Pedido número - #{n}"}
    customer #já faz a ligação com o customer devido a FK
  end
end
