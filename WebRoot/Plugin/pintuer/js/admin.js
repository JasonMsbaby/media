//admin.js
$(function() {    
    
    $(".nav1").click(function() {
	$(this).parent().children().prop("class",".nav1");
	$(this).attr("class", "active");
	$("#adressOne").html($(this).children().html());
    });
    
    $(".nav2").click(function() {
	$(this).parent().children().prop("class","nav2");
	$(this).prop("class", "active");
	$("#adressTwo").html($(this).children().html());
    });

});
function iFrameHeight() {
	var ifm = document.getElementById("iframepage");
	var subWeb = document.frames ? document.frames["iframepage"].document
			: ifm.contentDocument;
	if (ifm != null && subWeb != null) {
		ifm.height = subWeb.body.scrollHeight;
	}
}
