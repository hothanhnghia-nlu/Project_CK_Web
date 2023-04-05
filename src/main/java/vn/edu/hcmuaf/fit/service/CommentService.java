package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Comment;
import vn.edu.hcmuaf.fit.bean.Contact;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

import java.util.stream.Collectors;

public class CommentService {
    public static CommentService getInstance() {
        return new CommentService();
    }

    // Add new comment
    public void addCmt(int id, String name, String email, String productName, String content, int rating) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO comments VALUES (?, ?, ?, ?, ?, ?, NOW())")
                        .bind(0, id)
                        .bind(1, name)
                        .bind(2, email)
                        .bind(3, productName)
                        .bind(4, content)
                        .bind(5, rating)
                        .execute()
        );
    }

    // Get a new id
    public int getNewID() {
        List<Comment> comments = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM comments order by cmtID DESC Limit 1")
                        .mapToBean(Comment.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < comments.size(); i++) {
            return comments.get(i).getCmtID();
        }
        return 0;
    }

    // Get all comment list
    public List<Comment> listAllComment(){
        List<Comment> com = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM comments")
                    .mapToBean(Comment.class)
                    .stream().collect(Collectors.toList());
        });
        return com;
    }

    // Delete a comment
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
