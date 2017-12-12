module ApplicationHelper

  #sold-out tag is applied if quantity is zero
  def put_tag_if_sold_out(quantity)
    if quantity == 0
      content_tag(:aside, 'Sold out!', :class => 'sold-out-tag')
    end
  end

  #sign-up button is shown for unlogged users
  def show_sign_up(user_id)
    unless user_id
      content_tag :li do
        link_to 'Sign up', new_users_path
      end
    end
  end

  #sign-in button is shown for unlogged users
  def show_sign_in(user_id)
    unless user_id
      content_tag :li do
        link_to 'Sign in', new_session_path
      end
    end
  end

  #sign-out button is shown for logged users
  def show_sign_out(user_id)
    if user_id
      content_tag :li do
        link_to 'Sign out', :session, method: :delete
      end
    end
  end

  #helper to identify if user is logged
  def session?
    session[:user_id]
  end

end
