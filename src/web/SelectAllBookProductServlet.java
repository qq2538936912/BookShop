package web;

import bean.Book;
import bean.User;
import com.google.gson.Gson;
import dao.BookDao;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/SelectAllBookProductServlet")
public class SelectAllBookProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            BookDao bookdao = new BookDao();
            List<Book> books = bookdao.selectallbookproduct();
            System.out.println(books);
            PrintWriter writer = response.getWriter();
            writer.println(new Gson().toJson(books));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
