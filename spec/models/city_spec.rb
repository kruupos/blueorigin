RSpec.describe City, type: :model do
	describe 'create specification' do
    it 'has a valid factory' do
      expect(create(:city)).to be_valid
    end

    context 'is invalid ' do
      it 'without name' do
        expect(build(:city, name: nil)).not_to be_valid
      end

      it 'without country' do
        expect(build(:city, country: nil)).not_to be_valid
      end

      it 'without longitude' do
        expect(build(:city, longitude: nil)).not_to be_valid
      end

      it 'without latitude' do
        expect(build(:city, latitude: nil)).not_to be_valid
      end
    end

    context 'it capitalize after create' do
      it 'capitalize name' do
        city = create(:city, name: 'paris')
        expect(city.name).to eq('Paris')
      end

      it 'capitalize country' do
        city = create(:city, country: 'france')
        expect(city.country).to eq('France')
      end
    end

    context 'is unique on pair -- country, name' do
      it 'allows same name with different county' do
        create(:city, name: 'Paris', country: 'France')
        expect(build(:city, name: 'Paris', country: 'USA')).to be_valid
      end

      it 'forbid same name on country twice' do
        create(:city, name: 'Paris', country: 'France')
        expect(build(:city, name: 'Paris', country: 'France')).not_to be_valid
      end
    end

    context 'inheritence' do
      it { is_expected.to have_one(:departure).with_foreign_key('departure_id') }
      it { is_expected.to have_one(:arrival).with_foreign_key('arrival_id') }
    end
  end

  describe '#summary' do
    let(:city) { create(:city, name: 'Paris', country: 'France') }

    it 'should output only the id, name and country' do
      expect(city.summary).to eq(id: city.id, name: city.name, country: city.country)
    end
  end
end