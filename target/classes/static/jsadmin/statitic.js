var token = localStorage.getItem("token");

async function loadstatitic() {
    var url = 'http://localhost:8080/api/admin/statitic';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var statitic = await response.json();
    console.log(statitic)
    document.getElementById("totalaccount").innerText = statitic.totalAccount
    document.getElementById("totalcourse").innerText = statitic.totalCourse
    document.getElementById("totalmajor").innerText = statitic.totalMajor
    document.getElementById("totalblog").innerText = statitic.totalBlog

    var url = 'http://localhost:8080/api/admin/getUserNotAdminThisMonth';
    const res = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listuser = await res.json();

    var main = '';
    for (i = 0; i < listuser.length; i++) {
        main += '<tr>'+
                    '<td>'+listuser[i].id+'</td>'+
                    '<td>'+listuser[i].username+'</td>'+
                    '<td>'+listuser[i].fullname+'</td>'+
                    '<td>'+listuser[i].email+'</td>'+
                    '<td>'+listuser[i].created_date+'</td>'+
                '</tr>'
    }
    document.getElementById("listuser").innerHTML = main
    document.getElementById("totauser").innerHTML = ' ('+listuser.length+' user this month)'
}
