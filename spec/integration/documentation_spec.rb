require 'swagger_helper'
# describe 'User API' do
#   path 'api/v1/sessions' do

#     post 'Creates a user' do
#       tags 'User'
#       consumes 'application/json'

#       parameter name: :user, in: :body, schema: {
#         type: :object,
#         properties: {
#           name: { type: :string }
#         },
#         required: [ 'name' ]
#       }

#       response '200', 'user created' do
#         let(:user) { { title: 'Tester' } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:user) { { name: '' } }
#         run_test!
#       end
#     end
#   end
# end

# # Houses Endpoint
# describe 'Houses API' do
#   path 'api/v1/users/{user_id}/houses' do

#     get 'Retrieves all houses' do
#       tags 'Houses'
#       produces 'application/json'

#       response '200', 'ok' do
#         schema type: :object,
#           properties: {
#             title: { type: :string },
#             house_description: { type: :string },
#             location: { type: :string },
#             image: { type: :string },
#             price: { type: :decimal },
#             availability: { type: :integer },
#             discount: { type: :integer },
#             user_id: { type: :integer }
#           },
#           required: [ 'title', 'house_description', 'location',
#                     'image', 'price', 'availability', 'discount','user_id' ]

#         let(:user_id) { User.create(name: 'Tester').id }
#         run_test!
#       end
#     end
#   end

#   path 'api/v1/users/{user_id}/houses/{id}' do

#     get 'Retrieves a house' do
#       tags 'Houses'
#       produces 'application/json'
#       parameter name: :user_id, :in => :path, :type => :string
#       parameter name: :id, :in => :path, :type => :string

#       response '200', 'ok' do
#         schema type: :object,
#         properties: {
#           title: { type: :string },
#           house_description: { type: :string },
#           location: { type: :string },
#           image: { type: :string },
#           price: { type: :decimal },
#           availability: { type: :integer },
#           discount: { type: :integer },
#           user_id: { type: :integer }
#         },
#         required: [ 'title', 'house_description', 'location', 'image', 'price', 'availability', 'discount','user_id' ]

#         let(:id) { User.create(name: 'Tester').id }
#         run_test!
#       end

#       response '404', 'house not found' do
#         let(:id) { 'invalid' }
#         run_test!
#       end
#     end
#   end

#   path 'api/v1/users/{user_id}/houses' do

#     post 'Creates a house' do
#       tags 'Houses'
#       consumes 'application/json'
#       parameter name: :user_id, :in => :path, :type => :string
#       parameter name: :house, in: :body, schema: {
#         type: :object,
#         properties: {
#           title: { type: :string },
#           house_description: { type: :string },
#           location: { type: :string },
#           image: { type: :string },
#           price: { type: :integer },
#           availability: { type: :integer },
#           discount: { type: :integer },
#           user_id: { type: :integer }
#         },
#         required: [ 'title', 'house_description', 'location', 'image', 'price', 'availability', 'discount','user_id' ]
#       }

#       response '200', 'house created' do
#         let(:house) { { title: 'House 1', house_description: 'Cozy house', location:'London',
# image:'', price:250, availability: 12, discount: 1.5, user_id: 1  } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:house) { { title: 'House 2' } }
#         run_test!
#       end
#     end
#   end

#   path '/api/v1/users/{user_id}/houses/{id}' do

#     delete 'Delete house' do
#       tags 'Houses'
#       consumes 'application/json'
#       produces 'application/json'
#       parameter name: :user_id, :in => :path, :type => :string
#       parameter name: :id, :in => :path, :type => :string

#       response '200', 'House deleted' do
#         let(:id) {create(:house).id}

#         run_test!
#       end
#     end
#   end

#   # Reservations Endpoint
# describe 'Reservations API' do
#   path 'api/v1/users/{user_id}/reservations' do

#     get 'Retrieves all reservations' do
#       tags 'Reservations'
#       produces 'application/json'
#       parameter name: :user_id, :in => :path, :type => :string
#       response '200', 'ok' do
#        schema type: :object,
#           properties: {
#             rent_duration: { type: :string },
#             rent_start_date: { type: :string },
#             rent_total_price: { type: :string },
#             user_id: { type: :integer }
#           },
#           required: [ 'rent_duration', 'rent_start_date', 'rent_total_price', 'user_id' ]

#         let(:user_id) { User.create(name: 'Tester').id }
#         run_test!
#       end
#     end
#   end

#   path 'api/v1/users/{user_id}/reservations' do

#     post 'Creates a reservation' do
#       tags 'Reservations'
#       consumes 'application/json'
#       parameter name: :user_id, :in => :path, :type => :string
#       parameter name: :reservation, in: :body, schema: {
#         type: :object,
#         properties: {
#           rent_duration: { type: :string },
#           rent_start_date: { type: :string },
#           rent_total_price: { type: :string },
#           user_id: { type: :integer },
#           house_ids: { type: :integer }
#         },
#         required: [ 'rent_duration', 'rent_start_date', 'rent_total_price', 'user_id', 'house_ids' ]
#       }

#       response '200', 'reservation created' do
#         let(:reservation) { { rent_duration: 6, rent_start_date: 'Cozy house', user_id: 1, house_ids:1  } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:reservation) { { rent_duration: 6 } }
#         run_test!
#       end
#     end
#   end

#   path '/api/v1/users/{user_id}/reservations/{id}' do

#     delete 'Delete reservation' do
#       tags 'Reservations'
#       consumes 'application/json'
#       produces 'application/json'
#       parameter name: :user_id, :in => :path, :type => :string
#       parameter name: :id, :in => :path, :type => :string

#       response '200', 'Reservation deleted' do
#         let(:id) {create(:reservation).id}

#         run_test!
#       end
#     end
#   end
#   end

# end
