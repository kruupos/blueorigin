FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "Fake name#{n}"
    end
  end
end