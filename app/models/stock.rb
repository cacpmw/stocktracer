class Stock < ApplicationRecord

  def self.lookup_price(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:key],
      endpoint: Rails.application.credentials.iex[:endpoint]
    )
    client.price(ticker_symbol)
  end
end
