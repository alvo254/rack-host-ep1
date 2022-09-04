class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/reviews' do
      restaurant = Restaurant.all
        restaurant.to_json(include: {reviews: {only: [:body], include: {user: {only: [:name]}}}})
      end

      post '/reviews' do
        review = Review.create(
          body: params[:body],
          restaurant_id: params[:restaurant_id],
          user_id: params[:user_id]
        )
        review.to_json
      end
end