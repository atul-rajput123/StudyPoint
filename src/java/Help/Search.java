package Help;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {
    
    private final String API_KEY = "AIzaSyAetzGU4gTdB6z_SwsixNwcjohcr325UfM";
    private final String CX = "170fc685245ff4b2e";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String query = request.getParameter("query");
        if (query == null || query.isEmpty()) {
            out.println("<html><body><h3>Please enter a search query.</h3></body></html>");
            return;
        }

        String encodedQuery = URLEncoder.encode(query, StandardCharsets.UTF_8.toString());
        String urlString = "https://www.googleapis.com/customsearch/v1?q=" + encodedQuery +
                           "&key=" + API_KEY + "&cx=" + CX;

        try {
            // Connect to Google Custom Search API
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            
            // Read the API response
            StringBuilder content = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                String inputLine;
                while ((inputLine = br.readLine()) != null) {
                    content.append(inputLine);
                }
            }
            
            // Parse JSON response
            JSONObject jsonResponse = new JSONObject(content.toString());
            JSONArray items = jsonResponse.getJSONArray("items");

                
            // Generate HTML with search results
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Search Results</title>");
            out.println("<link rel=\"stylesheet\" href=\"HomeCss.css\">");
            out.println("<style>");
            out.println("body");
            out.println("{");
            out.println(" background-image: url('Back.png')");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            
            // Navbar Section
            out.println("<div class=\"navbar\">");
            out.println("  <div class=\"logo-container\">");
            out.println("    <img src=\"logo.jpg\" alt=\"Logo\">");
           // out.println("  </div>");
            out.println("  <div class=\"navbar-links\">");
            out.println("    <a href=\"HomePage.jsp\">Home</a>");
            out.println("    <a href=\"Help.jsp\">Contact</a>");
            out.println("  </div>");
            out.println("  </div>");
            out.println("</div>");
            
            // Search Results Section
            out.println("<h2>Search Results for: " + query + "</h2>");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String title = item.getString("title");
                String link = item.getString("link");
                String snippet = item.getString("snippet");

                out.println("<div style=\"margin-bottom: 15px;\">");
                out.println("  <h3><a style=\"color:red;\" href='" + link + "' target='_blank'>" + title + "</a></h3>");
                out.println("  <p>" + snippet + "</p>");
                out.println("</div>");
                out.println("<hr>");
            }
            
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            // Error handling
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.println("<html><body><h3>An error occurred while fetching results. Please try again later. Net probleam</h3></body></html>");
            e.printStackTrace(out);
        }
    }
}
