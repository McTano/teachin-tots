$(function () {

  $('body')
    .on('click', '#nav-toggle', function () {
      $(this).toggleClass('is-active');
      $('#nav-menu').toggleClass('is-active');
    })
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
    .on('mouseover','#question', function() {
      $('.image_container').droppable ( {
        accept : "#question",
        activeClass: "active_image",
        hoverClass: "hover_image",
        drop: function() {
          $(this).closest('label').children('input[type=radio]').prop('checked',true).change();
        }
      });
      $(this).draggable({ 
        revert: "invalid"
      })
    })
});