package dao;

import bean.Book;
import bean.BookType;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DBHelper;

import java.sql.Connection;
import java.util.List;

public class BookTypeDao {
    /**
     * @selectallbooktype()查询所有图书种类
     * @addbooktype()添加图书种类
     * @updatebooktype()根据图书种类编号更改图书种类信息
     * @deletebooktype()根据图书种类编号删除图书种类
     *
     */
    public List<BookType> selectallbooktype() throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "select * from book_type";
        List<BookType> booktypes = null;
        try {
            QueryRunner runner = new QueryRunner();
            booktypes = runner.query(connection, sql, new BeanListHandler<BookType>(BookType.class));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(connection);
        }
        return booktypes;
    }

    public void addbooktype(BookType booktype) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "insert into book_type(name) values(?)";
        try {
            Object[] object = {
                    booktype.getName()
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

    public void updatebooktype(BookType booktype) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "update book_type set name = ?,createtime = ? where typeNo = ?";
        try {
            Object[] objects = {
                    booktype.getName(),booktype.getCreatetime(),booktype.getTypeNo()
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

    public void deletebooktype(BookType booktype) throws Exception{
        Connection connection = DBHelper.getConnection();
        String sql = "delete from book_type where typeNo = ?";
        try {
            Object[] objects = {
                    booktype.getTypeNo()
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
