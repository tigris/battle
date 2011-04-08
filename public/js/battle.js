$(function() {
  $('#home a').click(function(e) {
    e.preventDefault();
    $(this).prev('form').submit();
  });
});
