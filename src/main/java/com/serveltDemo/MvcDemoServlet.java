package com.serveltDemo;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.Employee;
import com.util.EmployeeDataDBUtil;

@WebServlet("/MvcDemo")
public class MvcDemoServlet extends HttpServlet {

	public enum Empenum {
		LIST, ADD, LOAD, UPDATE,DELETE;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// @Resource(name="jdbc/sonu")

	// private DataSource datasource =null;
//	private Context ctx = null;
//	private Context envContext = null;

	private EmployeeDataDBUtil empdata = new EmployeeDataDBUtil();

	@Override
	public void init() throws ServletException {
		empdata = new EmployeeDataDBUtil();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String thecommand = req.getParameter("command");
			if (thecommand == null) {
				thecommand = "LIST";
			}
			System.out.println(thecommand);
			Empenum valueOf = Empenum.valueOf(thecommand);
			System.out.println(valueOf);
			switch (valueOf) {
			case LIST:
				listsEmployee(req, resp);
				break;

			case ADD:
				addEmployee(req, resp);
				break;

			case LOAD:
				loadEmployee(req, resp);
				break;

			case UPDATE:
				updateEmployee(req, resp);
				break;
				
			case DELETE:
				deleteEmployee(req, resp);
				break;
			default:
				listsEmployee(req, resp);
				break;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		String thecommand = req.getParameter("command");
		if (thecommand == null) {
			thecommand = "LIST";
		}
		System.out.println(thecommand);
		Empenum valueOf = Empenum.valueOf(thecommand);
		System.out.println(valueOf);
		switch (valueOf) {

		case ADD:
			addEmployee(req, resp);
			break;
		default:
			listsEmployee(req, resp);
			break;
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
	

private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
	String empid = req.getParameter("id");

	empdata.deleteEmploye(empid);

	listsEmployee(req, resp);
		
	}

// Update employee
	private void updateEmployee(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String empid = req.getParameter("id");
		int parseInt = Integer.parseInt(empid);
		String firstname = req.getParameter("firstName");
		String lastname = req.getParameter("lastName");
		String email = req.getParameter("email");

		Employee emp = new Employee(parseInt, firstname, lastname, email);

		empdata.updateEmploye(emp);

		listsEmployee(req, resp);
	}

	private void loadEmployee(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// read student id from data
		String empid = req.getParameter("id");
		
		// create employe object
		Employee emp = empdata.getEmployeupdate(empid);

		req.setAttribute("Emp", emp);

		RequestDispatcher dispatc = req.getRequestDispatcher("/update-employee.jsp");
		dispatc.forward(req, resp);

	}

	private void addEmployee(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// get the all parameter for add employee
		String firstname = req.getParameter("firstName");
		String lastname = req.getParameter("lastName");
		String email = req.getParameter("email");

		// create employe object
		Employee emp = new Employee(firstname, lastname, email);

		// add employee in DB
		empdata.addEmploye(emp);

		// send back data
		listsEmployee(req, resp);

	}

	private void listsEmployee(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		List<Employee> emp = empdata.getEmployes();

		req.setAttribute("Student_list", emp);

		RequestDispatcher dispatc = req.getRequestDispatcher("/list_employee.jsp");

		dispatc.forward(req, resp);

	}

}
