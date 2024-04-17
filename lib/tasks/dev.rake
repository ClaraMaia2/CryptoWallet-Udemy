namespace :dev do
  # task: configuração de ambiente de desenvolvimento
  desc "Configure development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting DB") do
        %x(rails db:drop:_unsafe)
      end

      show_spinner("Creating DB") do
        %x(rails db:create)
      end

      show_spinner("Migrating DB") do
        %x(rails db:migrate)
      end
      %x(rails dev:add_mining_types)

      %x(rails dev:add_coins)
    else
      puts "You are not in the development environment"
    end
  end

  # task: cadastro de moedas
  desc "Register coins"
  task add_coins: :environment do
    show_spinner("Registering coins") do
      spinner = TTY::Spinner.new("[:spinner] Registering coins")
      spinner.auto_spin

      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png",
          mining_type: MiningType.all.sample
        },

        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png",
          mining_type: MiningType.all.sample
        },

        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/660.png",
          mining_type: MiningType.all.sample
        },

        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://th.bing.com/th/id/OIP.SgREeOcfotvPsVKtQ990VgHaHa?rs=1&pid=ImgDetMain",
          mining_type: MiningType.all.sample
        },

        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://th.bing.com/th/id/R.60b8e09a20789f0e996e3adeac84362e?rik=Gc%2fcVhv2Tnoo2A&pid=ImgRaw&r=0",
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  # task: cadastro de tipos de mineração
  desc "Register mining types"
  task add_mining_types: :environment do
    show_spinner("Registering mining types") do
      spinner = TTY::Spinner.new("[:spinner] Registering mining types")
      spinner.auto_spin

      mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW"
        },

        {
          description: "Proof of Stake",
          acronym: "PoS"
        },

        {
          description: "Proof of Capacity",
          acronym: "PoC"
        }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  # função de definição de spinner para as tasks
  private
  def show_spinner(start_msg, end_msg="(Success)")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("#{end_msg}")
  end
end
