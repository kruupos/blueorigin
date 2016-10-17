FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "ville #{n}"
    end
    sequence :country do |n|
      "Fake country#{n}"
    end
    latitude 20.0
    longitude 20.0
  end
end