# para a views de Welcome

module WelcomeHelper
  def index
    @my_name = params[:nome]
  end
end
