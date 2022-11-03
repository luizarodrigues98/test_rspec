FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do 
      upcased {false}
    end

    name {Faker::Name.name}
    email {Faker::Internet.email}

    trait :male do
      gender { 'M' }
    end
    trait :female do
      gender { 'F' }
    end
    trait :no_binary do
      gender { 'N Binário' }
    end
    trait :vip do 
      vip { true }
      days_to_pay {30}
    end
    trait :default do
      vip { false }
      days_to_pay {15}
    end
    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_no_binary, traits: [:no_binary]
    
    factory :customer_vip, traits: [:vip]
    factory :customer_male_vip, traits: [:vip, :male]
    factory :customer_female_vip, traits: [:vip, :female]
    factory :customer_no_binary_vip, traits: [:vip, :no_binary]
    
    factory :customer_default, traits: [:default]
    factory :customer_male_default, traits: [:default, :male]
    factory :customer_female_default, traits: [:default, :female]
    factory :customer_no_binary_default, traits: [:default, :no_binary]

    after(:build) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end