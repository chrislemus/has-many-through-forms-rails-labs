class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories_attributes

  # def comment(comment)
  #   comment
  # end

  def categories_attributes=(attrs)
    attrs.each do |attr|
      category_name = attr['name']
      unless category_name.empty?
        category = Category.find_or_create_by(name: category_name)
        self.categories << category
      end
    end
  end


end
