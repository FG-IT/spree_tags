module Spree::Admin::ProductsControllerDecorator
  def self.prepended(base)
    base.before_action :load_tags, only: [:new, :edit]
  end

  private

  def load_tags
    @tags = Spree::Tag.order(Arel.sql('LOWER(name)'))
  end
end

Spree::Admin::ProductsController.prepend Spree::Admin::ProductsControllerDecorator