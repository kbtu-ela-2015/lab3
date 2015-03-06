package com.example.ela_lab3;

import java.sql.SQLException;
import java.util.List;

import com.j256.ormlite.android.apptools.OrmLiteSqliteOpenHelper;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.RuntimeExceptionDao;
import com.j256.ormlite.support.ConnectionSource;
import com.j256.ormlite.table.TableUtils;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

public class DBHelper extends OrmLiteSqliteOpenHelper{
	private Context ctx;
	private static final String DB_NAME = "lab.db";
	private static final int DB_VERSION = 1;
	private Dao<Student, String> studentDao = null;
	public DBHelper(Context context) {
		super(context, DB_NAME, null, DB_VERSION);
		this.ctx = context;
	}
 
	public Dao<Student, String> getStudentDao() {
		if (null == studentDao) {
			try {
				studentDao = getDao(Student.class);
			}catch (java.sql.SQLException e) {
				e.printStackTrace();
			}
		}
		return studentDao;
	}
	@Override
	public void onCreate(SQLiteDatabase db, ConnectionSource connSource) {
		// TODO Auto-generated method stub
		try {
			Log.i(DBHelper.class.getName(), "onCreate");
			TableUtils.createTable(connectionSource, Student.class);
		} catch (SQLException e) {
			Log.e(DBHelper.class.getName(), "Can't create database", e);
			throw new RuntimeException(e);
		}
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, ConnectionSource connSource, int oldVersion,
			int newVersion) {
		// TODO Auto-generated method stub
		try {
			Log.i(DBHelper.class.getName(), "onUpgrade");
			TableUtils.dropTable(connectionSource, Student.class, true);
			onCreate(db, connectionSource);
		} catch (SQLException e) {
			Log.e(DBHelper.class.getName(), "Can't drop databases", e);
			throw new RuntimeException(e);
		}
	}
}
