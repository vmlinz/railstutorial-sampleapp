module SessionsHelper
    # Login
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Get current logged in user
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # Test whether we have a session
    def logged_in?
        !!current_user
    end
    
end
