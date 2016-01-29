function addUser(name) {
  $('#new-user-select')
    .append($("<option></option>")
            .attr("value", name)
            .attr("selected", true)
            .text(name));
}
$(function() {
  $('select').addClass("form-control");
  $('textarea').addClass("form-control");
  $('table').addClass("table");
  $('#save-user-button').on('click', function () {
    addUser($("#new-user-name").val());
  });
});
