module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :product_tags, dependent: :destroy
  	  base.has_many :tags, through: :product_tags
    end
  end
end

::Spree::Product.prepend(Spree::ProductDecorator)
