class SessionsController < ApplicationController
    before_filter :already_signed_in,   :only => [:create, :new]

  def new
  	@title = "Sign in"
  end

  def create 
  	
	
	user = User.authenticate(params[:sessions][:email], params[:sessions][:password])
  	if user.nil?
  	  flash.now[:error] = "Invalid email/password combination."
  	  @title = "Sign in"
      render 'new'
  	else
  	  @title = user.name
  	  sign_in user	
	  redirect_back_or user
	end
  end
  def destroy
  	@title = "Sign out"
  	sign_out
  	redirect_to root_path
  end

end
