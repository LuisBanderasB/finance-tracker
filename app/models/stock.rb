class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:p_token],
      secret_token: Rails.application.credentials.iex_client[:s_token],
      endpoint: 'https://cloud.iexapis.com/v1'
    )

    quote = client.quote(ticker_symbol)
    quote.latest_price
  end
end
