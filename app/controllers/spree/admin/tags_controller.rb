module Spree
  module Admin
    class TagsController < ResourceController
      respond_to :html

      def index
        @tags = Spree::Tag.order(:id)
      end

    end
  end
end