// VideoSync is an API that synchronizes the playback of embedded
// YouTube videos across multiples browsers.
//
// You can check out the demo right [here](http://larrywu.com/videosync/), or
// view the source on [Github](https://github.com/lw7360/videosync/)


// Setup
// ---
// roomId is the name of the channel you want to use.
// userId is an optional variable that will identify individual users of VideoSync.
function VideoSync(roomId, userId) {
    // If no userId is provided, generate a simple random one with Math.random.
    if (userId === undefined) {
        userId = Math.random().toString();
    }

    // A variable that will be set to the YouTube player object.
    var player;

    // Initializing PubNub with demo keys and our userId.
    var pubnub = PUBNUB.init({
        publish_key: 'pub-c-c53c4df8-9fec-4c14-958b-5b479df7229b',
        subscribe_key: 'sub-c-4cbd2660-bab9-11e5-b67b-02ee2ddab7fe',
        uuid: userId
    });

    // Whether the connection to the channel has been established yet.
    var linkStart = false;

    // The contents of the most recently received message.
    var lastMsg;

    // A helper function that publishes state-change messages.
    var pub = function (type, time) {
        if (lastMsg !== "" + type + time) {
            pubnub.publish({
                channel: roomId,
                message: {
                    recipient: "",
                    sender: userId,
                    type: type,
                    time: time,
                }
            });
        }
    };

    // The function that keeps the video in sync.
    var keepSync = function () {
        // [Link Start!](https://www.youtube.com/watch?v=h7aC-TIkF3I&feature=youtu.be)
        linkStart = true;

        // The initial starting time of the current video.
        var time = player.getCurrentTime();

        // Subscribing to our PubNub channel.
        pubnub.subscribe({
            channel: roomId,
            callback: function (m) {
                lastMsg = m.recipient + m.type + m.time;
                if ((m.recipient === userId || m.recipient === "") && m.sender !== userId) {
                    if (m.type === "updateRequest") {
                        var curState = player.getPlayerState();
                        var curTime = player.getCurrentTime();
                        pubnub.publish({
                            channel: roomId,
                            message: {
                                type: "updateResponse",
                                time: curTime,
                                recipient: m.sender
                            }
                        });
                    } else if (m.type === "pause") {
                        player.seekTo(m.time);
                        time = m.time;
                        console.log("PAUSE!");
                        player.pause();
                    } else if (m.type === "play") {
                        if (m.time !== null) {
                            player.seekTo(m.time);
                        }
                        console.log("PLAY!");
                        player.play();
                    }
                }
            }
        });

        // Intermittently checks whether the video player has jumped ahead or
        // behind the current time.
        setInterval(function() {
          var curTime = player.getCurrentTime();
          var curState = player.getPlayerState();
          if (Math.abs(curTime - time) > 1) {
            if (curState === 2) {
              pub("pause", curTime);
              player.pause();
            } else if (curState === 1) {
              player.pause();
            }
          }
          time = curTime;
        }, 500);

    };

    // Public Methods
    // ---
    return {
        // Should be bound to the YouTube player `onReady` event.
        onPlayerReady: function (p) {
            player = p;
            // player.play();
            // player.pause();
            keepSync();
        },
        // Should be bound to the YouTube player `onStateChange` event.
        onPlayerStateChange: function (p) {
            player = p;
            if (linkStart) {
                console.log("PlayerState: " + player.getPlayerState());
                if (player.getPlayerState() === 1) { // Play event.
                    console.log("Tell PUBNUB PLAY");
                    pub("play", null);
                }
                // Pause event.
                else if (player.getPlayerState() === 2) {
                  console.log("Tell PUBNUB PAUSE");
                    pub("pause", player.getCurrentTime());
                }
                else {
                  console.log("NOOOOOOOO");
                }
            }
        }
    };
}
