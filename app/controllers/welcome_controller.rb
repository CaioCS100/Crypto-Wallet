class WelcomeController < ApplicationController
  def index
    @nome = params[:nome].nil? ? 'Não foi passado nehum nome' : params[:nome]
  end
end
