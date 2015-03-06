package com.example.ela_lab3;

import java.sql.SQLException;
import java.util.List;

import android.content.Context;

public class DBManager {
	static private DBManager instance;
	static public void init(Context ctx) {
		if (null==instance) {
			instance = new DBManager(ctx);
		}
	}
	static public DBManager getInstance(Context ctx) {
		init(ctx);
		return instance;
	} 
	private DBHelper helper;
	private DBManager(Context ctx) {
		helper = new DBHelper(ctx);
	} 
	private DBHelper getHelper() {
		return helper;
	}
	public List<Student> getStudents(){
		List<Student> students = null;
		try {
			students = getHelper().getStudentDao().queryForAll();
		} catch (java.sql.SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return students;
	}
	public void addStudent(Student s){
		try {
			getHelper().getStudentDao().create(s);
		} catch (java.sql.SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteStudent(Student s) {
		try {
			getHelper().getStudentDao().delete(s);
		} catch (java.sql.SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateStudent(Student s){
		try {
			getHelper().getStudentDao().update(s);
		} catch (java.sql.SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteAllStudents(List<Student> students){
		try {
			getHelper().getStudentDao().delete(students);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
