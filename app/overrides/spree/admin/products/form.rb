Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'Enable admin to menage product tags',
    insert_before: 'div[data-hook="admin_product_form_meta"]',
    text: <<-HTML
              <div data-hook="admin_product_form_tags">
                <%= f.field_container :tags, class: ['form-group'] do %>
                  <%= f.label :tag_ids, Spree.t(:tags) %>

                  <% if can? :modify, Spree::Tag %>
                    <%= f.select :tag_ids, options_from_collection_for_select(Spree::Tag.all, :id, :name, @product.tag_ids), { include_hidden: true }, multiple: true, class: 'select2-hidden-accessible' %>
                  <% elsif @product.tags.any? %>
                    <ul class="text_list">
                      <% @product.tags.each do |tag| %>
                        <li><%= tag.name %></li>
                      <% end %>
                    </ul>
                  <% else %>
                    <div class="alert alert-info"><%= Spree.t(:no_resource_found, resource: :tags) %></div>
                  <% end %>
                <% end %>
              </div>
          HTML
)