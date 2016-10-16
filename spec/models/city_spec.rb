RSpec.describe City, type: :model do
  describe 'summary' do
    let(:city) { create(:city, name: 'Paris', country: 'France') }

    it 'should output only the id, name and country' do
      expect(city.summary).to eq(id: 1, name: 'Paris', country: 'France')
    end
  end
end