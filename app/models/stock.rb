class Stock < ApplicationRecord
    # Validations
    validates :name, :ticker_symbol, presence: true, uniqueness: { case_sensitive: false}

    # Assciations
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_publishable_token,
            secret_token: Rails.application.credentials.iex_secret_token,
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        begin
            new(ticker_symbol: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))   
        rescue => exception
            return nil
        end
    end

    def self.check_db(ticker_symbol)
        where(ticker_symbol: ticker_symbol).first
    end
end
