


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
function listStudentsApi(){ 
	
	var obj, dbParam, xmlhttp, myObj, x, txt = "";
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    myObj = JSON.parse(this.responseText);
	    txt += "<table border='1'>"
	    	 console.log(myObj);
	    for (x in myObj) {
	    	 console.log(x);
	    	 for (j in x)
	    		 console.log(j);
	      }
	    console.log(myObj["student"]);
	  
	  
	    for (x in myObj["student"]) {

	    $("#productTable").append("<tr>" + 
	        "<td>"+myObj["student"][x].id+"</td>" +
	        "<td>"+myObj["student"][x].name+"</td>" +
	        "<td>"+myObj["student"][x].age+"</td>" +
	        "<td>"+myObj["student"][x].branch+"</td>" +
	        "<td>"+myObj["student"][x].section+"</td>" +
	        "<td><button onclick='deleteStudent("+ myObj["student"][x].id+ ")'>delete</button> </td>"+

	        "</tr>");

	    	 }
	    
	    $("#productTable").append(  "<tr> <td></td>"+
	    		'<td> <input type="text" id="name" placeholder="name"> </td>'+
	    		'<td> <input type="text" id="age" placeholder="age"> </td>'+
        '<td><input type="text" id="branch" placeholder="branch"></td> '+
       ' <td><input type="text" id="section" placeholder="section"> </td>'+
'        <td><button onclick="addStudent()">Add</button> </td>');
	  }
	};
	xmlhttp.open("GET", "http://localhost:8080/studentManagementRest/student", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
		
	} 
$(document).ready(function () {
	listStudentsApi();
});


function deleteStudent(sid){ 
	
	let result = document.querySelector('.result'); 
	let id = sid; 

	
	// Creating a XHR object 
	let xhr = new XMLHttpRequest(); 
	let url = "http://localhost:8080/studentManagementRest/student/"+sid;

	// open a connection 
	xhr.open("DELETE", url, true); 

	// Set the request header i.e. which type of content you are sending 
	xhr.setRequestHeader("Content-Type", "application/json"); 

	// Create a state change callback 
	xhr.onreadystatechange = function () { 
		if (xhr.readyState === 4 && xhr.status === 200) { 

			// Print received data from server 
			//result.innerHTML = this.responseText; 
			refreshPage();
			return;

		} 
	}; 

	// converting JSON data to string 
	//	var data = JSON.stringify({ "name": name.value, "age": age.value,"branch": branch.value,"section": section.value }); 

	// Sending data with the request 
	xhr.send(); 
} 


function addStudent(){ 
	
	let result = document.querySelector('.result'); 
	let name = document.querySelector('#name'); 
	let age = document.querySelector('#age'); 
	let branch = document.querySelector('#branch'); 
	let section = document.querySelector('#section'); 
	
	// Creating a XHR object 
	let xhr = new XMLHttpRequest(); 
	let url = "http://localhost:8080/studentManagementRest/student/add"; 

	// open a connection 
	xhr.open("POST", url, true); 

	// Set the request header i.e. which type of content you are sending 
	xhr.setRequestHeader("Content-Type", "application/json"); 

	// Create a state change callback 
	xhr.onreadystatechange = function () { 
		if (xhr.readyState === 4 && xhr.status === 200) { 

			// Print received data from server 
			result.innerHTML = this.responseText; 

		} 
	}; 

	// Converting JSON data to string 
	var data = JSON.stringify({ "name": name.value, "age": age.value,"branch": branch.value,"section": section.value }); 

	// Sending data with the request 
	xhr.send(data); 
	refreshPage();
} 


function updateStudent(){ 
	
	let result = document.querySelector('.result'); 
	let name = document.querySelector('#name'); 
	let id = document.querySelector('#id'); 
	let age = document.querySelector('#age'); 
	let branch = document.querySelector('#branch'); 
	let section = document.querySelector('#section'); 
	
	// Creating a XHR object 
	let xhr = new XMLHttpRequest(); 
	let url = "http://localhost:8080/studentManagementRest/student/update"; 

	// open a connection 
	xhr.open("POST", url, true); 

	// Set the request header i.e. which type of content you are sending 
	xhr.setRequestHeader("Content-Type", "application/json"); 

	// Create a state change callback 
	xhr.onreadystatechange = function () { 
		if (xhr.readyState === 4 && xhr.status === 200) { 

			// Print received data from server 
			result.innerHTML = this.responseText; 

		} 
	}; 

	// Converting JSON data to string 
	var data = JSON.stringify({ "id":id.value, "name": name.value, "age": age.value,"branch": branch.value,"section": section.value }); 

	// Sending data with the request 
	xhr.send(data); 
} 


function refreshPage(){
    window.location.reload();
}



</script>
<body>
<a href="http://localhost:8080/front/updatestudent.jsp">Update Students</a>


				
<table id="productTable">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Age</th>
						<th>Branch</th>
						<th>Section</th>
						<th>delete</th>
						<th>edit</th>
					</tr>
				</thead>

</body>
</html>