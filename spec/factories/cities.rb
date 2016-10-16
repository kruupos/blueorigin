FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "Fake city#{n}"
    end
    sequence :country do |n|
      "Fake country#{n}"
    end
  end
end