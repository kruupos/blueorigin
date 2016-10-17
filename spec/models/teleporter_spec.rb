RSpec.describe Teleporter, type: :model do
  describe 'create specification' do
    it 'has a valid factory' do
      expect(create(:teleporter)).to be_valid
    end

    context 'is invalid ' do
      it 'without user_id' do
        expect(build(:teleporter, user_id: nil)).not_to be_valid
      end

      it 'without schedule_id' do
        expect(build(:teleporter, schedule_id: nil)).not_to be_valid
      end
    end

    context 'inheritence' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to belong_to(:schedule) }
      it { is_expected.to validate_presence_of(:user).on(:create) }
      it { is_expected.to validate_presence_of(:schedule).on(:create) }      
    end

    context 'registration' do
      let(:user_a) { create(:user) }
      let(:user_list) { create_list(:user, 5) }
      let(:schedule_a) { create(:schedule) }
      let(:schedule_list) { create_list(:schedule, 5) }

      it 'users cannot register twice' do
        expect(create(:teleporter, user_id: user_a.id, schedule_id: schedule_a.id)).to be_valid
        expect(build(:teleporter, user_id: user_a.id, schedule_id: schedule_a.id)).not_to be_valid
      end

      it 'have no more than 4 users per schedule' do
        (0..3).each do |n|
          expect(create(:teleporter, user_id: user_list[n].id, schedule_id: schedule_a.id)).to be_valid
        end
        expect(create(:teleporter, user_id: user_list[4].id, schedule_id: schedule_a.id)).not_to be_valid
      end

      it 'test if output is right' do
        (0..2).each do |n|
          expect(create(:teleporter, user_id: user_list[n].id, schedule_id: schedule_a.id)).to be_valid
        end
        teleport = create(:teleporter, user_id: user_list[3].id, schedule_id: schedule_a.id)
        expect(teleport.success_text).not_to be_empty
      end
    end
  end
end