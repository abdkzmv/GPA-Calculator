package main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "initialize", value = "/initialize")
public class initialize extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int numOfCourses = Integer.valueOf(request.getParameter("numOfCourses"));
        request.getSession().setAttribute("numOfCourses",numOfCourses);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
