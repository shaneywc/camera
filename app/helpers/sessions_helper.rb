module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def is_admin?
    if (current_user.admin == true)
      return true
    else
      access_denied
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    redirect_to login_path, :notice => "Please login to access this page."
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
