var token = localStorage.getItem("token");

async function loadAllCourse() {
    var check = 1;
    if (document.getElementById('checkDaduyet').checked) {
        check = 0;
    }
    var url = 'http://localhost:8080/api/admin/courseByActive?active='+check;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listcourse = await response.json();
    var main = '';
    var activebtn = 'btn btn-success'
    var activename = 'Unactive'
    var activeicon = 'fa fa-check'
    var type = 1;
    for (i = 0; i < listcourse.length; i++) {
        if(listcourse[i].actived == 0){
            activebtn = 'btn btn-danger-red'
            activename = 'Active'
            activeicon = 'fa fa-unlock'
            type = 0;
        }
        else{
            activebtn = 'btn btn-success-green'
            activename = 'Unactive'
            activeicon = 'fa fa-check'
            type = 1;
        }
        main += '<tr style="font-size: 13px; text-align: center"" >'+
                    '<td style="font-weight: bold">'+listcourse[i].id+'</td>'+
                    '<td><img src="'+listcourse[i].imageBanner+'" style="width:100px"></td>'+
                    '<td>'+listcourse[i].name+'</td>'+
                    '<td>'+listcourse[i].user.username+'</td>'+
                    '<td>'+listcourse[i].price+'</td>'+
                    '<td>'+listcourse[i].maxQuantity+'</td>'+
                    '<td>'+listcourse[i].createdDate+'</td>'+
                    '<td>'+listcourse[i].startDate+'</td>'+
                    '<td>'+listcourse[i].endDate+'</td>'+
                    '<td><button data-bs-toggle="modal" data-bs-target="#motasp" onclick="setDelete('+listcourse[i].id+')" class="btn btn-danger-red"><i class="fa fa-trash"></i> Delete</button></td>'+
                    '<td><button onclick="lockOrUnlock('+listcourse[i].id+','+type+')" class="'+activebtn+'"><i class="'+activeicon+'"></i> '+activename+'</button></td>'+
                '</tr>'
    }
    document.getElementById("listcourse").innerHTML = main
    $('#example').DataTable();
}



function setDelete(id){
    document.getElementById("idcourse").value = id;
}

async function sendDelete(){
    var idCourse = document.getElementById("idcourse").value
    var contentconfirm = document.getElementById("contentconfirm").value
    var url = 'http://localhost:8080/api/admin/deleteCourse?id='+idCourse+'&content='+contentconfirm;
    var result = confirm("Are you sure to delete?");
    if(result) {
        const response = await fetch(url, {
            method: 'POST',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        if (response.status < 300) {
            swal({
                    title: "Notification",
                    text: "Send mail confirm successful",
                    type: "success"
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

async function lockOrUnlock(id, type) {
    var url = 'http://localhost:8080/api/admin/activeCourse?id=' + id;
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        var mess = '';
        if(type == 1){
            mess = 'Lock course successful'
        }
        else{
            mess = 'Unlock course successful'
        }
        swal({
            title: "Notification", 
            text: mess, 
            type: "success"
          },
        function(){ 
            window.location.reload();
        });
    }
    else {
        swal({
            title: "Notification", 
            text: "Error", 
            type: "error"
          },
        function(){ 
            window.location.reload();
        });
    }
}
