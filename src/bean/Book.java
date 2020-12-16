package bean;

import java.util.Date;

public class Book {
    private int productNo;  //图书id
    private int typeNo;     //图书分类id
    private String bookName;//图书名称
    private String author;  //作者
    private double price;   //销售价格
    private int buyCount;   //销售数量
    private int stock;      //库存
    private String cover;   //封面图
    private String content; //图书简介
    private Date createtime;//创建时间

    public int getProductNo() {
        return productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    public int getTypeNo() {
        return typeNo;
    }

    public void setTypeNo(int typeNo) {
        this.typeNo = typeNo;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double money) {
        this.price = money;
    }

    public int getBuyCount() {
        return buyCount;
    }

    public void setBuyCount(int buyCount) {
        this.buyCount = buyCount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public  Book(){}

    public Book(int typeNo, String bookName, String author, double price, int buyCount, int stock, String cover, String content) {
        this.typeNo = typeNo;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.buyCount = buyCount;
        this.stock = stock;
        this.cover = cover;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Book{" +
                "productNo=" + productNo +
                ", typeNo=" + typeNo +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", money=" + price +
                ", buyCount=" + buyCount +
                ", stock=" + stock +
                ", cover='" + cover + '\'' +
                ", content='" + content + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
