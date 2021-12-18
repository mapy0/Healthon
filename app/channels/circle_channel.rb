class CircleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "circle_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    circle = Circle.find(data['circle_id'])
    user = Member.find(data['member_id'])
    comment = user.cir_comments.new(comment: data['comment'])
    comment.circle_id = circle.id
    comment.save
  p "------------------------"
  p comment
  p user
  # comment = CirComment.create!(comment: data['comment'])
   template = ApplicationController.renderer.render(partial: 'members/circles/comment', locals: {comment: comment})
   ActionCable.server.broadcast 'circle_channel', message: template
  end
end
