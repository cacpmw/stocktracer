class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.lookup_price(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/js/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid symbol'
          format.js { render partial: 'users/js/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a valid symbol'
        format.js { render partial: 'users/js/result' }
      end
    end
  end
end
