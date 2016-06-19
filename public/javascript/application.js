$(function () {

  $('body')
    .on('change', 'input[type=radio]', function () {
      var radioButton = $(this);
      radioButton.closest('label').addClass('selected').siblings('label').removeClass('selected');
      radioButton.closest('form').trigger('submit');
    })
    .on('submit', 'form', function (event) {
      event.preventDefault();
      var form = $(this);
      // form.find('button').prop('disabled', true).text('loading...');
      $.ajax({
        url: form.attr('action'),
        method: form.attr('method'),
        data: form.serialize(),
        success: function (res) {
          $('body').html(res);
        }
      });
    })
    .on('click', '#button-next', function () {
      $.ajax({
        url: '/play',
        method: 'POST',
        data: { next: 'true' },
        success: function (res) {
          $('body').html(res);
        }
      });
    })
    .on('mouseover mouseenter', '.image_container', function() {
      $(this).droppable ( {
        accept: "#question",
        drop: function() {
          $(this).closest('label').children('input[type=radio]').prop('checked', true).change();
        }
      });
    })
    .on('mouseover','#question', function() {
      $(this).draggable({ 
        revert: "invalid",
        cursorAt: {left: -5, top: -5} 
      });
    })
});