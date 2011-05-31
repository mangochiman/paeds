class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
 
  # render new.rhtml
 # before_filter:authorize, :except=>[:new]
  layout'operations'
  def show
    @title="All users"
    @user=User.find(:all)
  end
  
  def new
    @title="Sign Up"
    @user = User.new
    render :layout => "application"
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
