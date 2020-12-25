package web;

import bean.Commodity;
import dao.CommodityDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SelectByProductNoCommoditieServlet")
public class SelectByProductNoCommoditieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productNo = Integer.parseInt(request.getParameter("productNo"));
        try {
            new CommodityDao().selectbyproductNocommoditie(new Commodity(productNo));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
