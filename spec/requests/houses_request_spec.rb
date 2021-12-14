require 'rails_helper'

RSpec.describe 'Houses API', type: :request do
  describe 'GET /houses' do
    before do 
      user = User.create(name: 'Tester')
      House.create(title:"House_1", house_description:'First house description', location:'London', image:'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', price:250, availability:24, discount:2.5, user:user)
      House.create(title:"House_2", house_description:'Second house description', location:'Rome', image:'https://images.unsplash.com/photo-1513584684374-8bab748fbf90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=865&q=80', price:350, availability:12, discount:2.5, user:user)
      House.create(title:"House_3", house_description:'Third house description', location:'Paris', image:'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=875&q=80', price:450, availability:12, discount:3, user:user)
      get '/api/v1/users/2/houses' 
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
    it 'returns houses' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

  end
end