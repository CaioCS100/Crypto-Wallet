namespace :dev do
  desc 'delete and create or just create some datas to use for tests in the system. 
  You must be using the developed environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Deleting DB...') { %x(rails db:drop:_unsafe) }
      show_spinner('Creating DB...') { %x(rails db:create) }
      show_spinner('Migrating BD...') { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      show_spinner('Deleting DB...', 'error', 'You must be using the developed environment')
    end
  end

  desc 'Create some Coins'
  task recreate_da: :environment do
  end

  desc 'Create some Coins'
  task add_coins: :environment do
    show_spinner('Creating coins...') do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZCRfwkqpPvFb3QmmwGONG2i6PsgnqZ3L7dRzCNlaSTB1-ruu5',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Real',
          acronym: 'Real',
          url_image: 'https://ogimg.infoglobo.com.br/in/2912086-6d1-c23/FT1086A/652/xAs-novas-cedulas-de-realDivulgacao.jpg.pagespeed.ic.neOuUUYPT0.jpg',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Iota',
          acronym: 'IOT',
          url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'ZCash',
          acronym: 'ZEC',
          url_image: 'https://www.cryptocompare.com/media/351360/zec.png',
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'Create some Mining Types'
  task add_mining_types: :environment do
    show_spinner('Creating Mining Types...') do
      mining_types = [
        { description: 'Proof of Work', acronym: 'PoW' },
        { description: 'Proof of Stake', acronym: 'PoS' },
        { description: 'Proof of Capacity', acronym: 'PoC' }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
 
  def show_spinner(msg_description, info_animation = 'success', msg_success_or_error = 'Success!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_description}")
    spinner.auto_spin
    if info_animation == 'success'
      yield
      spinner.success("(#{msg_success_or_error})")
    else
      spinner.error("(#{msg_success_or_error})")
    end
  end

  def database_exists
    ::ActiveRecord::Base.connection_pool.with_connection(&:active?) rescue false
  end
end
