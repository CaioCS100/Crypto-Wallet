class WelcomeController < ApplicationController
  def index
    puts "Veio nulo ?:   #{@nome.nil?}"
    @nome.nil? ? @nome = 'Arroz' : @nome = params[:nome]
  end
end
