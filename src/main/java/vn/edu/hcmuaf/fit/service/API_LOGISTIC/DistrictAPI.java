package vn.edu.hcmuaf.fit.service.API_LOGISTIC;

import com.google.gson.*;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class DistrictAPI {

    public static DistrictAPI getInstance() {
        return new DistrictAPI();
    }

    public List<District> convert(String key, int id) {
        String resData = null;
        String apiUrl = "http://140.238.54.136/api/district?provinceID=" + id;
        String accessToken = key;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);

            int resCode = connection.getResponseCode();
            if (resCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;
                StringBuilder response = new StringBuilder();

                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                in.close();
                resData = String.valueOf(response);
            } else {
                System.out.println("Error: " + resCode);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        // Convert
        List<District> districts = new ArrayList<>();

        Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        JsonObject jsonObject = parser.parse(resData).getAsJsonObject();

        if (jsonObject.has("original")) {
            JsonObject originObject = jsonObject.getAsJsonObject("original");
            if (originObject.has("data") && originObject.get("data").isJsonArray()) {
                JsonArray jsonArray = originObject.getAsJsonArray("data");
                for (JsonElement jsonElement : jsonArray) {
                    JsonObject provinceJson = jsonElement.getAsJsonObject();
                    int provinceID = provinceJson.get("ProvinceID").getAsInt();
                    int districtID = provinceJson.get("DistrictID").getAsInt();
                    String districtName = provinceJson.get("DistrictName").getAsString();
                    District district = new District(districtID, provinceID, districtName);
                    districts.add(district);
                }
            }
        }
        return districts;
    }

    public static void main(String[] args) {
        String key = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODIwODY5NDEsImV4cCI6MTY4MjA4NzU0MSwibmJmIjoxNjgyMDg2OTQxLCJqdGkiOiJhcUdxTFZ3eEs5Mk4zc2daIiwic3ViIjoiODNjNGM1MWQ2N2Q1NGM0ODg4NWE4M2JjOGViYTJkZGMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ILAQprBaiBbOBRlYjJOkxPAr7jBnWWqHtfHrxxfH8So";
        int id = 269;
        List<District> districts = DistrictAPI.getInstance().convert(key, id);
        for (District district : districts) {
            System.out.println(district.getProvinceID() + ": " + district.getId() + ": " + district.getName());
        }
    }
}
