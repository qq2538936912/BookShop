package dao;

import bean.Profile;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DBHelper;

import java.sql.Connection;
import java.util.List;

public class ProfileDao {
    /**
     * @selectallprofile()查询所有会员
     * @addprofile()添加会员
     *
     *
     *
     */
    public List<Profile> selectallprofile() throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "select * from book_profile";
        List<Profile> profiles = null;
        try {
            QueryRunner runner = new QueryRunner();
            profiles = runner.query(connection, sql, new BeanListHandler<Profile>(Profile.class));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(connection);
        }
        return profiles;
    }

    public void addprofile(Profile profile) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "insert into book_profile(userNo,phone,name,sex,birthday,grade) values(?,?,?)";
        try {
            Object[] object = {
                    profile.getUserNo(),profile.getPhone(),profile.getName(),profile.getSex(),profile.getBirthday(),profile.getGrade()
            };
            QueryRunner runner = new QueryRunner();
            runner.update(connection,sql,object);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(connection);
        }
    }
}
