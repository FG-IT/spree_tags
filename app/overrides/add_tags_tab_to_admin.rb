Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_product',
  name: 'tags_admin_tab',
  insert_bottom: '[data-hook="admin_product_sub_tabs"]',
  text: '<%= tab(:tags, label: "tags") %>'
)