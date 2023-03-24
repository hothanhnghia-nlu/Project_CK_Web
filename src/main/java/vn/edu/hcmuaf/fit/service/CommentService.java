package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Comment;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

import java.util.stream.Collectors;

public class CommentService {
    public static CommentService getInstance() {
        return new CommentService();
    }
    public List<Comment> listAllComment(){
        List<Comment> com = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM comments")
                    .mapToBean(Comment.class)
                    .stream().collect(Collectors.toList());
        });
        return com;
    }
    public void deleteComment(String Id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM comments WHERE cmtID = ?")
                        .bind(0, Id)
                        .execute()
        );
    }
    public static void main(String[] args) {
        System.out.println(CommentService.getInstance().listAllComment());
    }
}
