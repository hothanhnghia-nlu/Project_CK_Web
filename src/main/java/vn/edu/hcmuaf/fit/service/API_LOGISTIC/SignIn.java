package vn.edu.hcmuaf.fit.service.API_LOGISTIC;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.io.IOException;

public class SignIn {

    public static SignIn getInstance() {
        return new SignIn();
    }

    public String signIn() throws IOException {
        String email = "nghia@1234";
        String password = "123456";

        // Create a sign-in request to API
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost("http://140.238.54.136/api/auth/login");
        post.setHeader("Content-type", "application/json");
        JSONObject json = new JSONObject();
        json.put("email", email);
        json.put("password", password);
        StringEntity entity = new StringEntity(json.toString());
        post.setEntity(entity);

        // Send request and receive response from API
        HttpResponse response = client.execute(post);
        HttpEntity resEntity = response.getEntity();
        String resString = EntityUtils.toString(resEntity);
        JSONObject resJson = new JSONObject(resString);

        // Save access token in sign-in session
        String accessToken = resJson.getString("access_token");
        return accessToken;
    }

    public static void main(String[] args) throws IOException {
        String accessToken = getInstance().signIn();
        System.out.println(accessToken);
    }
}
