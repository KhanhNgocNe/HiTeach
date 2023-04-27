var token = localStorage.getItem("token");
function loadMenuAdmin(){
    var main = '<nav class="nav nav-dark ">'+
    '<div> '+
        '<a href="home" class="nav_logo"> '+
            '<i class="bx bx-layer nav_logo-icon"></i> <span class="nav_logo-name">Hi <span style="color: #78ADC9">Teach</span></span> '+
        '</a>'+
        '<div class="nav_list"> '+
            '<a href="home" class="nav_link"> '+
                '<i class="fa fa-home"></i> <span class="nav_name">Home</span> '+
            '</a> '+
            '<a href="user" class="nav_link"> '+
                '<i class="bx bx-user nav_icon"></i> <span class="nav_name">User</span> '+
            '</a> '+
            '<a href="course" class="nav_link"> '+
                '<i class="fas fa-book-reader"></i> <span class="nav_name">Course</span> '+
            '</a> '+
            '<a href="blog" class="nav_link"> '+
                '<i class="fab fa-blogger"></i> <span class="nav_name">Blog</span> '+
            '</a> '+
            '<a href="major" class="nav_link"> '+
                '<i class="fas fa-book-open"></i> <span class="nav_name">Major</span> '+
            '</a> '+
            '<a href="updateinfor" class="nav_link"> '+
            '<i class="fas fa-book-open"></i> <span class="nav_name">Update infor</span> '+
            '</a> '+
        '</div>'+
    '</div> '+
    '<a href="#" class="nav_link" onclick="logoutAdmin()"> '+
        '<i class="bx bx-log-out nav_icon"></i> <span class="nav_name">Sign Out</span> '+
    '</a>'+
'</nav>'

document.getElementById("nav-bar").innerHTML = main;
document.getElementById("img-login").src = '../image/icon-avatar.png'
}

function logoutAdmin(){
    localStorage.removeItem("token");
    window.location.replace("../login")
}

async function checkroleAdmin(){
    var url = 'http://localhost:8080/api/admin/checkroleAdmin';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if(response.status > 300){
        alert("only role Admin use this function")
        window.location.replace('../login')
    }
  }






document.addEventListener("DOMContentLoaded", function(event) {
   
    const showNavbar = (toggleId, navId, bodyId, headerId) =>{
    const toggle = document.getElementById(toggleId),
    nav = document.getElementById(navId),
    bodypd = document.getElementById(bodyId),
    headerpd = document.getElementById(headerId)
    nav.classList.toggle('show')
    // change icon
    toggle.classList.toggle('bx-x')
    // add padding to body
    bodypd.classList.toggle('body-pd')
    // add padding to header
    headerpd.classList.toggle('body-pd')
    // Validate that all variables exist
    if(toggle && nav && bodypd && headerpd){
    toggle.addEventListener('click', ()=>{
        // show navbar
        nav.classList.toggle('show')
        // change icon
        toggle.classList.toggle('bx-x')
        // add padding to body
        bodypd.classList.toggle('body-pd')
        // add padding to header
        headerpd.classList.toggle('body-pd')
    })
    }
    }
    
    showNavbar('header-toggle','nav-bar','body-pd','header')
    
    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link')
    
    function colorLink(){
    if(linkColor){
    linkColor.forEach(l=> l.classList.remove('active'))
    this.classList.add('active')
    }
    }
    linkColor.forEach(l=> l.addEventListener('click', colorLink))
    
     // Your code to run since DOM is loaded and ready
     
    });

