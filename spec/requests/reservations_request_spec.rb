require 'rails_helper'

RSpec.describe 'Reservations API', type: :request do
  describe 'GET /reservations' do
    before do 
      user = User.create(name: 'Tester')
      house = House.create(title:"House_1", house_description:'First house description', location:'London', image:'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', price:250, availability:24, discount:2.5, user:user)
            
      reservation1 = Reservation.create(rent_duration:12, rent_start_date: "2021-12-12", rent_total_price:house.price*12, user:user)
      reservation1.house_ids=house.id

      reservation2 = Reservation.create(rent_duration:6, rent_start_date: "2021-12-12", rent_total_price:house.price*6, user:user)
      reservation2.house_ids=house.id

      get "/api/v1/users/#{user.id}/reservations" 
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
    
    it 'returns reservations' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
  end

  describe 'POST /reservations' do
    before do 
      @user = User.create(name: 'Tester')
      @house = House.create(title:"House_1", house_description:'First house description', location:'London', image:'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', price:250, availability:24, discount:2.5, user:@user)
    end

    it 'creates a new reservation' do
     expect{
       post "/api/v1/users/#{@user.id}/reservations", params: {
         reservation:{
          rent_duration:"6",
          rent_start_date:"2021-12-12",
          rent_total_price:"100",
          user_id: @user.id,
          house_ids: @house.id
         }
       }
      }.to change {Reservation.count}.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /reservations/:id' do
    before do 
      @user = User.create(name: 'Tester')
      @house = House.create(title:"House_1", house_description:'First house description', location:'London', image:'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', price:250, availability:24, discount:2.5, user:@user)
      @reservation = Reservation.create(rent_duration:6, rent_start_date:"2021-12-12", rent_total_price:"1500", user:@user)
      @reservation.house_ids = @house.id
    end

    it 'deletes a reservation' do
      expect{
        delete "/api/v1/users/#{@user.id}/reservations/#{@reservation.id}"
      }.to change {@user.reservations.count}.from(1).to(0)
      
      expect(response).to have_http_status(:no_content)
    end
  end

end