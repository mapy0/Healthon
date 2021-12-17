class CircleChannel < ApplicationCable::Channel
  def subscribed

    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
   CirComment.create!(comment: data['comment'])
   ActionCable.server.broadcast 'circle_channel', data['comment']
  end
end
