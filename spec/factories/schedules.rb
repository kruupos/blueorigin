FactoryGirl.define do
  factory :schedule do
    sequence :date do |n|
      "#{n}".days.from_now
    end
    departure_id { FactoryGirl.create(:city).id }
    arrival_id { FactoryGirl.create(:city).id }
  end
end