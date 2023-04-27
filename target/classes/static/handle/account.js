
function isEmail(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}

function isPhone(number) {
    return /(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(number);
}
async function regis() {
    //upload image

    var username = document.getElementById("username").value
    var fullname = document.getElementById("fullname").value
    var email = document.getElementById("email").value
    var phone = document.getElementById("phone").value
    var password = document.getElementById("password").value
    var repassword = document.getElementById("repassword").value

    var authen = document.getElementById("role").value

    if(username == "" && fullname=="" && email == "" && phone == "" && password == ""){
        alert("Data is empty, fill information please!")
        return;
    }

    if(username == ""){
        alert("Username is empty")
        return;
    }
    if(fullname == ""){
        alert("Full Name is empty")
        return;
    }
    if(email == ""){
        alert("Email is empty")
        return;
    }
    if (!isEmail(email)){
        alert("Email incorrect format")
        return;
    }
    if(phone == ""){
        alert("Phone Number is empty")
        return;
    }
    if(!isPhone(phone)){
        alert("Phone incorrect format")
        return;
    }
    if(password == ""){
        alert("Password is empty")
        return;
    }
    if(password.length <6){
        alert("Password are more than 5 character")
        return;
    }
    if(repassword == ""){
        alert("Confirm password is empty")
        return;
    }
    if(password != repassword){
        alert("Password does not match")
        return;
    }

    var uploadimg = 'http://localhost:8080/api/public/upload';
    const filePath = document.getElementById('avatar')
    const formData = new FormData()
    formData.append("file", filePath.files[0])
    const response = await fetch(uploadimg, {
        method: 'POST',
        headers: new Headers({

        }),
        body: formData
    });
    var linkimage = '';
    if(response.status > 300){
        alert("Please choose your avatar")
        return
    }
    linkimage = await response.text();

    var url = 'http://localhost:8080/api/register'


    var user = {
        "username": username,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "avatar": linkimage,
        "password": password,
        "authorities": [
            authen
        ]
    }
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(user)
    });
    var result = await res.text();
    console.log(result)
    if (result === '1') {
        alert("Email already exist")
    }
    else if (result === '2') {
        alert("Username already exist")
    }
    else if (result === '0') {
        swal({
                title: "Notification",
                text: "Regis successful! check your email!",
                type: "success"
            },
            function(){
                window.location.replace(loginlink)
            });
    }
}

async function login() {
    var url = 'http://localhost:8080/api/authenticate'
    var username = document.getElementById("username").value
    var password = document.getElementById("password").value
    var user = {
        "username": username,
        "password": password
    }
    if(username==""&&password==""){
        alert("Enter username & password, please!")
        return;
    }
    if (username ==""){
        alert("Username is empty")
        return;
    }
    if (password==""){
        alert("Password is empty")
        return;
    }
    console.log(user)
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(user)
    });

    var token = await response.text();

    if(response.status > 300){
        alert("Username or Password invalid")
    }

    if(response.status < 300){
        window.localStorage.setItem('token', token);
        var urlAccount = 'http://localhost:8080/api/all/userlogged';
        const res = await fetch(urlAccount, {
            method: 'POST',
            headers: new Headers({
                'Authorization': 'Bearer '+token, 
                'Content-Type': 'application/json'
            })
        });

        var account = await res.json();
        window.localStorage.setItem('username', account.username);
        window.localStorage.setItem('myavatar', account.avatar);
        window.localStorage.setItem('role', account.authorities[0].name);
        console.log(account)
        var check = 0;
        for(i=0; i<account.authorities.length; i++){
            if(account.authorities[i].name === 'ROLE_ADMIN'){
                check = 1;
            }
            if(account.authorities[i].name === 'ROLE_TEACHER'){
                check = 2;
            }
        }
        if(check === 0){
            window.location.replace(indexuser)
        }
        if(check === 1){
            window.location.replace(indexadmin)
        }
        if(check === 2){
            window.location.replace(indexuser)
        }
    }
}

async function forgotpass(){
    var email = document.getElementById("email").value
    if (!isEmail(email)){
        alert("Email incorrect format")
        return;
    }
    var url = 'http://localhost:8080/api/resetpass'
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
        }),
        body:email
    });
    if(res.status > 300){
        swal({
            title: "Notification", 
            text: "Not found this email",
            type: "error"
          },
        function(){ 
            window.location.reload();
        });
    }
    else{
        swal({
            title: "Notification", 
            text: "Check your email take new password",
            type: "success"
          },
        function(){ 
            window.location.replace(loginlink)
        });
    }
}
var token = localStorage.getItem("token");

async function loadUser() {
    if(token == null){
        alert("Login to use function")
        window.location.replace(loginlink)
    }
    var url = 'http://localhost:8080/api/all/userlogged';
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var user = await response.json();
    console.log(user)
    document.getElementById("fullname").value = user.fullname
    document.getElementById("phone").value = user.phone
    document.getElementById("email").value = user.email
    document.getElementById("img_avatar").src = user.avatar
    linkavatar = user.avatar
    tinyMCE.get('editor').setContent(user.description)
}

var linkavatar = ''

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


    var url = 'http://localhost:8080/api/userteacher/changeInfor';
    var fullname = document.getElementById("fullname").value
    var phone = document.getElementById("phone").value
    var email = document.getElementById("email").value
    var description = tinyMCE.get('editor').getContent()
    var userDto = {
        "fullname":fullname,
        "phone":phone,
        "email":email,
        "avatar":linkavatar,
        "description":description
    }

    if(fullname == ""){
        alert("Full Name is empty")
        return;
    }
    if(email == ""){
        alert("Email is empty")
        return;
    }
    if (!isEmail(email)){
        alert("Email incorrect format")
        return;
    }
    if(phone == ""){
        alert("Phone is empty")
        return;
    }
    if(!isPhone(phone)){
        alert("Phone incorrect format")
        return;
    }
    if(!isEmail(email)){
        alert("Email incorrect format")
        return;
    }

    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(userDto)
    });

    var urls = 'http://localhost:8080/api/userteacher/addInterest';
    var listMajor = $('#listmajor').val();
    if(listMajor.length > 0){
        var interest = []
        for(i=0; i<listMajor.length; i++){
            var major = {
                "id":listMajor[i]
            }
            interest.push(major)
        }
        const ress = await fetch(urls, {
            method: 'POST',
            headers: new Headers({
                'Authorization': 'Bearer ' + token,
                'Content-Type': 'application/json'
            }),
            body: JSON.stringify(interest)
        });
    }

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

async function changePassword() {
    var token = localStorage.getItem("token");
    var oldpass = document.getElementById("oldpassword").value
    var newpass = document.getElementById("newpassword").value
    var renewpass = document.getElementById("renewpassword").value
    var url = 'http://localhost:8080/api/userteacher/changePassword?old='+oldpass+"&new="+newpass;

    if(oldpass == "" & newpass== "" & renewpass ==""){
        alert("Data is empty, enter password if use want to change");
        return;
    }
    if(oldpass == ""){
        alert("Old password is empty");
        return;
    }
    if(newpass == ""){
        alert("New password is empty");
        return;
    }
    if(renewpass == ""){
        alert("Confirm password is empty");
        return;
    }
    if(newpass.length <6){
        alert("Password are more than 5 character")
        return;
    }
    if(newpass != renewpass){
        alert("New password not match");
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


async function loadTeacher(page) {
    var param = document.getElementById("teachersearch").value
    var url = 'http://localhost:8080/api/public/getAllTeacher?size=8&page='+page+"&search="+param;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var result = await response.json();
    var listTeacher = result.content;
    var totalPage = result.totalPage;
    var main = ''
    for(i=0; i<listTeacher.length; i++){
        main +=  `
              <div class="col-lg-3 col-md-4 col-sm-6">
              
                    <div class="profile-card">
                        <img src="${listTeacher[i].avatar}" class="profile-icon" />
                        <div >
                            <a class="profile-name" href="${teachersingle}?id=${listTeacher[i].id}">${listTeacher[i].fullname}</a>
                        </div>
                        <div class="profile-position">
                            ${listTeacher[i].totalCourse} course
                        </div>
                        <a href="${teachersingle}?id=${listTeacher[i].id}" class="button">View Profile</a>
                    </div>
                 
              </div>`



    }
    document.getElementById("listteacher").innerHTML = main
    var mainpage = ''
    for(i=0; i<totalPage; i++){
        var pagename = Number(i)+Number(1)
        mainpage += '<li class="page-item" onclick="loadTeacher('+i+')"><a class="page-link">'+pagename+'</a></li>'
    }
    document.getElementById("listpageteacher").innerHTML = mainpage
}


async function loadAllMajor() {
    var url = 'http://localhost:8080/api/public/allMajor'
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listresult = await response.json(); 

    var urls = 'http://localhost:8080/api/userteacher/majorinterests'
    const res = await fetch(urls, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer '+token
        })
    });
    var listMyFavorites = await res.json(); 
    if(listMyFavorites.length < 1){
        document.getElementById("lbchoosemajor").style.color = 'red'
    }
    var main = '';
    for(i=0; i< listresult.length; i++){
        main += '<option value="'+listresult[i].id+'" data-tokens="'+listresult[i].id+'">'+listresult[i].name+'</option>'
    }
    document.getElementById("listmajor").innerHTML = main
    document.getElementById("listmajor").classList.add("selectpicker");
    $('.selectpicker').selectpicker();
    var values = []
    console.log(listMyFavorites)
    for(j=0; j<listMyFavorites.length; j++){
        values.push(listMyFavorites[j].major.id)
    }
    console.log(values)
    $('#listmajor').selectpicker('val', values);
}

async function loadATeacher() {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/public/teacherById?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var result = await response.json();
    document.getElementById("home").innerHTML = result.description
    document.getElementById("img_teacher").src = result.avatar
    document.getElementById("teacername").innerHTML = result.fullname
    document.getElementById("username-teacher").innerHTML = result.username
    document.getElementById("callteacher").href = 'tel:'+result.phone
    document.getElementById("mailteacher").href = 'mailto:'+result.email
    document.getElementById("chatteacher").href = 'chat?id='+result.id
    document.getElementById("call-teacher").innerHTML = result.phone
    document.getElementById("mail-teacher").innerHTML = result.email
}

async function loadCourseByTeacherId() {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/public/allMajor'
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listresult = await response.json(); 

    var urls = 'http://localhost:8080/api/userteacher/majorinterests'
    const res = await fetch(urls, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer '+token
        })
    });
    var listMyFavorites = await res.json(); 
    if(listMyFavorites.length < 1){
        document.getElementById("lbchoosemajor").style.color = 'red'
    }
    var main = '';
    for(i=0; i< listresult.length; i++){
        main += '<option value="'+listresult[i].id+'" data-tokens="'+listresult[i].id+'">'+listresult[i].name+'</option>'
    }
    document.getElementById("listmajor").innerHTML = main
    document.getElementById("listmajor").classList.add("selectpicker");
    $('.selectpicker').selectpicker();
    var values = []
    console.log(listMyFavorites)
    for(j=0; j<listMyFavorites.length; j++){
        values.push(listMyFavorites[j].major.id)
    }
    console.log(values)
    $('#listmajor').selectpicker('val', values);
}
