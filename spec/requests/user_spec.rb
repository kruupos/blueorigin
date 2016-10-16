RSpec.describe API::UserController do
  describe '#list' do

    context 'user list is empty' do
      it 'should expect: success, 200, []' do
        get '/api/user/list'
        expect(JSON.parse(body, symbolize_names: true)).to eq([])
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context 'user list have items' do
      let!(:users) { create_list(:user, 10) }

      it 'should expect: success, 200, the json list of the users' do
        expected = users.map(&:summary)
        get '/api/user/list'
        expect(JSON.parse(body, symbolize_names: true)).to eq(JSON.parse(expected.to_json, symbolize_names: true))
        expect(response).to be_success
        expect(response.status).to eq(200)     
      end
    end

  end
end