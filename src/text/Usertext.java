package text;

import bean.User;
import dao.UserDao;

public class Usertext {
    public static void main(String[] args) {
        UserDao userdao = new UserDao();
        try {
            //userdao.adduser(new User("ben","123","123456"));
            userdao.updateuserpass(new User("4560","120"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
