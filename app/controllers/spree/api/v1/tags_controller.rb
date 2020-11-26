module Spree
  module Api
    module V1
      class TagsController < Spree::Api::BaseController
        def index
          @tags = if params[:ids]
                      Spree::Tag.accessible_by(current_ability).where(id: params[:ids].split(','))
                    else
                      Spree::Tag.accessible_by(current_ability).order(:id)
                    end

          @tags = @tags.ransack(params[:q]).result
          @tags = @tags.page(params[:page]).per(params[:per_page])
          respond_with(@tags)
        end
      end
    end
  end
end