$(document).ready(function() {
    $("#join-button").click(function() {
        $("#join-form").removeClass("hide-form");
        $("#create-form").addClass("hide-form");
        $("html,body").animate({
            scrollTop: ($(document).height() - 750)
        }, "slow");
    });

    $("#create-button").click(function() {
        $("#create-form").removeClass("hide-form");
        $("#join-form").addClass("hide-form");
        $("html,body").animate({
            scrollTop: ($(document).height() - 850)
        }, "slow");
    });


    $body = $("body");

    $("#modal-display").click(function(e) {
        $body.addClass("loading");
    });

});
