<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Prescription</title>
    <link rel="stylesheet" type="text/css" href="prescriptionUpload.css">
    <link rel="stylesheet" type="text/css" href="navigationBarcss.css">
</head>
<body>
	
	<%
		String cusId = request.getParameter("id");
		String cusName = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String userName = request.getParameter("uname");
	%>
	
	

	<header>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="logo.png" alt="Logo"></a>
            </div>
            <ul class="nav-links">
                
               
                <li><a href="prescriptionStatus.jsp?id=<%= cusId %>&name=<%= cusName %>&email=<%= email %>&phone=<%= phone %>&uname=<%= userName %>">Prescriptions</a></li>
             	
            </ul>
        </nav>
    </header>

    <h1>Upload Prescription</h1>
    
    <div>
    
    	<img id="stepsImage" alt="stepsImage" src="images/uplPresPageImg1.jpg">
    
	    <form action="presUpload" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
	        
	        <div>
	        	<input type="hidden" name="cusID" id="cusID" value="<%= cusId %>">
	        	
	        	<label for="patientName">Patient's Name:</label>
		        <input type="text" name="patientName" id="patientName" required value="<%= cusName %>">
		        <br>
		        
		        <label for="patientAge">Patient's Age:</label>
		        <input type="text" name="patientAge" id="patientAge" required>
		        <br>
		        
		        <label for="contactNumber">Contact Number:</label>
		        <input type="text" name="contactNumber" id="contactNumber" required value="<%= phone %>">
		        <br>
		        
		        <label for="contactNumber">Email:</label>
		        <input type="text" name="email" id="email" required value="<%= email %>">
		        <br>
	        </div>
	
	        
	        
	        <br><br>
	

			<div class="form-group">
			    <label for="fulfillment">Fulfillment:</label>
			    <select name="fulfillment" id="fulfillment" required>
			        <option value="full">Full</option>
			        <option value="partial">Partial</option>
			    </select>
			</div>
			
	
			<div class="form-group" id="prescriptionTextArea" style="display: none;">
			    <label for="prescriptionText">Enter the prescription items and qty:</label>
			    <textarea name="prescriptionText" rows="4" cols="50"></textarea>
			</div>

	        <br>
	
	     
	        <label for="orderType">Order Type:</label>
	        <select name="orderType">
	            <option value="normal" selected>Normal Order</option>
	            <option value="priority">Priority Order</option>
	        </select>
	        <br>
	        
	        <div class="substitute">
	        	<div><label for="substitutes">Receiving substitutes:</label></div>
	        	<div><input type="radio" name="substitutes" value="yes" required> Okay</div>
	        	<div><input type="radio" name="substitutes" value="no" required> Not okay</div>
	        </div>
	        
	        <h4>Prescription</h4>
	        <input type="file" name="file1" required>
	        <br>
	
	
	        <input type="submit" value="Upload Prescription">
	    </form>
    
    </div>
    
    
    <script>
	    var fulfillmentSelect = document.getElementById("fulfillment");
	    var prescriptionTextArea = document.getElementById("prescriptionTextArea");
	
	    fulfillmentSelect.addEventListener("change", function () {
	        if (fulfillmentSelect.value === "partial") {
	            prescriptionTextArea.style.display = "block";
	        } else {
	            prescriptionTextArea.style.display = "none";
	        }
	    });

	    function validateForm() {
	        var patientName = document.getElementById("patientName").value;
	        var patientAge = document.getElementById("patientAge").value;
	        var contactNumber = document.getElementById("contactNumber").value;
	        var email = document.getElementById("email").value;
	        var fulfillment = document.getElementById("fulfillment").value;

	        if (patientName.trim() === "") {
	            alert("Please enter the patient's name.");
	            return false;
	        }

	        if (isNaN(patientAge) || patientAge.trim() === "") {
	            alert("Please enter a valid patient age (numeric value).");
	            return false;
	        }

	        if (contactNumber.trim() === "" || !/^\d{10}$/.test(contactNumber)) {
	            alert("Please enter a valid 10-digit contact number.");
	            return false;
	        }

	        if (email.trim() === "" || !/^\S+@\S+\.\S+$/.test(email)) {
	            alert("Please enter a valid email address.");
	            return false;
	        }

	        if (fulfillment === "partial" && document.getElementById("prescriptionText").value.trim() === "") {
	            alert("Please enter the prescription items and quantity for partial fulfillment.");
	            return false;
	        }
	        
	        


	        return true;
	    }
	</script>
</body>
</html>
	