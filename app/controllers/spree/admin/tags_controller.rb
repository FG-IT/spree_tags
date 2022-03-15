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

      def download
        @products = @tag.products.includes([
          { 
            variants: [:images], 
            master: [:images, :default_price] 
          }
        ])
        file = Rails.root.join('storage', "#{@tag.name}_products.csv")
        CSV.open(file, "wb") do |csv|
          csv << ["name", "sku", "admin link", "page link"]
          @products.find_each do |product|
            product.variants_including_master.each do |variant|
              csv << [product.name, variant.sku, admin_product_url(product), product_url(product)]
            end
          end
        end
        send_file file, :type => 'text/csv', :disposition => 'attachment'
      end

    end
  end
end