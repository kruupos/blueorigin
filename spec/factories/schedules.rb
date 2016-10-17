FactoryGirl.define do
  factory :schedule do
    date Date.today
    departure_id { create(:city).id }
    arrival_id { create(:city).id }
  end
end