class Stock < ApplicationRecord
    
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_publishable_token,
            secret_token: Rails.application.credentials.iex_secret_token,
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        client.price(ticker_symbol)
    end
end
