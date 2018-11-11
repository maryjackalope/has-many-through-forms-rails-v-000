class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories
 
def categories_attributes=(category_attributes)
    binding.pry
    category_attributes.values.each do |category_attribute|
      binding.pry

      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
end