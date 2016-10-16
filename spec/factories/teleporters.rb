FactoryGirl.define do
  factory :teleporter do
    schedule_id { FactoryGirl.create(:schedule).id }
    user_id { FactoryGirl.create(:user).id }
  end
end