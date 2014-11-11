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

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent[:remember_token] = user.remember_token
        cookies.permanent.signed[:user_id] = user.id
    end

    # Returns the user corresponding to the remember token cookie.
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
  
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    # Logs out the current user.

    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end    
    
    # Return true if user is current user
    def current_user?(user)
        current_user == user
    end
    
    # Redirect back to stored url or to default url
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    # Store the url trying to be accessed
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
end
