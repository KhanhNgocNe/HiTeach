async function getMajorIndex() {
    var search = document.getElementById("searchmajor").value
    var url = 'http://localhost:8080/api/public/allMajorByParam?search='+search;
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
                        <a class="news_img" href="#">
                        <img class="media-object" src="${list[i].imagebanner}" alt="img">
                        </a>
                    </div>
                    <div class="media-body">
                    <a href="#">${list[i].name}</a>
                    <span class="feed_date">27.02.15</span>
                    </div>
                    </div>                   
                </li>`
    }
    document.getElementById("listmajorindex").innerHTML = main
}


async function getMajorUpload() {
    var url = 'http://localhost:8080/api/public/allMajor';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
        })
    });
    var list = await response.json();
    var main = ''
    for(i=0; i<list.length; i++){
        main += '<option value="'+list[i].id+'">'+list[i].name+'</option>'
    }
    document.getElementById("major").innerHTML = main
}