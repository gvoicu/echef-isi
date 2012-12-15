class PagesController < ApplicationController
  
  def home
      redirect_to :controller => "users", :action => "profile" if user_signed_in?
    
  end
end
