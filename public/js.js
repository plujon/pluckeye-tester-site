function addUser(name) {
  var userSelect = $('#user-select');
  userSelect
    .append($("<option></option>")
            .attr("value", name)
            .attr("selected", true)
            .text(name));
  if (typeof userSelect.chosen !== 'undefined') {
    userSelect.trigger("chosen:updated");
  }
}
function setDefaults() {
  $('select[name="browsers[]"] option[value=firefox]').prop('selected', true);
  $('select[name=system] option[value="' + osvx_friendly() + '"]').prop('selected', true);
  var match = document.cookie.match(/username=([^;]+)/);
  if (match) {
    $('select[name="user"] option[value="' + match[1] + '"]').prop('selected', true);
  }
}
function setDefaultUser(username) {
  document.cookie = "username=" + username + "; max-age=" + 3600 * 365 +"; path=/";
}
function addChosen() {
  var chosenOptions = { search_contains: true };
  $('select').each(function (){
    if (false && 0 == this.offsetWidth) {
      $(this).on("bs.shown.modal", function(){
        if (this.offsetWidth != 0)
          $(this).chosen(chosenOptions);
      });
    } else {
      $(this).chosen(chosenOptions);
    }
  });
}
function initNavbar() {
  var navbarItems = $("#navbar-body li");
  navbarItems.each(function (index, element) {
    if ($(this).find("a").attr("href") === window.location.pathname) {
      $(this).addClass("active");
    }
  });
}
function initBootstrap() {
  $('select').addClass("form-control");
  $('textarea').addClass("form-control");
  $('table').addClass("table table-striped");
  $('ul[class="list-group"] li').addClass("list-group-item");
}
function initOptionalNotes() {
  if ($('#ok-radio').attr('checked')) {
    $('#additional-notes-div').hide();
  } else {
    $('#additional-notes-div').show();
  }
  $('#ok-radio').on('change', function () {
    $('#additional-notes-div').hide(600);
  });
  $('#no-radio').on('change', function () {
    $('#additional-notes-div').show(600);
  });
}
$(function() {
  $('#save-user-button').on('click', function () {
    addUser($("#new-user-name").val());
  });
  $('#testings-form').on('submit', function () {
    setDefaultUser($('#user-select').val());
  });
  setDefaults();
  initBootstrap();
  initNavbar();
  initOptionalNotes();
  addChosen();
});
