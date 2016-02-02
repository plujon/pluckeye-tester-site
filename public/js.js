function addUser(name) {
  var newUserSelect = $('#new-user-select');
  newUserSelect
    .append($("<option></option>")
            .attr("value", name)
            .attr("selected", true)
            .text(name));
  if (typeof newUserSelect.chosen !== 'undefined') {
    newUserSelect.trigger("chosen:updated");
  }
}
function setDefaults() {
  $('select[name="browsers[]"] option[value=firefox]').prop('selected', true);
  $('select[name=system] option[value="' + osvx_friendly() + '"]').prop('selected', true);
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
$(function() {
  $('select').addClass("form-control");
  $('textarea').addClass("form-control");
  $('table').addClass("table table-striped");
  $('#save-user-button').on('click', function () {
    addUser($("#new-user-name").val());
  });
  setDefaults();
  addChosen();
  initNavbar();
});
