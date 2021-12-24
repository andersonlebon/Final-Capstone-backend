require 'rails_helper'

RSpec.describe 'Houses API', type: :request do
  describe 'GET /houses' do
    before do
      user = User.create(name: 'Tester')
      House.create(title: 'House_1', house_description: 'First house description', location: 'London',
                   image: 'img_url', price: 250, availability: 24, discount: 2.5, user: user)
      House.create(title: 'House_2', house_description: 'Second house description', location: 'Rome',
                   image: 'img_url', price: 350, availability: 12, discount: 2.5, user: user)
      House.create(title: 'House_3', house_description: 'Third house description', location: 'Paris',
                   image: 'img_url', price: 450, availability: 12, discount: 3, user: user)
      get '/api/v1/users/1/houses'
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns houses' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
  end

  describe 'GET /houses/:id' do
    before do
      user = User.create(name: 'Tester')
      house1 = House.create(title: 'House_1', house_description: 'First house description', location: 'London',
                            image: 'img_url', price: 250, availability: 24, discount: 2.5, user: user)
      House.create(title: 'House_2', house_description: 'Second house description', location: 'Rome',
                   image: 'img_url', price: 350, availability: 12, discount: 2.5, user: user)
      House.create(title: 'House_3', house_description: 'Third house description', location: 'Paris',
                   image: 'img_url', price: 450, availability: 12, discount: 3, user: user)

      get "/api/v1/users/#{user.id}/houses/#{house1.id}"
    end

    it 'returns the house with id=1' do
      json = JSON.parse(response.body)
      expect(json['title']).to eq('House_1')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /houses' do
    before do
      @user = User.create(name: 'Tester')
    end

    it 'creates a new house' do
      expect do
        post "/api/v1/users/#{@user.id}/houses", params: {
          house: {
            title: 'House_4',
            house_description: 'Fourth house description',
            location: 'Berlin',
            image: 'no-image',
            price: 150,
            availability: 24,
            discount: 2.5,
            user_id: @user.id
          }
        }
      end.to change { House.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /houses/:id' do
    before do
      @user = User.create(name: 'Tester')
      @house1 = House.create(title: 'House_1', house_description: 'First house description', location: 'London',
                             image: 'img_url', price: 250, availability: 24, discount: 2.5, user: @user)
      @house2 = House.create(title: 'House_2', house_description: 'Second house description', location: 'Rome',
                             image: 'img_url', price: 350, availability: 12, discount: 2.5, user: @user)
      @house3 = House.create(title: 'House_3', house_description: 'Third house description', location: 'Paris',
                             image: 'img_url', price: 450, availability: 12, discount: 3, user: @user)
    end

    it 'deletes a house' do
      expect do
        delete "/api/v1/users/#{@user.id}/houses/#{@house1.id}"
      end.to change { House.count }.from(3).to(2)

      expect(response).to have_http_status(:no_content)
    end
  end
end
