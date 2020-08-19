package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDataDBUtil {
	static Connection mycon = null;
	Statement mystmt = null;
	ResultSet myset = null;
	PreparedStatement prepareStatement=null;
	public static Connection getconnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/sonu", "root", "root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mycon;
	}
	
	public List<Employee> getEmployes(){
	
		List<Employee> list=new ArrayList<Employee>();
		try {
			//get connection
			mycon=EmployeeDataDBUtil.getconnection();
			// create sql
			String sql = "select * from Employee_jdbc";
			mystmt = mycon.createStatement();
			// Step 4: excute query
			myset = mystmt.executeQuery(sql);
			// step 5: process result set
			while (myset.next()) {
				int id=myset.getInt("id");
				String fname = myset.getString("firstname");
				String lname = myset.getString("lastname");
				String email = myset.getString("email");

				Employee emp = new Employee(id,fname, lname, email);
				list.add(emp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(mycon,myset,mystmt);
		}
		return list;
	
	
	}
	
	public void addEmploye(Employee emp) throws Exception {
		try {
			//get connection
			
		mycon=EmployeeDataDBUtil.getconnection();
		// insert the sql
		String sql = "insert into employee_jdbc"
				+"(FirstName, LastName, Email)"
				+"values(?, ?, ?)";
		// set the param values to insert
		 prepareStatement = mycon.prepareStatement(sql);
		 
		 prepareStatement.setString(1, emp.getFirstName());
		 prepareStatement.setString(2, emp.getLastName());
		 prepareStatement.setString(3, emp.getEmail());
		 
		 // execute the query
		 prepareStatement.execute();
		 // close con
		
		} finally {
			close(mycon,null,mystmt);
		}
	}
	

	private void close(Connection mycon, ResultSet myset, Statement mystmt) {
		if(myset!=null) {
			try {
				myset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(mycon!=null) {
			try {
				mycon.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(mystmt!=null) {
			try {
				mystmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	public Employee getEmployeupdate(String empid) throws Exception {
		Employee emp1 = null;
		PreparedStatement prepareStatement2 =null;
		int empId;
		try {
			empId = Integer.parseInt(empid);

			mycon = EmployeeDataDBUtil.getconnection();

			String sql = "select * from employee_jdbc where id=?";

			prepareStatement2 = mycon.prepareStatement(sql);

			prepareStatement2.setInt(1, empId);

			ResultSet executeQuery = prepareStatement2.executeQuery();
			// reterive data dfrom result set
			if (executeQuery.next()) {
				String firstName = executeQuery.getString("FirstName");
				String lastName = executeQuery.getString("LastName");
				String email = executeQuery.getString("Email");

			emp1 = new Employee(empId, firstName, lastName, email);
			} else {
				throw new Exception("coould not find empid" + empId);
			}

			return emp1;
		} finally {
				close(mycon, myset, prepareStatement2);
		}
	}

	public void updateEmploye(Employee emp) throws Exception {
		
		PreparedStatement prepareStatement2 =null;
		try {

			mycon = EmployeeDataDBUtil.getconnection();

			String sql = "update employee_jdbc "
					+ "set firstName=?, lastName=?, email=? "
					+ "where id=?";

			prepareStatement2 = mycon.prepareStatement(sql);
			
			prepareStatement2.setString(1, emp.getFirstName());
			prepareStatement2.setString(2, emp.getLastName());
			prepareStatement2.setString(3, emp.getEmail());
			prepareStatement2.setInt(4, emp.getId());
			
			
			prepareStatement2.execute();
			// reterive data dfrom result set
			
		} finally {
				close(mycon, myset, prepareStatement2);
		}
	}

	public void deleteEmploye(String empId) throws Exception {
		PreparedStatement prepareStatement2 =null;
		try {
			// parse the id
			int id=Integer.parseInt(empId);
			// get connection
			mycon = EmployeeDataDBUtil.getconnection();
			// get the sql query
			String sql = "delete from employee_jdbc where id=?";
			//create prep statment
			prepareStatement2 = mycon.prepareStatement(sql);
			// set param
			prepareStatement2.setInt(1, id);
			// excute
			prepareStatement2.execute();
			
		} finally {
				close(mycon, myset, prepareStatement2);
		}
		
	}
	public static boolean validate(String name,String pass){
		boolean status=false;
		PreparedStatement prepareStatement2 =null;
		try {
			// get connection
			mycon = EmployeeDataDBUtil.getconnection();
			// get the sql query
			String sql = "select * from employee_jdbc where FirstName=? and pass=?";
			//create prep statment
			prepareStatement2 = mycon.prepareStatement(sql);
			// set param
			prepareStatement2.setString(1,name);  
			prepareStatement2.setString(2,pass);  
			// excute
			ResultSet set=prepareStatement2.executeQuery();
			status=set.next();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return status;  
		
	}


}
