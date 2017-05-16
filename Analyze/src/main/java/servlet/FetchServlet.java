package servlet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wcshi on 2017/5/15.
 */

public class FetchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("handledUrl");
        String rule = request.getParameter("fetch_rule");
        Document doc = Jsoup.connect(url).userAgent("Mozilla").get();
        String title = doc.select("title").first().text();
        Elements elements = doc.select(rule);
        String html = "";
        for (Element element: elements) {
            html += element.text();
        }
        request.setAttribute("news_title",title);
        request.setAttribute("news_content",html);
        request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request,response);
    }

}
