class UserStocksController < ApplicationController
    def create 
        # debugger
        # find the stock by ticker symbol from the params in the db or create a new stock
        stock = Stock.check_db(params[:ticker_symbol])

        # if the stock is not in the db, create a new stock
        if stock.blank?
            # call the new_lookup method from the Stock model to create a new stock
            stock = Stock.new_lookup(params[:ticker_symbol])
            stock.save
        end

        # create a new user_stock with the current_user and the stock
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio."
        redirect_to my_portfolio_path
    end

    def destroy 
        # find the stock by id from the params
        stock = Stock.find(params[:id])

        # find the user_stock by the current_user and the stock
        user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first # first is used to return the first record in the db because where returns an array of records

        # destroy the user_stock
        user_stock.destroy
        flash[:notice] = "#{stock.ticker_symbol} was successfully removed from your portfolio."
        redirect_to my_portfolio_path
    end
end
