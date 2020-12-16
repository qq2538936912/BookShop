package dao;

import bean.Book;
import bean.User;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DBHelper;

import java.sql.Connection;
import java.util.List;

public class BookDao {
    /**
     * @selectallbookproduct()查询所有图书商品
     * @addbookproduct()添加一本图书
     * @updatebookinfo()根据图书编号更改图书信息
     * @deletebook()根据图书编号删除图书
     *
     */
    public List<Book> selectallbookproduct() throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "select * from book_product";
        List<Book> books = null;
        try {
            QueryRunner runner = new QueryRunner();
            books = runner.query(connection, sql, new BeanListHandler<Book>(Book.class));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(connection);
        }
        return books;
    }

    public void addbookproduct(Book book) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "insert into book_product(typeNo,bookName,author,price,buyCount,stock,cover,content) values(?,?,?,?,?,?,?,?)";
        try {
            Object[] object = {
                    book.getTypeNo(),book.getBookName(),book.getAuthor(),book.getPrice(),book.getBuyCount(),book.getStock(),book.getCover(),book.getContent()
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

    public void updatebookinfo(Book book) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "update book_product set typeNo = ?,bookName = ?,author = ?,price = ?,buyCount = ?,stock = ?,cover = ?,content = ?,createtime = ? where productNo = ?";
        try {
            Object[] objects = {
                    book.getTypeNo(),book.getBookName(),book.getAuthor(),book.getPrice(),book.getBuyCount(),book.getStock(),book.getCover(),book.getContent(),book.getProductNo()
            };
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(connection,sql,objects);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(connection);
        }
    }

    public void deletebook(Book book) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "delete from book_product where productNo = ?";
        try {
            Object[] objects = {
                    book.getProductNo()
            };
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(connection,sql,objects);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(connection);
        }
    }
}
