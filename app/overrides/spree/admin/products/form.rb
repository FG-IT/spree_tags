Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'Enable admin to menage product tags',
    insert_before: 'div[data-hook="admin_product_form_meta"]',
    text: <<-HTML
              <div data-hook="admin_product_form_tags">
                <%= f.field_container :tags, class: ['form-group'] do %>
                  <%= f.label :tag_ids, Spree.t(:tags) %>
                  <%= f.collection_select(:tag_ids, Spree::Tag.all, :id, :name, { }, { class: 'select2', multiple: true }) %>
                <% end %>
              </div>
          HTML
)