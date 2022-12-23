module Spree
  module TagVendorDecorator
    def self.prepended(base)
      base.has_many :tags, class_name: "Spree::Tag", dependent: :destroy
    end
  end
end

::Spree::Vendor.prepend(::Spree::TagVendorDecorator)
