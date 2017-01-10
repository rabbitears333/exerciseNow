class MessagesChannel < ApplicationCable::Channel
    def subscribed
    end
    
    def unsubscribed
    end
    
    def checkIn(data)
        room_id = "#{data['room_id']}" 
        stream_from "messages_room_#{room_id}"
    end
    
    def checkOut
        stop_all_streams
    end
end