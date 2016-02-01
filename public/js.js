function addUser(name) {
  $('#new-user-select')
    .append($("<option></option>")
            .attr("value", name)
            .attr("selected", true)
            .text(name));
}
function setDefaults() {
  $('select[name="browsers[]"] option[value=firefox]').prop('selected', true);
  $('select[name=system] option[value="' + osvx_friendly() + '"]').prop('selected', true);
}
$(function() {
  $('select').addClass("form-control");
  $('textarea').addClass("form-control");
  $('table').addClass("table");
  $('#save-user-button').on('click', function () {
    addUser($("#new-user-name").val());
  });
  setDefaults();
});
