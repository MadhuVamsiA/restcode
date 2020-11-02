# restcode
To list:
GET http://localhost:8080/studentManagementRest/student


To get:
GET http://localhost:8080/studentManagementRest/student/get?id=$ID
ex: http://localhost:8080/studentManagementRest/student/get?id=95


to delete:
method=DELETE http://localhost:8080/studentManagementRest/student/id
ex: http://localhost:8080/studentManagementRest/student/101



To add:
POST http://localhost:8080/studentManagementRest/student/add
{  
    "name":"post upd",
    "age":"45",
    "branch":"rr",
    "section":"d"
}

To Update: http://localhost:8080/studentManagementRest/student/update
POST 
{   "id":"100",
    "name":"post upd",
    "age":"45",
    "branch":"rr",
    "section":"d"

}


