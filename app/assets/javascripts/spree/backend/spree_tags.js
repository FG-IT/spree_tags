// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'// Navigating to a page with ratings via TurboLinks shows the radio buttons
'use strict'
// eslint-disable-next-line camelcase
$.fn.tagAutocomplete = function() {
  'use strict'

  function formatTagList(values) {
    return values.map(function (obj) {
      return {
        id: obj.id,
        text: obj.name
      }
    })
  }

  this.select2({
    multiple: true,
    placeholder: Spree.translations.tag_placeholder,
    minimumInputLength: 2,
    ajax: {
      url: Spree.routes.tags_api,
      dataType: 'json',
      data: function (params) {
        return {
          q: {
            name_cont: params.term,
          },
          token: Spree.api_key
        }
      },
      processResults: function(data) {
        return {
          results: formatTagList(data.tags)
        }
      }
    }
  })
}

$(document).ready(function () {
  $('#product_tag_ids').tagAutocomplete()
})