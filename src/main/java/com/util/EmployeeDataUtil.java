package com.util;

import java.util.ArrayList;
import java.util.List;

public class EmployeeDataUtil {
	
	public static List<Employee> getStudents(){
		
		//create empty Emplyee list
		
		List<Employee> employees=new ArrayList<Employee>();
		
		//add employe data
		employees.add(new Employee("dee", "upad", "deep@gg.com"));
		employees.add(new Employee("dee", "upad", "deep@gg.com"));
		employees.add(new Employee("dee", "upad", "deep@gg.com"));
		employees.add(new Employee("dee", "upad", "deep@gg.com"));
		
		// return
		return employees;
		
	}

}
