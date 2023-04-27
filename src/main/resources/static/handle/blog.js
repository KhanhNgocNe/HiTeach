var token = localStorage.getItem("token");

async function loadAllBlog(page) {
    var search = window.location.search.split('search=')[1];
    var url = 'http://localhost:8080/api/public/allblogforuser?size=3&page='+page;
    if(search != null){
        url = 'http://localhost:8080/api/public/allblogforuser?size=3&page='+page+'&search='+search;
    }
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var result = await response.json();
    var listBlog = result.content
    var main = '';
    for (i = 0; i < listBlog.length; i++) {
        main +=  `<div class="col-lg-4 col-4 col-sm-4">
                    <div class="single_blog_archive wow fadeInUp">
                    <div class="course-more">
                        <img  alt="img" src="${listBlog[i].imageBanner}">
                    </div>
                    <h4 class="blog_title"><a href="${blogdetail}?id=${listBlog[i].id}"> ${listBlog[i].title}</a></h4>
                    <div class="blog_commentbox">
                        <p><i class="fa fa-calendar"></i>${listBlog[i].createdDate}</p>
                        <p><i class="fa fa-eye"></i>${listBlog[i].views}</p>
                    </div>
                    <p class="blog_summary">${listBlog[i].description}</p>
                    <a class="blog_readmore" href="${blogdetail}?id=${listBlog[i].id}"">Read More</a>
                    </div>
                </div>`
    }
    document.getElementById("listblog").innerHTML = main
    var totalpage = result.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li><a class="chuyentrang" onclick="loadAllBlog('+i+')">'+pas+'</a></li>'
    }
    document.getElementById("listpage").innerHTML = ts
}


async function loadABlog() {
    var id = window.location.search.split('=')[1];
    if(id != null){
        var url = 'http://localhost:8080/api/public/detailBlog?id='+id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
            })
        });
        var blog = await response.json();
        document.getElementById("blog_title").innerText = blog.title
        document.getElementById("views").innerText = blog.views
        document.getElementById("createdDate").innerText = blog.createdDate
        document.getElementById("content").innerHTML = blog.content
        document.getElementById("img_blogdetail").src = blog.imageBanner
        tinyMCE.get('editor').setContent(blog.content)
        linkbanner = blog.imageBanner
    }
}

async function getBlogTopView() {
    var url = 'http://localhost:8080/api/public/getBlogTopView';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var list = await response.json();
    var main = ''
    for(i=0; i<list.length; i++){
        main += `<li>
                    <div class="media">
                    <div class="media-left">
                        <a href="${blogdetail}?id=${list[i].id}" class="news_img">
                        <img alt="img" src="${list[i].imageBanner}" class="media-object">
                        </a>
                    </div>
                    <div class="media-body">
                    <a href="${blogdetail}?id=${list[i].id}">${list[i].title}</a>
                    <span class="feed_date">${list[i].createdDate}</span>
                    </div>
                    </div>
                </li>`
    }
    document.getElementById("popularpost").innerHTML = main
}

async function getBlogTopViewIndex() {
    var url = 'http://localhost:8080/api/public/getBlogTopView';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var list = await response.json();
    var main = ''
    for(i=0; i<list.length; i++){
        main += `<li>
                    <div class="media">
                    <div class="media-left">
                        <a href="${blogdetail}?id=${list[i].id}" class="news_img">
                        <img alt="img" src="${list[i].imageBanner}" class="media-object">
                        </a>
                    </div>
                    <div class="media-body">
                    <a href="${blogdetail}?id=${list[i].id}">${list[i].title}</a>
                    <span class="feed_date">${list[i].createdDate}</span>
                    </div>
                    </div>
                </li>`
    }
    document.getElementById("listblogindex").innerHTML = main
}

