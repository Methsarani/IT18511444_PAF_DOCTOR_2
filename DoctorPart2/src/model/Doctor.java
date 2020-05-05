package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Doctor {
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/doctor2", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public String readDoctor()
	{
		String output = "";
		
		try
		{
			Connection con = connect();
			if (con == null)
			{
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><th>Doctor Name</th><th>Age</th><th>Specialization</th><th>Contact Number</th><th>Email</th><th>Update</th><th>Remove</th></tr>";
			
			String query = "select * from doctor2";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
	 
			// iterate through the rows in the result set
			while (rs.next())
			{
				String doctorID = Integer.toString(rs.getInt("doctorID"));
				String doctorName = rs.getString("doctorName");
				String doctorAge = Integer.toString(rs.getInt("doctorAge"));
				String doctorSpe = rs.getString("doctorSpe");		
				String doctorContact = rs.getString("doctorContact"); 
				String doctorEmail = rs.getString("doctorEmail"); 
	
				// Add into the html table
				output += "<tr><td><input id='hidDoctorIDUpdate'name='hidDoctorIDUpdate' type='hidden'value='" + doctorID + "'>" + doctorName + "</td>";
				output += "<td>" + doctorAge + "</td>";
				output += "<td>" + doctorSpe + "</td>";
				output += "<td>" + doctorContact + "</td>";
				output += "<td>" + doctorEmail + "</td>";
	
				// buttons
				output += "<td><input name='btnUpdate' type='button'value='Update' class='btnUpdate btn btn-secondary'></td><td><input name='btnRemove' type='button'value='Remove'class='btnRemove btn btn-danger' data-doctorid='"
						+ doctorID + "'></td></tr>";
			}
	 
			con.close();
	 
			// Complete the html table
	 
			output += "</table>";
	 }
	catch (Exception e)
	 {
	 output = "Error while reading the doctor details.";
	 System.err.println(e.getMessage());
	 }
	return output;
	}
	
	public String insertDoctor(String name, String age, String spe, String contact, String email) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = " insert into doctor2(doctorID, doctorName, doctorAge, doctorSpe, doctorContact, doctorEmail)"
					+ " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, name);
			preparedStmt.setInt(3, Integer.parseInt(age));
			preparedStmt.setString(4, spe);	
			preparedStmt.setString(5, contact);
			preparedStmt.setString(6, email);
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			//output = "Inserted successfully";
			
			String newDoctor = readDoctor();
			 output = "{\"status\":\"success\", \"data\": \"" +
					 newDoctor + "\"}"; 
			 
			 
		} catch (Exception e) {
		//	output = "Error while inserting the doctor details.";
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the Doctor details.\"}"; 
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	public String updateDoctor(String id, String name, String age, String spe, String contact, String email) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			
			//(doctorID, doctorName, doctorAge, doctorSpe, doctorContact, doctorEmail)"
			
			// create a prepared statement
			String query = "UPDATE doctor2 SET doctorName=?,doctorAge=?,doctorSpe=?,doctorContact=?,doctorEmail=? WHERE doctorID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, name);
			preparedStmt.setInt(2, Integer.parseInt(age));
			preparedStmt.setString(3, spe);
			preparedStmt.setString(4, contact);
			preparedStmt.setString(5, email);
			preparedStmt.setInt(6, Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();
			//output = "Updated successfully";
			String newDoctor = readDoctor();
			 output = "{\"status\":\"success\", \"data\": \"" +
			 newDoctor + "\"}"; 
		} catch (Exception e) {
			//output = "Error while updating the doctor details.";
			output = "{\"status\":\"error\", \"data\": \"Error while updating the doctor details.\"}"; 
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deleteDoctor(String id) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from doctor2 where doctorID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();
			//output = "Deleted successfully";
			String newDoctor = readDoctor();
			 output = "{\"status\":\"success\", \"data\": \"" +
					 newDoctor + "\"}"; 
		} catch (Exception e) {
			//output = "Error while deleting the doctor details.";
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the doctor details.\"}"; 
			System.err.println(e.getMessage());
		}
		return output;
	}
}

