# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spinner = TTY::Spinner.new('[:spinner] Cadastrando Moedas...')
spinner.auto_spin

coins = [
  {
    description: 'Bitcoin',
    acronym: 'BTC',
    url_image: 'https://pbs.twimg.com/profile_images/1095722266011291650/Vbrd6Kvu_400x400.jpg'
  },
  {
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://concourseopen.com/blog/wp-content/uploads/2019/07/1200px-Ethereum_logo_2014.svg_-300x300.png'
  },
  {
    description: 'Real',
    acronym: 'Real',
    url_image: 'https://ogimg.infoglobo.com.br/in/2912086-6d1-c23/FT1086A/652/xAs-novas-cedulas-de-realDivulgacao.jpg.pagespeed.ic.neOuUUYPT0.jpg'
  }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success('(Concluído!)')
