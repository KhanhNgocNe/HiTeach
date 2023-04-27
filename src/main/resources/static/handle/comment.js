var token = localStorage.getItem("token");

async function getAllComment() {
    if(token == null){
        // document.getElementById("mycomment").style.display = 'none'
        document.getElementById("mycomment").innerHTML = '<h2>Login to comment</h2>'
    }
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/public/findCommentByCourseId?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for(i=0; i<list.length; i++){
        var del = ''
        if(list[i].deleted == 1){
            del = '<i onclick="deleteComment('+list[i].id+')" class="fa fa-trash xoabl" style-"cursor: pointer" ></i>'
        }
        main +=
            `<div class="col-md-8">
            <div class="comment-user">
                <img src="${list[i].user.avatar}">
                <div class="content-comment">
                    <div class="top-comment-user">
                        <p class="user-comment">${list[i].user.username}</p>
                        <p class="time-comment"><i class="fa fa-clock"></i>${list[i].createdDate}</p>
                        ${del}
                    </div>
                    <p class="contentcmt">${list[i].content}</p>
                </div>
            </div>
        </div>`
    }
    document.getElementById("listcomment").innerHTML = main
}

async function deleteComment(id) {
    var url = 'http://localhost:8080/api/userteacher/deleteComment?id='+id;
    var result = confirm("Are you sure to delete?");
    if(result){
        const response = await fetch(url, {
            method: 'DELETE',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        if(response.status < 300){
            swal({
                    title: "Notification",
                    text: "Delete Comment successful!",
                    type: "success"
                },
                function(){
                    window.location.reload()
                });
        }
        else{
            swal({
                    title: "Notification",
                    text: "Delete Comment error!",
                    type: "error"
                },
                function(){
                });
        }
    }
    else{
        return false;
    }




}

async function saveComment() {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/userteacher/addComment';
    var content = document.getElementById("noidungbl").value
    var comment = {
        "content": content,
        "course":{
            "id":id
        }
    }
    if(content==""){
        alert("Content is empty, comment again, please!")
        return;
    }

    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(comment)
    });
    if(response.status < 300){
        swal({
                title: "Notification",
                text: "Post comment successful!",
                type: "success"
            },
            function(){
                window.location.reload()
            });
    }
    else{
        swal({
                title: "Notification",
                text: "Post comment error!",
                type: "error"
            },
            function(){
            });
    }
}