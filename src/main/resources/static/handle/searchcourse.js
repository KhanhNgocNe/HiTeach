function formatmoney(money) {
    const VND = new Intl.NumberFormat('en-IN', {
        style: 'currency',
        currency: 'usd',
    });
    return VND.format(money);
}

async function getMajorSearch() {
    var url = 'http://localhost:8080/api/public/allMajor';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var list = await response.json();
    var main =  `<label class="radio-custom">All Course
                    <input checked value="-1" type="radio" name="majorsearch">
                    <span class="checkmark"></span>
                </label>`;
    for(i=0; i<list.length; i++){
        main += `<label class="radio-custom">${list[i].name}
                    <input value="${list[i].id}" type="radio" name="majorsearch">
                    <span class="checkmark"></span>
                </label>`
    }
    document.getElementById("listmajorsearch").innerHTML = main
}

async function searchCourseByParam(page) {
    var param = window.location.search.split('search=')[1];
    if(param == null){
        searchFullCourse(0)
    }
    var url = 'http://localhost:8080/api/public/searchCourseByParam?size=6&page='+page+'&param='+param
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listresult = await response.json();
    var list = listresult.content;
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<div class="col-lg-4 course-box">
                    <div href="${coursesingle}?id=${list[i].id}" class="course_card">
                        <img class="card-img-top" src="${list[i].imageBanner}" />
                        <div class="card_body">
                            <div class="card_title"><a href="${coursesingle}?id=${list[i].id}">${list[i].name}</a></div>
                            <div class="course-name-detail">
                                <p class="card-text"><i class="fa fa-calendar"></i> ${list[i].createdDate}</p>
                                <p class="card-text"><i class="fa fa-users"></i>  ${list[i].totalNow}/ ${list[i].maxQuantity}</p><br>
                            </div>
                            
                        </div>
                        <div class="price_box ">
                            <div class="course_author_image">
                                    <img src="${list[i].user.avatar}" />
                            </div>    
                            <div class="course_author_name">${list[i].user.fullname}</div>
                            <div class="course_price "><span>${formatmoney(list[i].price)}</span></div>
                        </div>
                    </div>
                </div>`
    }
    document.getElementById("listcoursesearch").innerHTML = main
    var totalpage = listresult.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li><a class="chuyentrang" onclick="searchCourseByParam('+i+')">'+pas+'</a></li>'
    }
    document.getElementById("listpagesesrch").innerHTML = ts
}

async function searchFullCourse(page) {
    var price = document.querySelector('input[name="khoangia"]:checked').value;
    var small = price.split("-")[0]
    var lager = price.split("-")[1]
    var major = -1
    try {
        major = document.querySelector('input[name="majorsearch"]:checked').value;
    } catch (error) {
        major = -1
    }
    var url = 'http://localhost:8080/api/public/allCourseSearch?size=6&page='+page+'&idmajor='+major+'&small='+small+'&lager='+lager+'';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listresult = await response.json();
    var list = listresult.content;
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<div class="col-lg-4 col-md-8 col-sm-12 course-box">
                    <div href="${coursesingle}?id=${list[i].id}" class="course_card">
                    <div class="layout-img" >
                        <img class="card-img-top" src="${list[i].imageBanner}" />
                    </div>
                        <div class="card_body">
                            <div class="card_title"><a href="${coursesingle}?id=${list[i].id}">${list[i].name}</a></div>
                            <div class="course-name-detail">
                                <p class="card-text"><i class="fa fa-calendar"></i> ${list[i].createdDate}</p>
                                <p class="card-text"><i class="fa fa-users"></i>  ${list[i].totalNow}/ ${list[i].maxQuantity}</p><br>
                            </div>
                            
                        </div>
                        <div class="price_box ">
                            <div class="course_author_image">
                                    <img src="${list[i].user.avatar}" />
                            </div>    
                            <div class="course_author_name">${list[i].user.fullname}</div>
                            <div class="course_price "><span>${formatmoney(list[i].price)}</span></div>
                        </div>
                    </div>
                </div>`
    }
    document.getElementById("listcoursesearch").innerHTML = main
    var totalpage = listresult.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li><a class="chuyentrang" onclick="searchFullCourse('+i+')">'+pas+'</a></li>'
    }
    document.getElementById("listpagesesrch").innerHTML = ts
}

async function loadACourseDetail() {
    var token = localStorage.getItem("token");
    if(token == null){
        document.getElementById("btnregister").style.display = 'none'
    }
    var role = localStorage.getItem("role");
    if(role == 'ROLE_TEACHER' || role == 'ROLE_ADMIN'){
        document.getElementById("btnregister").style.display = 'none'
    }
    var id = window.location.search.split('=')[1];
    if(id != null){
        var url = 'http://localhost:8080/api/public/courseById?id='+id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
            })
        });
        var course = await response.json();
        document.getElementById("img_banner").src = course.imageBanner
        document.getElementById("avataruser").src = course.user.avatar
        document.getElementById("nameteacher").innerText = course.user.fullname
        document.getElementById("pricecourse").innerText = formatmoney(course.price)
        document.getElementById("description").innerHTML = course.description
        document.getElementById("timing").innerHTML = course.startTime+' - '+course.endTime
        document.getElementById("teachername").innerHTML = course.user.fullname
        document.getElementById("coursename").innerHTML = course.name
        document.getElementById("dateto").innerHTML = course.startDate+' - '+course.endDate

        linkbanner = course.imageBanner
    }
    
}


var token = localStorage.getItem("token");
async function subcribleCourse() {
    var id = window.location.search.split('=')[1];
    var url = 'http://localhost:8080/api/user/subcribleCourse';
    var subcrible = {
        "course": {
            "id":id
        }
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(subcrible)
    });
    if(response.status < 300){
        swal({
            title: "Notification", 
            text: "Subcrible course successful!",
            type: "success"
          },
        function(){ 
            window.location.replace(mycourselink)
        });
    }
    if(response.status == 300){
        swal({
            title: "Notification", 
            text: "This course is full of members!", 
            type: "error"
          },
        function(){ 
        });
    }
    if(response.status == 350){
        swal({
            title: "Notification", 
            text: "This course is already registered!", 
            type: "warning"
          },
        function(){ 
        });
    }
}

async function loadCourseLq() {
    var id = window.location.search.split('=')[1];
    if(id != null){
        var url = 'http://localhost:8080/api/public/searchCourseL?id='+id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
            })
        });
        var courses = await response.json();
        var main = ''
        for(i=0; i<courses.length; i++){
            main +=
                `<div class="col-lg-4 col-md-4 col-sm-4">
                <div class="course-more">
                    <img  src="${courses[i].imageBanner}" />
                        
                  
                    <div class="singCourse_content">
                    <h3 class="singCourse_title"><a href="coursedetail?id=${courses[i].id}">${courses[i].name}</a></h3>
                    <p>27-02-2023</p>
                    <p class="tearch_course">${courses[i].user.username}</p>
                    <p class="singCourse_price"><span>$${courses[i].price}</span></p>
                    </div>
                    <div class="course-link"><a href="coursedetail?id=${courses[i].id}" >View Course</a></div>
                    
                </div>
                </div>`
        }
        document.getElementById("morecourse").innerHTML = main
    }

}

async function searchCourseByParamInput(page) {
    var param = document.getElementById("coursesearch").value
    var url = 'http://localhost:8080/api/public/searchCourseByParam?size=6&page='+page+'&param='+param
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var listresult = await response.json();
    var list = listresult.content;
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="single_course wow fadeInUp">
                    <div class="singCourse_imgarea">
                        <img src="${list[i].imageBanner}" />
                        <div class="mask">                         
                        <a href="${coursesingle}?id=${list[i].id}" class="course_more">View Course</a>
                        </div>
                    </div>
                    <div class="singCourse_content">
                        <h3 class="singCourse_title"><a href="${coursesingle}?id=${list[i].id}">${list[i].name}</a></h3>
                        <p class="createddate"><i class="fa fa-calendar"></i> ${list[i].createdDate}</p>
                        <p class="createddate" style="margin-left:5px"><i class="fa fa-users"></i>  ${list[i].totalNow}/ ${list[i].maxQuantity}</p><br>
                        <p class="tearch_course">${list[i].user.username}</p>
                        <p class="singCourse_price"><span>${formatmoney(list[i].price)}</span></p>
                    </div>
                    </div>
                </div>`
    }
    document.getElementById("listcoursesearch").innerHTML = main
    var totalpage = listresult.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li><a class="chuyentrang" onclick="searchCourseByParamInput('+i+')">'+pas+'</a></li>'
    }
    document.getElementById("listpagesesrch").innerHTML = ts
}

