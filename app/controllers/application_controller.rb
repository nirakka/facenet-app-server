class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @rankings = Ranking.all
    render "layouts/test"
  end
end
