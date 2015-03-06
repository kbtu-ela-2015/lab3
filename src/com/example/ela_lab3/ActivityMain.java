package com.example.ela_lab3;

import java.util.List;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

public class ActivityMain extends Activity implements OnClickListener{
	private ListView lvMain;
	private AdapterStudents adapter;
	private List<Student> students;
	private Button btnAdd;
	private Button btnDelete;
	private DBManager manager;
	private AlertDialog alert;
	private AlertDialog.Builder builder;
	@Override
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		lvMain = (ListView)findViewById(R.id.lvMain);
		btnAdd = (Button)findViewById(R.id.btnAddStudent);
		btnDelete = (Button)findViewById(R.id.btnDeleteStudents);
		btnAdd.setOnClickListener(this);
		btnDelete.setOnClickListener(this);
		
		manager = DBManager.getInstance(this);
		
		students = manager.getStudents();
		Log.i("STUDENTS","SIZE:"+students.size());
		adapter = new AdapterStudents(this,students);
		lvMain.setAdapter(adapter);
	}
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		switch(v.getId()){
		case R.id.btnAddStudent:
			builder = new AlertDialog.Builder(this);
			
			LayoutInflater inflater = LayoutInflater.from(this);
			final View inflatedLayout= inflater.inflate(R.layout.dialog_student, null, false);
			inflatedLayout.setBackgroundColor(0xff28bd2a);
			builder.setView(inflatedLayout);
			builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					// TODO Auto-generated method stub		
					Student tempStudent = new Student();
					tempStudent.setsFirstName(((EditText)inflatedLayout.findViewById(R.id.etFirstName)).getText().toString());
					tempStudent.setsLastName(((EditText)inflatedLayout.findViewById(R.id.etLastName)).getText().toString());
					tempStudent.setsFaculty(((EditText)inflatedLayout.findViewById(R.id.etFaculty)).getText().toString());
					manager.addStudent(tempStudent);
					students.add(tempStudent);
					adapter.notifyDataSetChanged();
				}
			});
			builder.setNegativeButton("Cancel",new DialogInterface.OnClickListener() {
				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					// TODO Auto-generated method stub
					alert.dismiss();
				}
			});
			alert= builder.create();
			alert.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);
			alert.show();
			break;
		case R.id.btnDeleteStudents:
			builder = new AlertDialog.Builder(this);
			inflater = LayoutInflater.from(this);
			View inflatedLayout2= inflater.inflate(R.layout.dialog_delete, null, false);
			builder.setView(inflatedLayout2);
			builder.setPositiveButton("OK",new DialogInterface.OnClickListener(){
				@Override
				public void onClick(DialogInterface v, int arg1) {
					// TODO Auto-generated method stub
					manager.deleteAllStudents(students);
					students.clear();
					adapter.notifyDataSetChanged();
					alert.dismiss();
				}				
			});
			builder.setNegativeButton("Cancel",new DialogInterface.OnClickListener(){
				@Override
				public void onClick(DialogInterface v, int arg1) {
					// TODO Auto-generated method stub
					alert.dismiss();
				}				
			});
			alert = builder.create();
			alert.show();
			
			break;
		}
		
	}
}
