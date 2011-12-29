class WelcomeController < ApplicationController
  def home
    @title = "Home"
  end

  def thank_you
    @title = "Thank You"
  end

  def register
    @title = "Register"
  end

  def contact
    @title = "Contact"
  end

end
