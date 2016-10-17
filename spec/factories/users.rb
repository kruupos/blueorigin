FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "anon #{n}"
    end
  end
end