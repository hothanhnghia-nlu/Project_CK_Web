package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.bean.Image;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class ImagesService {

    public static ImagesService getInstance() {
        return new ImagesService();
    }

    public List<Product> getImgForProducts (List<Product> list){
        List<Image> images = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("\tSELECT `imageID`, `product_id`,`name`,`url`,`status` \n" +
                            "\tFROM images WHERE images.`status`=0 ")
                    .mapToBean(Image.class)
                    .stream().collect(Collectors.toList());
        });
        ArrayList a= new ArrayList<String>();

        for (Product p: list) {
            for (Image i: images) {
                if(p.getProductID().equals(i.getProduct_id())) {
                    a.add(i.getUrl());
                }
            }
            p.setImage(a.stream().toList());
            a.clear();
        }
       return list;
    }


    public static void main(String[] args) {
        ImagesService a = new ImagesService();
    }


}

