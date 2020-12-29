package text;

import bean.Commodity;
import bean.User;
import dao.CommodityDao;
import dao.UserDao;

import java.util.List;

public class Usertext {
    public static void main(String[] args) {
        CommodityDao commodityDao = new CommodityDao();
        try {
            List<Commodity> commodities = commodityDao.selectbybooknamebookcommoditie("学","学");
            System.out.println(commodities);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
