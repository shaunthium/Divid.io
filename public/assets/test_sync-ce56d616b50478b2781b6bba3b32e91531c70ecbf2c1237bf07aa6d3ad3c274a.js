var videosync = new VideoSync("roomId", "userId");
function onYouTubeIframeAPIReady() {
    var player = new YT.player('player', 
        {
            videoId: 'pRIaU172aKM',
            events: {
                'onReady': videosync.onPlayerReady,
                'onStateChange': videosync.onPlayerStateChange
            }
        }
    });
};
var onPlayerStateChange = function(event) {
    if (event.data === 1) {
        // The player started playing.
        // Publish this event in a PubNub channel.
    } else if (event.data === 2) {
        // The player was paused.
        // Also publish this event.
    }
};
// "player" is the YouTube player.
var prevTime = player.getCurrentTime():
var z = setInterval(function() {
    var curTime = player.getCurrentTime();
    if (Math.abs(curTime - prevTime) > 1) {
        // The player has jumped behind or ahead in the video.
    }
    prevTime = curTime;
}, 500); // Check the progress every 500 milliseconds.
// "event" is the type of event that occurred (play, pause, or seek)
// time is the time of the video when the event occurred.
var publishState = function(event, time) {
    pubnub.publish({
        channel: "roomId",
        event: event,
        time: time,
    });
};
