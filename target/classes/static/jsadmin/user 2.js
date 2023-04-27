var token = localStorage.getItem("token");

async function loadAllUser() {
    var url = 'http://localhost:8080/api/admin/getUserNotAdmin';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listUser = await response.json();
    console.log(listUser)
    var main = '';
    var activebtn = 'btn btn-primary'
    var activename = 'khóa'
    var activeicon = 'fa fa-lock'
    var type = 1;
    for (i = 0; i < listUser.length; i++) {
        if(listUser[i].actived == 0){
            activebtn = 'btn btn-danger-red'
            activename = 'Unlock'
            activeicon = 'fa fa-unlock'
            type = 0;
        }
        else{
            activebtn = 'btn btn-success-blue'
            activename = 'Lock'
            activeicon = 'fa fa-lock'
            type = 1;
        }

        main += '<tr style="text-align: center">'+
                    '<td style="font-weight: bold">'+listUser[i].id+'</td>'+
                    '<td><img src="'+listUser[i].avatar+'" class="img-sp-admin"></td>'+
                    '<td>'+listUser[i].username+'</td>'+
                    '<td>'+listUser[i].fullname+'</td>'+
                    '<td>'+listUser[i].created_date+'</td>'+
                    '<td>'+listUser[i].authorities[0].name+'</td>'+
                    '<td><button onclick="lockOrUnlock('+listUser[i].id+','+type+')" class="'+activebtn+'"><i class="'+activeicon+'"></i> '+activename+'</button></td>'+
                '</tr>'
    }
    document.getElementById("listuser").innerHTML = main
    $('#example').DataTable();
}


async function loadUserBySelect() {
    var role = document.getElementById("role").value
    if(role === "ALL"){
        loadAllUser();
        return;
    }
    var url = 'http://localhost:8080/api/admin/getUserBySelect?role='+role;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listUser = await response.json();
    console.log(listUser)
    var main = '';
    var activebtn = 'btn btn-primary'
    var activename = 'khóa'
    var activeicon = 'fa fa-lock'
    var type = 1;
    for (i = 0; i < listUser.length; i++) {
        var disable = ''
        if(listUser[i].actived == 0){
            activebtn = 'btn btn-danger'
            activename = 'Unlock'
            activeicon = 'fa fa-unlock'
            type = 0;
        }
        else{
            activebtn = 'btn btn-primary'
            activename = 'Lock'
            activeicon = 'fa fa-lock'
            type = 1;
        }
        if(role === "ROLE_ADMIN"){
            disable = 'disabled'
        }
        main += '<tr>'+
                    '<td>#'+listUser[i].id+'</td>'+
                    '<td><img src="'+listUser[i].avatar+'" class="img-sp-admin"></td>'+
                    '<td>'+listUser[i].username+'</td>'+
                    '<td>'+listUser[i].fullname+'</td>'+
                    '<td>'+listUser[i].created_date+'</td>'+
                    '<td>'+listUser[i].authorities[0].name+'</td>'+
                    '<td><button '+disable+' onclick="lockOrUnlock('+listUser[i].id+','+type+')" class="'+activebtn+'"><i class="'+activeicon+'"></i> '+activename+'</button></td>'+
                '</tr>'
    }
    document.getElementById("listuser").innerHTML = main
    $('#example').DataTable();
}

async function lockOrUnlock(id, type) {
    var url = 'http://localhost:8080/api/admin/activeUser?id=' + id;
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        var mess = '';
        if(type == 1){
            mess = 'Lock account successful'
        }
        else{
            mess = 'Unlock account successful'
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

async function changePassword() {
    var token = localStorage.getItem("token");
    var oldpass = document.getElementById("oldpassword").value
    var newpass = document.getElementById("newpassword").value
    var renewpass = document.getElementById("renewpassword").value
    var url = 'http://localhost:8080/api/admin/changePassword?old='+oldpass+"&new="+newpass;
    if(oldpass == "" && newpass== "" && renewpass ==""){
        alert("Data is empty");
        return;
    }
    if(oldpass == "" ){
        alert("Old Password is empty");
        return;
    }
    if(newpass == "" ){
        alert("New Password is empty");
        return;
    }
    if(renewpass == "" ){
        alert("Confirm Password is empty");
        return;
    }
    if(newpass != renewpass){
        alert(" New password not match");
        return;
    }

    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        swal({
                title: "Notification",
                text: "Update password successful!",
                type: "success"
            },
            function(){
                window.location.reload()
            });
    }
    else {
        swal({
                title: "Notification",
                text: "Update password error, password in valid",
                type: "error"
            },
            function(){ });
    }
}

var linkavatar = ''
async function loadUserAdmin(){
    var urllog = 'http://localhost:8080/api/all/userlogged';
    const resp = await fetch(urllog, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await resp.json()
    linkavatar = result.avatar
    document.getElementById("fullname").value = result.fullname
    document.getElementById("phone").value = result.phone
    document.getElementById("email").value = result.email
    document.getElementById("img_avatar").src = result.avatar
}

async function changeUser() {
    const filePath = document.getElementById('avatar')
    const formData = new FormData()
    formData.append("file", filePath.files[0])
    var urlUpload = 'http://localhost:8080/api/public/upload';
    const res = await fetch(urlUpload, {
        method: 'POST',
        headers: new Headers({
        }),
        body: formData
    });
    if(res.status < 300){
        linkavatar = await res.text();
    }

    var url = 'http://localhost:8080/api/admin/changeInfor';
    var fullname = document.getElementById("fullname").value
    var phone = document.getElementById("phone").value
    var email = document.getElementById("email").value

    var userDto = {
        "fullname":fullname,
        "phone":phone,
        "email":email,
        "avatar":linkavatar,
    }
    if(fullname ==""){
        alert("Full Name is empty");
        return;
    }
    if(phone ==""){
        alert("Phone is empty");
        return;
    }
    if(!isPhone(phone)){
        alert("Phone incorrect format")
        return;
    }
    if(email ==""){
        alert("Email is empty");
        return;
    }
    if (!isEmail(email)){
        alert("Email incorrect format")
        return;
    }
    function isPhone(number) {
        return /(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(number);
    }
    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(userDto)
    });

    if (response.status < 300) {
        swal({
                title: "Notification",
                text: "Update information successful!",
                type: "success"
            },
            function(){
                window.location.reload()
            });
    }
    else {
        swal({
                title: "Notification",
                text: "Update information error",
                type: "error"
            },
            function(){ });
    }
}