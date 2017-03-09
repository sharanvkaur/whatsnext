class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def prevent_unauthorized_user_access
    redirect_to root_path, notice: 'sorry, you cannot access that page', status: :found unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  def scrape_netflix
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://www.finder.com/sg/netflix-movies"))

    netflix = doc.css('.custom-table')

    netflixArray= []
    doc.xpath('//*/table/tbody/tr/td[1]').each do |netflix|
      netflixArray << netflix.text
    end
    p netflixArray
  end

  def flixlist
    @flixlist = scrape_netflix
  end


  helper_method :current_user, :logged_in?, :flixlist
end
