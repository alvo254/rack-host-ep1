class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

    get '/reviews' do
      restaurant = Restaurant.all
        restaurant.to_json(include: {reviews: {only: [:body], include: {user: {only: [:name]}}}})
      end

      post '/reviewss' do
        review = Review.create(
          body: params[:body],
          restaurant_id: params[:restaurant_id],
          user_id: params[:user_id]
        )
        review.to_json
      end

      get '/reviewss' do
        reviewss = Review.all
        reviewss.to_json

      end

      get '/users' do
        users = User.all
        users.to_json
      end

      # resutrants routes

      get '/restaurants' do 
        restaurant = Restaurant.all
        restaurant.to_json
      end

      post '/restaurants' do
        restaurant = Restaurant.create(
          name: params[:name],
          location: params[:location]
        )
        restaurant.to_json
    end
    
    delete '/restaurants/:id' do 
      restaurant = Restaurant.find(params[:id])
      restaurant.destroy
      restaurant.to_json
    end

    patch '/restaurants/:id' do 
      restaurant = Restaurant.find(params[:id])
       restaurant.update(
        name: params[:name],
        location: params[:location]
      )
      restaurant.to_json
    end

end