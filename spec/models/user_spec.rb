RSpec.describe User, type: :model do
  describe 'summary' do
    let(:user) { create(:user, name: 'Max') }

    it 'should output only the id and name' do
      expect(user.summary).to eq(id: 1, name: 'Max')
    end
  end
end