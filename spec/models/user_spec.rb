RSpec.describe User, type: :model do
  describe 'create specification' do
    it 'has a valid factory' do
      expect(create(:user)).to be_valid
    end

    it 'is invalid without name' do
      expect(build(:user, name: nil)).not_to be_valid
    end

    it "is invalid if name's lenght < 2" do
      expect(build(:user, name: 'm')).not_to be_valid
      expect(build(:user, name: 'max')).to be_valid
    end

    it 'does not allow duplicate regardless case sensitive' do
      create(:user, name: 'Max')
      expect(build(:user, name: 'maX')).not_to be_valid
    end

    it 'capitalize name after create' do
      user = create(:user, name: 'max')
      expect(user.name).to eq('Max')
    end

    it { is_expected.to have_one(:teleporter) }
  end

  describe '#summary' do
    let(:user) { create(:user, name: 'Max') }

    it 'should output only the id and name' do
      expect(user.summary).to eq(id: user.id, name: user.name)
    end
  end
end