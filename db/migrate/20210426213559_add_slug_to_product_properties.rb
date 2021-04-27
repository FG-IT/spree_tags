class AddSlugToProductProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_product_properties, :slug, :string
  end
end
