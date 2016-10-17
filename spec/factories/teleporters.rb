FactoryGirl.define do
  factory :teleporter do
    schedule_id { create(:schedule).id }
    user_id { create(:user).id }
  end
end