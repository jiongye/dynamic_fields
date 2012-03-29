FactoryGirl.define do

  factory :category do
    name "main category"
  end

  factory :subcategory do
    category

    sequence(:name) {|n| "subcategory#{n}" }
    active true
    access_level 1
  end

  factory :available_language do
    sequence(:name) {|n| "language#{n}" }
  end

end