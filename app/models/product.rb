class MyValidator < ActiveModel::Validator
  def validate(product)
    unless product.image_url.ends_with? '.jpg', '.png'
      product.errors[:image_url] << "Needs a .jpg or .png file"
    end
  end
end

class Product < ApplicationRecord
	include ActiveModel::Validations
  validates_with MyValidator
	resourcify
	def self.search(search_term)
		if Rails.env.development? || Rails.env.test?
			Product.where("name LIKE ?", "%#{search_term}%")
		else
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end

	def highest_rating_comment
  	comments.rating_desc.first
	end

	def lowest_rating_comment
  	comments.rating_asc.first
	end

	def average_rating
  	comments.average(:rating).to_f
	end

	has_many :orders
	has_many :comments
	validates :name, length: { minimum: 2 }
	validates :name, :description, :image_url, :price, presence: true
	validates :price, numericality: true
end


