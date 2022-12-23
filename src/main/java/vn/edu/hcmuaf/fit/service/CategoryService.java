package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CategoryService {

    public static CategoryService getInstance() {
        return new CategoryService();
    }

    public List<Category> listAllCategory (){
        List<Category> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM category")
                    .mapToBean(Category.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }
}
