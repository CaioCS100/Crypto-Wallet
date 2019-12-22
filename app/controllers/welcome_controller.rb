class WelcomeController < ApplicationController
  def index
    @nome = @nome.nil? ? 'Não foi passado nehum nome' : params[:nome]
  end
end
