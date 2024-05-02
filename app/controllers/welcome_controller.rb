class WelcomeController < ApplicationController
  def index
    @my_name = params[:nome]
    #cookies[:curso] = "Curso de Ruby on Rails - Clara [COOKIE]"
    #session[:curso] = "Curso de Ruby on Rails - Clara [SESSION]"
  end
end
