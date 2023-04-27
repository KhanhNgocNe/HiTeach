async function loadMenu(){
    var manager = ''
    var chat = ''
    var accounts = '<li><a href="'+loginlink+'">Login</a></li>'
    var token = localStorage.getItem("token");
    var role = localStorage.getItem("role");
    if(token != null){
        chat = '<li><a href="'+chatlink+'">Chat</a></li>'
        accounts = '<li class="dropdown">'+
                        '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account<span class="caret"></span></a>'+
                        '<ul class="dropdown-menu" role="menu">'+
                            '<li><a href="'+mycourselink+'">My Course</a></li>'+
                            '<li><a href="'+updateinfor+'">Update Information</a></li>'+               
                            '<li><a class="linklogout" onclick="logout()">Logout</a></li>'+               
                        '</ul>'+
                    '</li>'
    }
    if(role === 'ROLE_TEACHER'){
        manager ='<li class="dropdown">'+
                    '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> Manage Course<span class="caret"></span></a>'+
                    '<ul class="dropdown-menu" role="menu">'+
                        '<li><a style="color:#fff" href="'+coursemanager+'">Manage Course</a></li>'+
                        '<li><a href="'+uploadcourse+'">Upload Course</a></li>'+
                    '</ul>'+
                '</li>'
        accounts = '<li class="dropdown">'+
            '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Account<span class="caret"></span></a>'+
            '<ul class="dropdown-menu" role="menu">'+
            '<li><a href="'+updateinfor+'">Update Information</a></li>'+
            '<li><a class="linklogout" onclick="logout()">Logout</a></li>'+
            '</ul>'+
            '</li>'
    }

    var menu = '<div class="menu_area">'+
                '<nav class="navbar navbar-default navbar-fixed-top" role="navigation">  <div class="container">'+
                    '<div class="navbar-header">'+
                    '<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">'+
                        '<span class="sr-only">Toggle navigation</span>'+
                        '<span class="icon-bar"></span>'+
                        '<span class="icon-bar"></span>'+
                        '<span class="icon-bar"></span>'+
                   ' </button>'+
                    '<a class="navbar-brand brand" href="/">HI <span>Teach</span></a>'+
                    '</div>'+
                    '<div id="navbar" class="navbar-collapse collapse">'+

                    '<ul id="top-menu" class="nav navbar-nav navbar-right main-nav menu" >'+

                        '<li class="active" ><a href="/">Home</a></li>'+
                        '<li><a href="course">Course</a></li>'+
                        '<li><a href="teachers">Teacher</a></li>'+
                        '<li><a href="blog">Blog</a></li>'+
                        '<li><a href="help">FAQs</a></li>'+
                        '<li><a href="guidelines">Guide</a></li>'+
                        ''+chat+''+
                        ''+manager+''+
                        ''+accounts+''+
                        '<li><a class="search_menu" data-toggle="modal" data-target=".bd-search"><i class="fa fa-search"></i></a></li>'+
                    '</ul>'+

                '</div>'+     
                '</nav>'+  
            '</div>'+
            '<div class="modal fade bd-search" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">'+
                '<div class="modal-dialog modal-lg">'+
                '<div class="modal-content">'+
                    '<div class="modal-header"><h5 class="modal-title" id="exampleModalLabel">Search Course</h5></div>'+
                    '<div class="modal-body">'+
                        '<form method="GET" action="course">'+
                            '<input name="search" type="text" placeholder="Search Course" class="form-control"><br>'+
                            '<button class="btn btn-primary form-control">Search</button>'+
                        '</form>'+
                    '</div>'+
                '</div>'+
                '</div>'+
            '</div>'

            
    document.getElementById("header").innerHTML = menu

    var footer = '<div class="footer_top">'+
                    '<div class="container">'+
                    '<div class="row">'+
                        '<div class="col-ld-3  col-md-3 col-sm-3">'+
                        '<div class="single_footer_widget">'+
                            '<h3>About Us</h3>'+
                            '<p>ABOUT US\n' +
        'Learning one-on-one is effective. From day one, we have held that belief. But we also understood that technology would function more effectively if it were available, inexpensive, and more practical for everyone</p>'+
                        '</div>'+
                        '</div>'+
                        '<div class="col-ld-3  col-md-3 col-sm-3">'+
                        '<div class="single_footer_widget">'+
                            '<h3>HiTeach</h3>'+
                            '<ul class="footer_widget_nav">'+
                            '<li><a href="course">Course</a></li>'+
                            '<li><a href="teachers">Teacher</a></li>'+
                            '<li><a href="blog">Blog</a></li>'+

                            '</ul>'+
                        '</div>'+
                        '</div>'+
                        '<div class="col-ld-3  col-md-3 col-sm-3">'+
                        '<div class="single_footer_widget">'+
                            '<h3>Others</h3>'+
                            '<ul class="footer_widget_nav">'+
                            '<li><a href="#">FAQs</a></li>'+
                            '<li><a href="#">Guidelines</a></li>'+
                            ''+chat+''+
                            ''+manager+''+
                            ''+accounts+''+
                            '</ul>'+
                        '</div>'+
                        '</div>'+
                       ' <div class="col-ld-3  col-md-3 col-sm-3">'+
                        '<div class="single_footer_widget">'+
                            '<h3>Social Links</h3>'+
                            '<ul class="footer_social">'+
                            '<li><a data-toggle="tooltip" data-placement="top" title="Facebook" class="soc_tooltip" href="#"><i class="fa fa-facebook"></i></a></li>'+
                            '<li><a data-toggle="tooltip" data-placement="top" title="Twitter" class="soc_tooltip"  href="#"><i class="fa fa-twitter"></i></a></li>'+
                            '<li><a data-toggle="tooltip" data-placement="top" title="Google+" class="soc_tooltip"  href="#"><i class="fa fa-google-plus"></i></a></li>'+
                            '<li><a data-toggle="tooltip" data-placement="top" title="Linkedin" class="soc_tooltip"  href="#"><i class="fa fa-linkedin"></i></a></li>'+
                            '<li><a data-toggle="tooltip" data-placement="top" title="Youtube" class="soc_tooltip"  href="#"><i class="fa fa-youtube"></i></a></li>'+
                            '</ul>'+
                        '</div>'+
                        '</div>'+
                    '</div>'+
                    '</div>'+
                '</div>'

    document.getElementById("footer").innerHTML = footer
}


async function checkInterest() {
    var token = localStorage.getItem("token");
    var urls = 'http://localhost:8080/api/userteacher/majorinterests'
    const res = await fetch(urls, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer '+token
        })
    });
    var listMyFavorites = await res.json(); 
    if(listMyFavorites.length < 1){
        swal({
            title: "Notification", 
            text: "Choose majors that interests you!", 
            type: "warning"
          },
        function(){ 
            window.location.replace(updateinfor)
        });
    }
}

async function logout(){
    localStorage.removeItem("token");
    localStorage.removeItem("role");
    window.location.replace(loginlink)
}

