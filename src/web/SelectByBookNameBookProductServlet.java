package web;

import bean.Commodity;
import com.google.gson.Gson;
import dao.CommodityDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/SelectByBookNameBookProductServlet")
public class SelectByBookNameBookProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookName = request.getParameter("bookName");
        List<Commodity> commodities = null;
        try {
            CommodityDao commodityDao = new CommodityDao();
            commodities = commodityDao.selectbybooknamebookcommoditie(bookName);
            PrintWriter writer = response.getWriter();
            writer.println(new Gson().toJson(commodities));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
