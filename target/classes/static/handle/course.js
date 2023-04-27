var token = localStorage.getItem("token");

var linkbanner = ""


async function saveCourse() {
    var name = document.getElementById("name").value
    var startdate = document.getElementById("start").value
    var enddate = document.getElementById("end").value
    var starttime = document.getElementById("starttime").value
    var endtime = document.getElementById("endtime").value
    var capacity = document.getElementById("capacity").value
    var price = document.getElementById("price").value

    var linkmeet = document.getElementById("linkmeet").value
    var major = document.getElementById("major").value
    var description = tinyMCE.get('editor').getContent()

    if(name == "" && startdate == "" && enddate == "" && starttime == ""
        && endtime == "" && capacity == "" && price == "" && linkmeet == "" && description == ""){
        alert("Data is empty")
        return;
    }
    if(name == ""){
        alert("Course Name is empty")
        return;
    }
    if(startdate == ""){
        alert("Start Date is empty")
        return;
    }
    if(enddate == ""){
        alert("End Date is empty")
        return;
    }
    if(startdate > enddate){
        alert("End Date is less than Start Date, enter again please!")
        return;
    }
    if(starttime == ""){
        alert("Start Time is empty")
        return;
    }
    if(endtime == ""){
        alert("End Time is empty")
        return;
    }
    if(starttime > endtime){
        alert("End Time is less than Start Time, enter again please!")
        return;
    }
    if(capacity == ""){
        alert("Member is empty")
        return;
    }
    if (capacity < 0){
        alert("Member is negative, enter the number is more than 0")
        return;
    }
    if(price == ""){
        alert("Price is empty")
        return;
    }
    if(price < 0){
        alert("Price is negative, enter the number is more than 1")
        return;
    }
    if(linkmeet == ""){
        alert("Link Meet is empty")
        return;
    }
    if(description == ""){
        alert("Description is empty")
        return;
    }


    var id = window.location.search.split('=')[1];
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

    var url = 'http://localhost:8080/api/teacher/uploadcourse';

    var course = {
        "id": id,
        "name": name,
        "maxQuantity":capacity,
        "price":price,
        "imageBanner":linkbanner,
        "description":description,
        "startDate":startdate,
        "endDate":enddate,
        "startTime":starttime,
        "endTime":endtime,
        "linkmeet":linkmeet,
        "major":{
            "id":major
        }
    }
    console.log(course)
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(course)
    });
    if(response.status < 300){
        swal({
                title: "Notification",
                text: "Upload Course successful!",
                type: "success"
            },
            function(){
                window.location.replace(coursemanager)
            });
    }
    else{
        swal({
                title: "Notification",
                text: "Upload Course failure!",
                type: "error"
            },
            function(){
            });
    }
}
async function loadACourse() {
    var id = window.location.search.split('=')[1];
    if(id != null){
        var url = 'http://localhost:8080/api/public/courseById?id='+id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
            })
        });
        var course = await response.json();
        document.getElementById("name").value = course.name
        document.getElementById("start").value = course.startDate
        document.getElementById("end").value = course.endDate
        document.getElementById("starttime").value = course.startTime.split(":")[0]+':'+course.startTime.split(":")[1]
        document.getElementById("endtime").value = course.endTime.split(":")[0]+':'+course.endTime.split(":")[1]
        document.getElementById("capacity").value = course.maxQuantity
        document.getElementById("price").value = course.price
        document.getElementById("linkmeet").value = course.linkmeet
        document.getElementById("major").value = course.major.id
        document.getElementById("img_banner").src = course.imageBanner
        tinyMCE.get('editor').setContent(course.description)
        linkbanner = course.imageBanner
    }
}

async function coursechuaduyet(page) {
    var url = 'http://localhost:8080/api/teacher/managerCourse?active=0&size=5&page='+page;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    var list  = result.content
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<tr>
                    <td>${list[i].id}</td>
                    <td><img class="img_mycouser" src="${list[i].imageBanner}"></td>
                    <td>${list[i].name}</td>
                    <td>$${list[i].price}</td>
                    <td>${list[i].linkmeet}</td>
                    <td>${list[i].maxQuantity}</td>
                    <td><a href="${uploadcourse}?id=${list[i].id}" class="btn btn-success-blue"><i class="fa fa-edit"></i> Update</a></td>
                    <td><a onclick="deleteCourse(${list[i].id})" class="btn btn-danger-red"><i class="fa fa-trash"></i> Delete</a></td>
                </tr>`
    }
    document.getElementById("listchuaduyet").innerHTML = main
    var totalpage = result.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li onclick="coursechuaduyet('+i+')" class="page-item"><a class="page-link" href="#">'+pas+'</a></li>'
    }
    document.getElementById("pagechuaduyet").innerHTML = ts
}

async function coursedaduyet(page) {
    var url = 'http://localhost:8080/api/teacher/managerCourse?active=1&size=5&page='+page;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    var list  = result.content
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<tr>
                    <td>${list[i].id}</td>
                    <td><img class="img_mycouser" src="${list[i].imageBanner}"></td>
                    <td>${list[i].name}</td>
                    <td>$${list[i].price}</td>
                    <td>${list[i].linkmeet}</td>
                    <td>${list[i].maxQuantity}</td>
                    <td>${list[i].totalNow}</td>
                    <td><a href="${uploadcourse}?id=${list[i].id}" class="btn btn-success-blue"><i class="fa fa-edit"></i></a></td>
                    <td><a onclick="deleteCourse(${list[i].id})" class="btn btn-danger-red"><i class="fa fa-trash"></i></a></td>
                    <td><button onclick="loadMember(${list[i].id})" type="button" data-toggle="modal" data-target=".bd-example-modal-lg" class="btn btn-success-green"><i class="fa fa-users"></i></button></td>
                    <td><button onclick="loadComment(${list[i].id})" type="button" data-toggle="modal" data-target=".bd-example-modal-lgs" class="btn btn-success-blue"><i class="fa fa-comment"></i></button></td>
                </tr>`
    }
    document.getElementById("listdaduyet").innerHTML = main
    var totalpage = result.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li onclick="coursedaduyet('+i+')" class="page-item"><a class="page-link" href="#">'+pas+'</a></li>'
    }
    document.getElementById("pagedaduyet").innerHTML = ts
}

async function loadComment(id){
    var url = 'http://localhost:8080/api/public/findCommentByCourseId?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listresult = await response.json();
    var main = ''
    for(i=0; i<listresult.length; i++){
        main += `<div class="col-md-8">
                   <div class="comment-user">
                     <img src="${listresult[i].user.avatar}">
                     <div class="content-comment">
                       <div class="top-comment-user">
                         <p class="user-comment">${listresult[i].user.username}</p>
                         <p class="time-comment"><i class="fa fa-clock"></i>${listresult[i].createdDate}</p>
                       </div>
                       <p class="contentcmt">${listresult[i].content}</p>
                     </div>
                   </div>
                 </div>`
    }
    document.getElementById("listcommentd").innerHTML = main
}

async function loadMember(courseId) {
    var url = 'http://localhost:8080/api/teacher/subcribleByCourse?id='+courseId+'&paid=1';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listresult = await response.json();
    var main = ''
    for(i=0; i<listresult.length; i++){
        main += `<tr>
                    <td>#${listresult[i].id}</td>
                    <td>${listresult[i].user.username}</td>
                    <td>${listresult[i].createdDate}</td>
                    <td><button onclick="deletePaid(${listresult[i].id})" class="btn btn-danger-red"><i class="fa fa-trash"></i> Delete</button></td>
                </tr>`
    }
    document.getElementById("listmember").innerHTML = main
    document.getElementById("totalmemebt").innerHTML = listresult.length
    document.getElementById("idcourse").value = courseId
}

async function loadMemberNotPaid() {
    if( document.getElementById("checkpaid").checked == false){
        loadMember(document.getElementById("idcourse").value)
        return;
    }
    var courseId = document.getElementById("idcourse").value
    var url = 'http://localhost:8080/api/teacher/subcribleByCourse?id='+courseId+'&paid=0';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listresult = await response.json();
    var main = ''
    for(i=0; i<listresult.length; i++){
        main += `<tr>
                    <td>#${listresult[i].id}</td>
                    <td>${listresult[i].user.username}</td>
                    <td>${listresult[i].createdDate}</td>
                    <td><button onclick="deletePaid(${listresult[i].id})" class="btn btn-danger"><i class="fa fa-trash-red"></i> Delete</button></td>
                    <td><button onclick="confirmCourse(${listresult[i].id})" class="btn btn-success-blue">Confirm</button></td>
                </tr>`
    }
    document.getElementById("listmember").innerHTML = main
    document.getElementById("totalmemebt").innerHTML = listresult.length
}

async function coursedaxoa(page) {
    var url = 'http://localhost:8080/api/teacher/courseByTeacherDelete?size=5&page='+page;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    var list  = result.content
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<tr>
                    <td>${list[i].id}</td>
                    <td><img class="img_mycouser" src="${list[i].imageBanner}"></td>
                    <td>${list[i].name}</td>
                    <td>$${list[i].price}</td>
                    <td>${list[i].linkmeet}</td>
                    <td>${list[i].maxQuantity}</td>
                    <td style="color:red;font-weight: bold;">${list[i].feedBackByAdmin}</td>
                </tr>`
    }
    document.getElementById("listdaxoa").innerHTML = main
    var totalpage = result.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li onclick="coursedaxoa('+i+')" class="page-item"><a class="page-link" href="#">'+pas+'</a></li>'
    }
    document.getElementById("pagedaxoa").innerHTML = ts
}

async function deleteCourse(id) {
    var url = 'http://localhost:8080/api/teacher/deletecourse?id='+id;
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
                    text: "Delete course successful!",
                    type: "success"
                },
                function () {
                    window.location.reload();
                });
        } else {
            swal({
                    title: "Notification",
                    text: "Cannot delete this course",
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

async function confirmCourse(id) {
    var url = 'http://localhost:8080/api/teacher/paidCourse?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        swal({
                title: "Notification",
                text: "Confirm pay successful!",
                type: "success"
            },
            function(){
                window.location.reload();
            });
    }
    else {
        swal({
                title: "Notification",
                text: "Confirm pay error",
                type: "error"
            },
            function(){
                window.location.reload();
            });
    }
}

async function deletePaid(id) {
    var url = 'http://localhost:8080/api/teacher/deleteSub?id='+id;
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
                    text: "Delete successful!",
                    type: "success"
                },
                function () {
                    window.location.reload();
                });
        } else {
            swal({
                    title: "Notification",
                    text: "Can't delete this paid",
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


async function courseHomePage() {
    var url = 'http://localhost:8080/api/public/courseHomePage'
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = ''
    for(i=0; i<list.length; i++){
        main +=  `<div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="course-card">
                        <div class="course-tumb">
                            <img src="${list[i].imageBanner}" />
                        </div>
                    <div class="course-detail">
                        <p class="teach_course">@${list[i].user.username}</p>
                        <h4 class="singCourse_title"><a href="${coursesingle}?id=${list[i].id}">${list[i].name}</a></h4>
                        <p>${list[i].createdDate}</p>
                        
                    </div>
                    <div class="course-bottom-detail">
                        <div class="course-price">
                            $${list[i].price} 
                        </div>
                        <div class="course-link">
                            <a href="${coursesingle}?id=${list[i].id}">View Course</a>
                        </div>
                    </div>
                    </div>
                </div>`
    }
    document.getElementById("listcoursehome").innerHTML = main
}

async function loadCourseByTeacherId(page) {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/public/courseByTeacherId?id='+id+'&size=3&page='+page
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var result = await response.json();
    console.log(result)
    var list = result.content;
    var main = ''
    for(i=0; i<list.length; i++){
        main += `<div class="col-lg-4 col-md-6 col-sm-12 body-course-teach">
                    <div class="main-course">
                    <div class="course-header">
                        <div class="course-title">
                            <h4 "><a href="${coursesingle}?id=${list[i].id}">${list[i].name}</a></h3>
                            <p >${list[i].createdDate}</p>
                        </div>
                    </div>
                    
                    <div class="course-body" >
                        <img src="${list[i].imageBanner}" class="course-imge" />
                        <div class="courseteach-price">$${list[i].price}</div>
                    </div>
                    
                    <div class="course-footer">
                        <div class="item-add">
                            <span class="item-plus">+ <a href="${coursesingle}?id=${list[i].id}" class="item-text" style="text-decoration: none;">View Course</a></span>
                        </div>
                       
                    </div>
                    </div>
                </div>`
    }
    document.getElementById("listcourseteacher").innerHTML = main
    var totalpage = result.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li><a class="chuyentrang" onclick="loadCourseByTeacherId('+i+')">'+pas+'</a></li>'
    }
    document.getElementById("listpageteacher").innerHTML = ts
}

function loadnewSta(){
    var val = document.getElementById("chooseyear").value
    loadStatistic(val)
}

async function loadStatistic(year){
    var main = '';
    for(i=2023; i<2031; i++){
        if(i == year){
            main += '<option value="'+i+'" selected>'+i+'</option>'
        }
        else{
            main += '<option value="'+i+'">'+i+'</option>'
        }
    }
    document.getElementById("chooseyear").innerHTML = main
    const xValues = ["JAN","FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
    const yValues = [];
    var max = 0;
    var total = 0;

    var url = 'http://localhost:8080/api/teacher/statistic?year='+year;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json()
    for(i=0; i<list.length; i++){
        if(max < list[i]){
            max = list[i]
        }
        yValues.push(list[i])
        total += Number(list[i])
    }

    new Chart("myChart", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                fill: false,
                lineTension: 0,
                backgroundColor: "rgba(0,0,255,1.0)",
                borderColor: "rgba(0,0,255,0.1)",
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            scales: {
                yAxes: [{ticks: {min: 0, max:max}}],
            }
        }
    });
}