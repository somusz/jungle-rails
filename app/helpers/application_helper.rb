module ApplicationHelper

  def put_tag_if_sold_out(quantity)
    if quantity == 0
      content_tag(:aside, 'Sold out!', :class => 'sold-out-tag')
    end
  end

  def show_sign_up(user_id)
    unless user_id
      content_tag :li do
        link_to 'Sign up', new_users_path
      end
    end
  end

  def show_sign_in(user_id)
    unless user_id
      content_tag :li do
        link_to 'Sign in', new_session_path
      end
    end
  end

  def show_sign_out(user_id)
    if user_id
      content_tag :li do
        link_to 'Sign out', :session, method: :delete
      end
    end
  end

end
