module SessionsHelper

    def sign_in(user)
        remember_token = User.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        user.update_attribute(:remember_token,User.encrypt(remember_token))
        current_user = user
    end

    def current_user=(user)
        @current_user = user
    end

    def sign_out
        remember_token = cookies[:remember_token]
        remember_token = User.encrypt(remember_token)
        if current_user && (remember_token == current_user.remember_token)
            self.current_user = nil
            cookies.delete(:remember_token)
        end
    end

    def current_user
        remember_token = cookies[:remember_token]

        @current_user ||= User.find_by(remember_token:User.encrypt(remember_token))
    end

    def signed_in?
        !current_user.nil?
    end

    def signed_in_user
        unless signed_in?
            store_location
            flash[:notice]  = "请先登录"
            redirect_to controller:'sessions',action:'new'
        end
    end

end
