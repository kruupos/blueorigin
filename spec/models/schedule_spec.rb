RSpec.describe Schedule, type: :model do
	describe 'create specification' do
    it 'has a valid factory' do
      expect(create(:schedule)).to be_valid
    end

    context 'is invalid ' do
      it 'without arrival_id' do
        expect(build(:schedule, arrival_id: nil)).not_to be_valid
      end

      it 'without departure_id' do
        expect(build(:schedule, departure_id: nil)).not_to be_valid
      end

      it 'without date' do
        expect(build(:schedule, date: nil)).not_to be_valid
      end
    end

    context 'relationship' do
      it { is_expected.to belong_to(:departure).class_name('City') }
      it { is_expected.to belong_to(:arrival).class_name('City') }
      it { is_expected.to have_one(:teleporter) }
      it { is_expected.to validate_presence_of(:departure).on(:create) }
      it { is_expected.to validate_presence_of(:arrival).on(:create) }
    end

    context 'check arrival and departure' do
      let(:city_test) { create(:city) }

      it "arrival can't be the same as departure" do
        expect(build(:schedule, arrival_id: city_test.id, departure_id: city_test.id)).not_to be_valid
      end
    end

    context 'date validation' do
      it 'have to be formated with yyyy-mm-dd' do
        expect(build(:schedule, date: Time.now.utc.strftime("%Y-%m-%d"))).to be_valid
        expect(build(:schedule, date: Time.now.utc.strftime("%m/%d/%y"))).not_to be_valid
      end

      it 'have to start today' do
        expect(build(:schedule, date: 2.days.ago.utc.strftime("%Y-%m-%d"))).not_to be_valid
        expect(build(:schedule, date: Time.now.utc.strftime("%Y-%m-%d"))).to be_valid
      end
    end
  end
end