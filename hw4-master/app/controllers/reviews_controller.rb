require 'date'
class ReviewsController < ApplicationController
    
    def create
    end
    
    def show
        current_time = DateTime.now
        current_time.strftime "%d/%m/%Y %H:%M"
        current_time.next_month.strftime "%d/%m/%Y %H:%M"
        r = Review.new
        r.product_id = params[:id]
        r.rating = params["rating"]
        r.content = params["content"]
        r.created_at = current_time
        r.save
        
        redirect_to "/products/" + params[:id], notice: 'Review successfully posted.'
    end

end
