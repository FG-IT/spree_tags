class CreateSpreeTags < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tags do |t|
      t.string :name, null: false
    end

    add_index :spree_tags, [:name],
              name: 'index_tag_name', unique: true

    create_table :spree_product_tags do |t|
      t.integer :tag_id, null: false
      t.integer :product_id, null: false
    end   

  end
end
