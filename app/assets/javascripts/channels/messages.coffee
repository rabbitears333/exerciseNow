App.messages = App.cable.subscriptions.create "MessagesChannel",
    connected: ->
        alert("connect")
        # sub is ready
        roomId = $("#chat-box").data("room-id")
        @checkIn(roomId).
    disconnected: ->
        # sub terminated
    
    received: (data) ->
        # incoming data on websocket
        posts = $(".message-row").length
        if posts == 10
            $(".message-row").first().remove()
        $("#chat-box").append(data)
        $("#message-field").val('')
        
        
    checkIn: (roomId) ->
        if roomId
            @perform 'checkIn', room_id: roomId
        else
            @perform 'checkOut'