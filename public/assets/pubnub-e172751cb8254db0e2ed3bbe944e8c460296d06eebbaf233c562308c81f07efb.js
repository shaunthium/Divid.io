(function() {

    var PUBNUB_demo = PUBNUB.init({
        publish_key: 'pub-c-c53c4df8-9fec-4c14-958b-5b479df7229b',
        subscribe_key: 'sub-c-4cbd2660-bab9-11e5-b67b-02ee2ddab7fe'
    });

    PUBNUB_demo.subscribe({
        channel: 'test_channel',
        message: function(m) {
            console.log(m)
        },
        connect: publish
    });

    function publish() {
        PUBNUB_demo.publish({
            channel: 'test_channel',
            message: {
                "text": "Hello World!",
                "screen": window.screen
            }
        });
    }

    var sync = new VideoSync("RoomName", "UserName");

    // Your standard YouTube embed code.
    var player = new YT.player('player', {
        videoId: 'A9HV5O8Un6k', // The Video ID
        events: {
            // Bind these 2 methods.
            'onReady': sync.onPlayerReady,
            'onStateChange': sync.onPlayerStateChange
        }
    });
})();
