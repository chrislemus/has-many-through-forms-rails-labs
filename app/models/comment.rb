class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  # accepts_nested_attributes_for :user_attributes

  def user_attributes=(attr)
    username = attr[:username]
    if username.length > 0
      user = User.find_or_create_by(username: username)
      self.user = user
    end
  end

end
