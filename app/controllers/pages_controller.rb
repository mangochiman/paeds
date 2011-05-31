class PagesController < ApplicationController

  def home
    @title="Home"
  end

  def signup
     @title="Sign Up"
  end

  def login
     @title="Login"
  end

  def capture
     @title="Record Information"
     render :layout => "operations"
   
  end

  def about
     @title="About"
  end

  def contacts
     @title="Contacts"
  end

end
