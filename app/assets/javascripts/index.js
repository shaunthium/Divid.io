$(document).ready(function() {
	$("#join-button").click(function() {
		$("#join-form").removeClass("hide-form");
		$("#create-form").addClass("hide-form");
	});

	$("#create-button").click(function() {
		$("#create-form").removeClass("hide-form");
		$("#join-form").addClass("hide-form");
	})
});