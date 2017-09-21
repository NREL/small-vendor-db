(function($){

  Drupal.behaviors.scripts = {
    attach: function (context, settings) {

      // products multi-select
      $('#edit-field-products').attr({'title': 'Nothing Selected'}).selectpicker({
        size: 7,
        selectedTextFormat: 'count > 3',
        liveSearch: true,
      });

      // form reset button
      $('#form-reset').once().click(function(e) {
        e.preventDefault();
        var form = $(this).closest('form');
        if (confirm("Are you sure you want to reset the form? Once you reset the form, you won't be able to undo.")) {
          $(form).find('input, select, textarea').not($('#edit-moderation-state-0')).val('');
          $(form).find('input:checked').click(); // .click() helps trigger conditionals
        } else {
          return false;
        }
      });

    }
  };

}(jQuery));
