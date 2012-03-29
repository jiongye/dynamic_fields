class Category < ActiveRecord::Base
  has_many :subcategories

  accepts_nested_attributes_for :subcategories, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? }

end