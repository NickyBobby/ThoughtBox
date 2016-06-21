$(document).ready (function() {
  $('.search').on('keyup', function() {
    filterLinks($(this).val());
  });

  $('#clear-search').on('click', function() {
    $('.search').val('');
    $('.search').trigger('keyup');
  });

  $('#read').on('click', function() {
    filterByReadStatus('redBack');
  });

  $('#unread').on('click', function() {
    filterByReadStatus('blueBack');
  });

  $('#all').on('click', function() {
    $('.all-links').empty();
    var userId = $('.all-links').attr('id');
    getAllLinks(userId);
  });
});

function filterLinks(str) {
  var links = $('.link');

  $.each(links, function(index, link) {
    var title = $(this).children().children('#link').text();
    var url = $(this).children().children('#link').attr('href');

    var matchedUp = findMatchesInTitleOrUrl(title, url, str);

    $(link).toggle(matchedUp);
  });

  function findMatchesInTitleOrUrl(title, body, str) {
    return including(title, str) || including(body, str);
  }

  function including(main, part) {
    return main.toLowerCase().indexOf(part.toLowerCase()) >= 0;
  }
}

function filterByReadStatus(status) {
  var links = $('.link');

  $.each(links, function(index, link) {
    var readStatus = $(this).attr('class').split(' ')[1];

    var statusMatch = statusMatchUp(status, readStatus);
    // debugger;
    $(link).toggle(statusMatch);
  });

  function statusMatchUp(status, readStatus) {
    return status === readStatus;
  }
}
