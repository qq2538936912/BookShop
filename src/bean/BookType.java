package bean;

import java.util.Date;

public class BookType {
    private int typeNo;     //ID
    private String name;    //类型名称
    private Date createtime;//注册时间

    public int getTypeNo() {
        return typeNo;
    }

    public void setTypeNo(int typeNo) {
        this.typeNo = typeNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public BookType() {}

    public BookType(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "BookType{" +
                "typeNo=" + typeNo +
                ", name='" + name + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
