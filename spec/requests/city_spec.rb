RSpec.describe API::CityController do
  describe '#list' do

    context 'city list is empty' do
      it 'should expect: success, 200, []' do
        get '/api/city/list'
        expect(JSON.parse(body, symbolize_names: true)).to eq([])
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

    context 'city list have items' do
      let!(:cities) { create_list(:city, 10) }

      it 'should expect: success, 200, the json list of cities' do
        expected = cities.map(&:summary)
        get '/api/city/list'
        expect(JSON.parse(body, symbolize_names: true)).to eq(JSON.parse(expected.to_json, symbolize_names: true))
        expect(response).to be_success
        expect(response.status).to eq(200)     
      end
    end

  end
end