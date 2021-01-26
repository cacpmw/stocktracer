class Stock < ApplicationRecord
  def self.lookup_price(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:key],
      endpoint: Rails.application.credentials.iex[:endpoint]
    )
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name,
          last_price: client.price(ticker_symbol))
    rescue StandardError
      nil
    end
  end
end
