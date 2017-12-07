module ApplicationHelper

  def put_tag_if_sold_out(quantity)
    if quantity == 0
      content_tag(:aside, 'Sold out!', :class => 'sold-out-tag')
    end
  end
end
