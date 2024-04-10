# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

spinner = TTY::Spinner.new("[:spinner] Registering coins")
spinner.auto_spin

coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
  },

  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png"
  },

  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/660.png"
  }
]

# caso ocorra algum erro (por isso tem o !) com a criação de uma moeda, realiza o método
coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("(Success)")
