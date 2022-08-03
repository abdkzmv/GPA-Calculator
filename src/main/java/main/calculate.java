package main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "calculate", value = "/calculate")
public class calculate extends HttpServlet {
    private double f(String grade) {
        if(Character.isAlphabetic(grade.charAt(0))) {
            switch (grade) {
                case "D":
                    return 1;
                case "D+":
                    return 1.33;
                case "C-":
                    return 1.67;
                case "C":
                    return 2;
                case "C+":
                    return 2.33;
                case "B-":
                    return 2.67;
                case "B":
                    return 3;
                case "B+":
                    return 3.33;
                case "A-":
                    return 3.67;
                default:
                    return 4;
            }
        }
        else {
            double val = Double.valueOf(grade);
            if(val>=93.5)
                return 4;
            if(val>=89.5)
                return 3.67;
            if(val>=86.5)
                return 3.33;
            if(val>=82.5)
                return 3;
            if(val>=79.5)
                return 2.67;
            if(val>=76.5)
                return 2.33;
            if(val>=72.5)
                return 2;
            if(val>=68.5)
                return 1.67;
            if(val>=66.5)
                return 1.33;
            if(val>=60)
                return 1;
            return 0;
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("available",Boolean.valueOf(true));
        int numOfCourses = (int) request.getSession().getAttribute("numOfCourses");
        double credit = 0;
        double totalCredit = 0;
        double grade = 0;
        double totalPoint = 0;
        double result = 0;
        String name;
        for(int i=1;i<=numOfCourses;i++) {
            name = request.getParameter("name "+i);
            credit = Double.valueOf(request.getParameter("credit "+i));
            totalCredit += credit;
            grade = f(String.valueOf(request.getParameter("grade "+i)));
            totalPoint += grade * credit;
            request.getSession().setAttribute("name "+i, name);
            request.getSession().setAttribute("credit "+i, request.getParameter("credit "+i));
            request.getSession().setAttribute("grade "+i, request.getParameter("grade "+i));
        }
        result = totalPoint / totalCredit;
        request.getSession().setAttribute("result",Double.valueOf(result));
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
