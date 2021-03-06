package web;

import bean.Address;
import dao.AddressDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteAddressServlet")
public class DeleteAddressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressNo = Integer.parseInt(request.getParameter("addressNo"));
        try {
            new AddressDao().deleteaddress(addressNo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
