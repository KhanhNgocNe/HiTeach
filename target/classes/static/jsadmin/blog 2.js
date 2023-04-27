var token = localStorage.getItem("token");

async function loadAllBlog() {
    var url = 'http://localhost:8080/api/public/allBlog';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listBlog = await response.json();
    var main = '';
    for (i = 0; i < listBlog.length; i++) {
        main += '<tr style="text-align: center">'+
                    '<td style="font-weight: bold">'+listBlog[i].id+'</td>'+
                    '<td><img src="'+listBlog[i].imageBanner+'" style="width:100px"></td>'+
                    '<td>'+listBlog[i].createdDate+'</td>'+
                    '<td style="text-align: left">'+listBlog[i].title+'</td>'+
                    '<td style="text-align: left">'+listBlog[i].description+'</td>'+
                    '<td><button onclick="deleteBlog('+listBlog[i].id+')" class="btn btn-danger-red"><i class="fa fa-trash"></i> Delete</button></td>'+
                    '<td><a href="addblog?id='+listBlog[i].id+'" class="btn btn-success-blue"><i class="fa fa-edit"></i> Update</a></td>'+
                '</tr>'
    }
    document.getElementById("listblog").innerHTML = main
    $('#example').DataTable();
}
var linkbanner = ""
async function saveBlog() {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/admin/addOrUpdateBlog';


    var tieude = document.getElementById("tieude").value
    var mota = document.getElementById("mota").value
    var content = tinyMCE.get('editor').getContent()

    if(tieude == ""){
        alert("Title is empty")
        return;
    }
    if(mota == ""){
        alert("Description is empty")
        return;
    }
    if(content == ""){
        alert("Content is empty")
        return;
    }


    const filePath = document.getElementById('imagebanner')
    const formData = new FormData()
    formData.append("file", filePath.files[0])
    var urlUpload = 'http://localhost:8080/api/public/upload';
    const res = await fetch(urlUpload, { 
             method: 'POST', 
              headers: new Headers({
             }),
             body: formData
           });
    if(res.status > 300 && id == null){
        linkbanner = "";
    }
    if(res.status < 300){
        linkbanner = await res.text();
    }
    var blog = {
        "id": id,
        "title": tieude,
        "description":mota,
        "imageBanner":linkbanner,
        "content":content
    }

    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(blog)
    });
    if(response.status < 300){
        swal({
            title: "Notification", 
            text: "Add or Update blog successful!",
            type: "success"
          },
        function(){ 
            window.location.replace("blog")
        });
    }
    else{
        swal({
            title: "Notification", 
            text: "Add or Update blog fail!",
            type: "error"
          },
        function(){ 
        });
    }
}

async function loadABlog() {
    var id = window.location.search.split('=')[1];
    if(id != null){
        var url = 'http://localhost:8080/api/public/blogById?id='+id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
            })
        });
        var blog = await response.json();
        document.getElementById("tieude").value = blog.title
        document.getElementById("mota").value = blog.description
        document.getElementById("imgblog").src = blog.imageBanner
        tinyMCE.get('editor').setContent(blog.content)
        linkbanner = blog.imageBanner
    }
}


async function deleteBlog(id) {
    var url = 'http://localhost:8080/api/admin/deleteBlog?id=' + id;
    var result = confirm("Are you sure to delete?");
    if(result) {
        const response = await fetch(url, {
            method: 'DELETE',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        if (response.status < 300) {
            swal({
                    title: "Notification",
                    text: "Delete Blog successful!",
                    type: "success"
                },
                function () {
                    window.location.reload();
                });
        } else {
            swal({
                    title: "Notification",
                    text: "Can't delete this blog",
                    type: "error"
                },
                function () {
                    window.location.reload();
                });
        }
    }
    else {
        return false;
    }
}