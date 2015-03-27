//admin.js
$(function() {

    $(".nav1").click(function() {
	$(this).parent().children().prop("class", ".nav1");
	$(this).attr("class", "active");
	$("#adressOne").html($(this).children().html());
    });

    $(".nav2").click(function() {
	$(this).parent().children().prop("class", "nav2");
	$(this).prop("class", "active");
	$("#adressTwo").html($(this).children().html());
    });

});
function openAdmin(path) {
    $('#admin').load(path);
}