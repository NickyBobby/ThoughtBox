
function createLink() {
  var title = $('#title').val();
  var url = $('#url').val();
  var userId = $('.all-links').attr('id');
  var linkParams = { link: { title: title, url: url, user_id: userId } };
  $.ajax({
    type: 'POST',
    url:  '/api/v1/links',
    data: linkParams,
    success: function(link) {
      prependLink(link);
      clearTextField();
    }
  });
}

function clearTextField() {
  $('#title').val('');
  $('#url').val('');
}

function prependLink(link) {
  $('.all-links').prepend(linkInfo(link));
}
