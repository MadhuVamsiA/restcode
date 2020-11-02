
<!DOCTYPE html>
<html>
<body>

<h2>Student Data</h2>

<p id="demo"></p>

<script>
function sendJSON(){ 
	
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


function openWin() {
	  window.open("http://localhost:8080/front/list2.jsp");
	}
</script>
	<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Age</th>
	<th>Branch</th>
	<th>Section</th>
	<th>Actions</th>
	</tr>
	
		
		<body style="text-align:center;" id="body"> 
	  
    <p> 
        <!-- Making a text input -->
        <input type="text" id="id" placeholder="id"> 
        <input type="text" id="name" placeholder="name"> 
        <input type="text" id="age" placeholder="age"> 
        <input type="text" id="branch" placeholder="branch"> 
        <input type="text" id="section" placeholder="section"> 
                  
        <!-- Button to send data -->
        <button onclick="sendJSON(), openWin()">Update Student</button> 
  
      <!-- For printing result from server -->
      <p class="result" style="color:green"></p> 
      
   </p> 
  

</body>
</html>
