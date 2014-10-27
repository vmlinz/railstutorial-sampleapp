class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)    
    if user && user.authenticate(params[:session][:password])
      # Redirect to user page
      log_in user
      redirect_to user
    else
      # Create an error message
      flash.now[:danger] = 'Authentication failed, password or email might be invalid.'
      render 'new'
    end
  end
  
  def destroy
  end
end
