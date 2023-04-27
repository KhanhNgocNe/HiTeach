var token = localStorage.getItem("token");

async function loadAllMajor() {
    var url = 'http://localhost:8080/api/public/allMajor';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listMajor = await response.json();
    var main = '';
    for (i = 0; i < listMajor.length; i++) {
        main += '<tr style="text-align: center">'+
                    '<td style="font-weight: bold">'+listMajor[i].id+'</td>'+
                    '<td><img src="'+listMajor[i].imagebanner+'" style="width:100px"></td>'+
                    '<td>'+listMajor[i].name+'</td>'+
                    '<td><button onclick="deleteMajor('+listMajor[i].id+')" class="btn btn-danger-red"><i class="fa fa-trash"></i> Delete</button></td>'+
                    '<td><a href="addmajor?id='+listMajor[i].id+'" class="btn btn-success-blue"><i class="fa fa-edit"></i> Update</a></td>'+
                '</tr>'
    }
    document.getElementById("listmajor").innerHTML = main
    $('#example').DataTable();
}


var linkbanner = ""
async function saveMajor() {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/admin/addOrUpdateMajor';
    var ten = document.getElementById("majorname").value

    if(ten == ""){
        alert("Major Name  is empty")
        return;
    }

    const filePath = document.getElementById('banner')
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
    console.log(linkbanner)
    var major = {
        "id": id,
        "name": ten,
        "imagebanner":linkbanner
    }
    console.log(major)
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(major)
    });
    if(response.status < 300){
        swal({
            title: "Notification", 
            text: "Add or update major successful!", 
            type: "success"
          },
        function(){ 
            window.location.replace("major")
        });
    }
    else{
        swal({
            title: "Notification", 
            text: "Add or update blog failure!", 
            type: "error"
          },
        function(){ 
        });
    }
}

async function loadAMajor() {
    var id = window.location.search.split('=')[1];
    if(id != null){
        var url = 'http://localhost:8080/api/public/majorById?id='+id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
            })
        });
        var major = await response.json();
        console.log(major)
        document.getElementById("idmajor").value = major.id
        document.getElementById("majorname").value = major.name
        document.getElementById("banner_img").src = major.imagebanner
        linkbanner = major.imagebanner
    }
}


async function deleteMajor(id) {
    var url = 'http://localhost:8080/api/admin/deleteMajor?id=' + id;
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
                    text: "Delete Major successful!",
                    type: "success"
                },
                function () {
                    window.location.reload();
                });
        } else {
            swal({
                    title: "Notification",
                    text: "Can't delete this Major",
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