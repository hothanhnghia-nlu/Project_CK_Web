package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Feedback;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

import java.util.stream.Collectors;

public class CommentService {
    public static CommentService getInstance() {
        return new CommentService();
    }
    public List<Feedback> listAllComment(){
        List<Feedback> com = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM feedback")
                    .mapToBean(Feedback.class)
                    .stream().collect(Collectors.toList());
        });
        return com;
    }
    public void deleteFeedback(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM feedback WHERE feedbackID = ?")
                        .bind(0, Id)
                        .execute()
        );
    }
    public static void main(String[] args) {
        System.out.println(CommentService.getInstance().listAllComment());
    }
}
