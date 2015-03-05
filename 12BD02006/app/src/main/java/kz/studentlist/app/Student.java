package kz.studentlist.app;

import com.j256.ormlite.field.DatabaseField;

/**
 * Created by apple on 23.02.15.
 */
public class Student {

    @DatabaseField(generatedId = true)
    int id;

    @DatabaseField
    String name;

    @DatabaseField
    String surname;

    @DatabaseField
    String studentId;


    public Student(){

    }

    public Student(String name, String surname, String studentId) {
        super();
        this.name = name;
        this.surname = surname;
        this.studentId = studentId;
    }


}
