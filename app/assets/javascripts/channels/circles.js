App.circle = App.cable.subscriptions.create ("CircleChannel", {

connected: function() {
  console.log('connected')
    // Called when the subscription is ready for use on the server
},

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(comment) {
    console.log("-----recieved-----")
    console.log(comment)
    console.log(comment.message)
    var comments = document.getElementById('comments')
    comments.innerHTML += comment.message
    //# Called when there's incoming data on the websocket for this channel
  },

  speak: function(comment, circle_id, member_id) {
    // console.log(comment)
    return this.perform ('speak',{comment: comment,circle_id: circle_id,member_id: member_id});

  }

});

document.addEventListener('DOMContentLoaded', function(){
 var input = document.getElementById('chat-input')
 var circle = document.getElementById('circle_id')
 var member = document.getElementById('member_id')
 var button = document.getElementById('button')
 button.addEventListener('click', function(){
  var comment = input.value
  var circle_id = circle.value
  var member_id = member.value
  App.circle.speak(comment, circle_id, member_id)

  input.value = ""

 })
})