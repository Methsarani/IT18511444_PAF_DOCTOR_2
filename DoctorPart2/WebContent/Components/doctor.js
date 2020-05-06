$(document).ready(function()
{
	$("#alertSuccess").hide();
	
	$("#alertError").hide();
});

//SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide(); 
	
	//Form validation-------------------
	var status = validateDoctorForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	

	// If valid-------------------------
	
	//$("#formDoctor").submit();
	
	
	var type = ($("#hidDoctorIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
			{
				url : "DoctorAPI",
				type : type,
				data : $("#formDoctor").serialize(),
				dataType : "text",
				complete : function(response, status) {
					onDoctorSaveComplete(response.responseText, status);
				}
			});
	
	
 });

	


function onDoctorSaveComplete(response, status) {
	if (status == "success")
		{
			var resultSet = JSON.parse(response);
			
			if (resultSet.status.trim() == "success")
				{
				$("#alertSuccess").text("Successfully saved.");
				$("#alertSuccess").show();
				
				$("#divDoctorGrid").html(resultSet.data);
				}else if (resultSet.status.trim() == "error")
					{
					$("#alertError").text(resultSet.data);
					$("#alertError").show();
					
					}
		}else if (status == "error")
		{
			$("#alertError").text("Error while saving.");
			$("#alertError").show();
		}else
			{
			$("#alertError").text("UnKnown error while saving..");
			$("#alertError").show();
			}
	
		$("#hidDoctorIDSave").val("");
		$("#formDoctor")[0].reset();
	
}


//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidDoctorIDSave").val($(this).closest("tr").find('#hidDoctorIDUpdate').val());
	$("#doctorName").val($(this).closest("tr").find('td:eq(0)').text());
	$("#doctorAge").val($(this).closest("tr").find('td:eq(1)').text());
	$("#doctorSpe").val($(this).closest("tr").find('td:eq(2)').text());
	$("#doctorContact").val($(this).closest("tr").find('td:eq(3)').text());
	$("#doctorEmail").val($(this).closest("tr").find('td:eq(4)').text());
});

// REMOVE=========================================================
$(document).on("click", ".btnRemove", function(event)
		{
			$.ajax(
					{
						url : "DoctorAPI",
						type : "DELETE",
						data : "doctorID=" + $(this).data("doctorid"),
						dataType : "text",
						complete : function(response, status)
						{
							onDoctorDeleteComplete(response.responseText, ststus);
						}
					});
		});

function onDoctorDeleteComplete(response, status) {
	if (status == "success")
		{
			var resultSet = JSON.parse(response);
			
			if (resultSet.status.trim() == "success")
				{
				$("#alertSuccess").text("Successfully Delete.");
				$("#alertSuccess").show();
				
				$("#divDoctorGrid").html(resultSet.data);
				}else if (resultSet.status.trim() == "error")
					{
					$("#alertError").text(resultSet.data);
					$("#alertError").show();
					
					}
		}else if (status == "error")
		{
			$("#alertError").text("Error while deleting.");
			$("#alertError").show();
		}else
			{
			$("#alertError").text("UnKnown error while deleting..");
			$("#alertError").show();
			}
	
		$("#hidDoctorIDSave").val("");
		$("#formDoctor")[0].reset();
	
}



//CLIENT-MODEL================================================================
function validateDoctorForm()
{
	// Name
	if ($("#doctorName").val().trim() == "")
	{
		return "Insert doctor name.";
	}
	
	// Age
	if ($("#doctorAge").val().trim() == "")
	{
		return "Insert amount.";
	}

	
	// Specialization
	if ($("#doctorSpe").val().trim() == "")
	{
		return "Insert specialization.";
	}
	
	// Contact Number
	if ($("#doctorContact").val().trim() == "")
	{
		return "Insert valide contact number.";
	}
	
	// Email
	if ($("#doctorEmail").val().trim() == "")
	{
		return "Insert valide email.";
	}
	
	
	return true;
	}
