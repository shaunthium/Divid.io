(function() {

    PUBNUB_demo.subscribe({
        channel: 'demo_tutorial',
        message: function(m) {
            console.log(m)
        },
        connect: publish
    });

    function publish() {
        PUBNUB_demo.publish({
            channel: 'demo_tutorial',
            message: {
                "text": "Hey!"
            }
        });
    }

})();
