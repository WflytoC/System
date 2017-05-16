package servlet;

import handler.connect.ConnectModules;
import handler.content.ContentsHandler;
import handler.structure.StructureHandler;
import handler.url.URLHandler;
import result.ContentResult;
import result.StructureResult;
import result.URLResult;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by wcshi on 2017/5/15.
 */
public class RecognitionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = (String) request.getParameter("input_url");
        ContentResult contentResult = null;
        URLResult urlResult = null;
        StructureResult structureResult = null;
        try {
            contentResult = ContentsHandler.getContentTrait(url);
            urlResult = URLHandler.getURLTrait(url);
            structureResult = StructureHandler.getStructureTrait(url);
        } catch (Exception e) {
            System.out.println(e);
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request,response);
        }
        request.setAttribute("contentResult",contentResult);
        request.setAttribute("urlResult",urlResult);
        request.setAttribute("structureResult",structureResult);
        boolean isNewsPage = ConnectModules.judgeIsNewsPage(urlResult,contentResult,structureResult);
        request.setAttribute("isNewsPage",isNewsPage);
        request.setAttribute("handledUrl",url);
        request.getRequestDispatcher("/WEB-INF/jsp/handler.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request,response);
    }
}
