package web;

import bean.User;
import dao.AddressDao;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userno = Integer.parseInt(request.getParameter("userno"));
        String username = request.getParameter("username");
        String userpass = request.getParameter("userpass");
        String phone = request.getParameter("phone");
        try {
            new UserDao().updateuser(new User(userno,username,userpass,phone));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
