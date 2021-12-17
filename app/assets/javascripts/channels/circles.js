App.circle = App.cable.subscriptions.create ("CircleChannel", {

connected: function() {
  console.log('connected')
    // Called when the subscription is ready for use on the server
},

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(comment) {
    const comments = document.getElementById('comments')
    messages.innerHTML += comment
    //# Called when there's incoming data on the websocket for this channel
  },

  speak: function(comment) {
    return this.perform ('speak',{comment: comment});
  }

});

document.addEventListener('DOMCommentLoaded', function(){
 const input = document.getElementById('chat_input')
 const button = document.getElementById('button')
 button.addEventListener('click', function(){
  const comment = input.value

  App.circle.speak(comment)
  Input.value = ""
  
 })
})