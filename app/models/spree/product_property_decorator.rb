module Spree
  module ProductPropertyDecorator
    def self.prepended(base)
      base.before_save :save_slug
    end

    def save_slug
    	self.slug = value.parameterize
    end
  end
end

::Spree::ProductProperty.prepend(Spree::ProductPropertyDecorator)
