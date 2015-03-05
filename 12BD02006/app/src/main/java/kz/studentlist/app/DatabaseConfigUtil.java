package kz.studentlist.app;

import com.j256.ormlite.android.apptools.OrmLiteConfigUtil;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by apple on 23.02.15.
 */
public class DatabaseConfigUtil extends OrmLiteConfigUtil{

    private static final Class<?>[] classes =  new Class[]{Student.class};

    public static void main(String[] args) throws IOException, SQLException {
        writeConfigFile("ormlite_config.txt", classes);
    }

}
