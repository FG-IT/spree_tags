module Spree
  module Admin
    class TagsController < ResourceController
      helper Spree::ProductsHelper
      respond_to :html

      def index
        @tags = Spree::Tag.order(:id)
      end

      def show
        @products = @tag.products.includes([
            { 
              variants: [:images], 
              master: [:images, :default_price] 
            }
          ]).page(params[:page]).per(params[:per_page] || 50)
        
      end

    end
  end
end