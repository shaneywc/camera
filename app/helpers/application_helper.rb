module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Camera Store"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
   end

end

