FactoryGirl.define do
  factory :rating do
    
  end
  factory :order do
    
  end
  factory :categories_product do
    
  end
  factory :category do
    
  end
  factory :user do
    
  end
  factory :product do
    name {Faker::Beer.name}
    description {Faker::Beer.style}
    price {Faker::Commerce.price}
    quantity {1}
    image {Faker::Placeholdit.image("50x50")}
  end
end
