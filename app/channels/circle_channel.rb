class CircleChannel < ApplicationCable::Channel
  def subscribed

    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
   comment = CirComment.create!(comment: data['comment'])
   template = ApplicationController.renderer.render(partial: 'comments/comment', locals:{comment: comment})
   ActionCable.server.broadcast 'circle_channel', template
  end
end
