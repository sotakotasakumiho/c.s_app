$(document).on("turbolinks:load", function(){
  function buildHTML(comment){
    let html = `<div class = 'comments__area'>
                  <div class ='comment_creater'>
                    <div class ='comments__email'>${comment.user_email}</div>
                    <div class ='comment_date'>${comment.create_at}</div>
                    <div class='comments__content'>${comment.content}</div>
                  </div>
                </div>`
    return html;
  }
  $('#new_post').on('submit',function(e){
    e.preventdefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })

    .done(function(data){
      
      let html = buildHTML(data);

      $('.comments__area').prepend(html);

      $('.form_area').val("");

      $('.comments').animate({scrollTop: $('.comments')[0].scrollHeight});

    })
    .fail(function(){
      alert('コメントを入力してください');
    })
  })
})