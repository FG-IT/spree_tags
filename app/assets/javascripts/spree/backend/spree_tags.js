// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'// Navigating to a page with ratings via TurboLinks shows the radio buttons
'use strict'
// eslint-disable-next-line camelcase
function set_tag_select (selector) {
  function formatTag (tag) {
    return Select2.util.escapeMarkup(tag.name)
  }

  if ($(selector).length > 0) {
    $(selector).select2({
      placeholder: Spree.translations.tags_placeholder,
      multiple: true,
      initSelection: function (element, callback) {
        var url = Spree.url(Spree.routes.tags_api, {
          ids: element.val(),
          without_children: true,
          token: Spree.api_key
        })
        return $.getJSON(url, null, function (data) {
          return callback(data['tags'])
        })
      },
      ajax: {
        url: Spree.routes.tags_api,
        datatype: 'json',
        data: function (term, page) {
          return {
            per_page: 50,
            page: page,
            without_children: true,
            q: {
              name_cont: term
            },
            token: Spree.api_key
          }
        },
        results: function (data, page) {
          var more = page < data.pages
          return {
            results: data['tags'],
            more: more
          }
        }
      },
      formatResult: formatTag,
      formatSelection: formatTag
    })
  }
}

$(document).ready(function () {
  set_tag_select('#product_tag_ids')
})