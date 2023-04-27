var token = localStorage.getItem("token");


async function loadMySubscrible(page){
    var url = 'http://localhost:8080/api/user/mysubcrible?paid=1&size=4&page='+page;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listresult = await response.json();
    var list = listresult.content;
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<tr>
                    <td>${list[i].id}</td>
                    <td><img class="img_mycouser" src="${list[i].course.imageBanner}"></td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].course.name}</td>
                    <td>${formatmoneys(list[i].course.price)}</td>
                    <td>${list[i].course.linkmeet}</td>
                    <td>${list[i].course.maxQuantity}</td>
                </tr>`
    }
    document.getElementById("listCourseApprove").innerHTML = main
    var totalpage = listresult.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li onclick="loadMySubscrible('+i+')" class="page-item"><a class="page-link" href="#">'+pas+'</a></li>'
    }
    document.getElementById("pageapprove").innerHTML = ts
}

async function loadMySubscribleNotPaid(page){
    var url = 'http://localhost:8080/api/user/mysubcrible?paid=0&size=4&page='+page;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listresult = await response.json();
    var list = listresult.content;
    var main = ''
    for(i=0; i<list.length; i++){
        main +=   `<tr>
                    <td>${list[i].id}</td>
                    <td><img class="img_mycouser" src="${list[i].course.imageBanner}"></td>
                    <td>${list[i].course.name}</td>
                    <td>${formatmoneys(list[i].course.price)}</td>
                    <td>${list[i].course.maxQuantity}</td>
                    <td><a onclick="deleteSubCrible(${list[i].id})" class="btn btn-danger-red"><i class="fa fa-trash"></i> Delete</a></td>
                </tr>`
    }
    document.getElementById("listCourseUnApprove").innerHTML = main
    var totalpage = listresult.totalPages
    var ts = ''
    for(i=0; i< totalpage; i++){
        var pas = Number(i)+Number(1);
        ts += '<li onclick="loadMySubscribleNotPaid('+i+')" class="page-item"><a class="page-link" href="#">'+pas+'</a></li>'
    }
    document.getElementById("pageUnpaid").innerHTML = ts
}

async function deleteSubCrible(id) {
    var url = 'http://localhost:8080/api/user/deleteSubcrible?id='+id;
    var result = confirm("Are you sure to delete?");
    if(result)
    {
        const response = await fetch(url, {
            method: 'DELETE',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        if (response.status < 300) {
            swal({
                    title: "Notification",
                    text: "Unsubscribe successfully!",
                    type: "success"
                },
                function(){
                    window.location.reload();
                });
        }
        else {
            swal({
                    title: "Notification",
                    text: "Can't Unsubscribe this course",
                    type: "error"
                },
                function(){
                    window.location.reload();
                });
        }
    }
    else{
        return false;
    }

}

function formatmoneys(money) {
    const VND = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });
    return VND.format(money);
}