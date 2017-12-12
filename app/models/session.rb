class Session < ActiveRecord::Base
  #relationship with user
  belongs_to :user

end
