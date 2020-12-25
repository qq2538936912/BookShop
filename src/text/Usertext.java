package text;

import bean.User;
import dao.UserDao;

import java.util.List;

public class Usertext {
    public static void main(String[] args) {
        UserDao userdao = new UserDao();
        try {
            //userdao.adduser(new User("ben","123","123456"));
            //userdao.updateuserpass(new User("4560","120"));
            User user = userdao.selectbyphoneuser("110");
            System.out.println(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
