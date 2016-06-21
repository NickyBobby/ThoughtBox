$(document).ready(function() {
  var userId = $('.all-links').attr('id');
  getAllLinks(userId);
  var $allLinks = $('.all-links');

  $('.all-links').delegate('.update-link', 'click', function() {
    var linkId = $(this).parent().attr('id');
    var linkParams = $(this).attr('id').split('-')[0];
    updateReadStatus(linkId, linkParams);
  });

  $('#add-link').click(function() {
    createLink();
  });
});

function updateReadStatus(id, params) {
  $.ajax({
    type: 'PUT',
    url:  '/api/v1/links/' + id,
    data: {link: { read: params } },
    success: function() {
      $('.all-links').empty();
      var userId = $('.all-links').attr('id');
      getAllLinks(userId);
    }
  });
}

function getAllLinks(id) {
  $.ajax({
    type: 'GET',
    url: 'api/v1/links',
    data: { id: id },
    success: function(links) {
      showLinksOnPage(links);
    }
  });
}

function showLinksOnPage(links) {
  $.each(links, function(index, link) {
    addLink(link);
  });
}

function addLink(link) {
  $('.all-links').append(linkInfo(link));
}

function linkInfo(link) {
  if (link.read) {
  button = "<button id='false-" + link.id + "' class='update-link'>Mark As Unread</button>";
  color = "redBack";
  } else {
  button = "<button id='true-" + link.id + "' class='update-link'>Mark As Read</button>";
  color = "blueBack";
  }

  return "<div id='" + link.id + "' class='link " + color + "'>" +
         "<h3><a id='link' href='" + link.url +"'>" + link.title + "</a></h3>" +
         button +
         "<button><a href='/links/" + link.id + "/edit' class='edit-link'>Edit</a></button>" +
         "</div>";
}
