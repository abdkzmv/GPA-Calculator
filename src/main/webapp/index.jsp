<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GPA Calculator</title>
    <link rel="stylesheet" href="frontend/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <br>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <h1>Calculate your GPA</h1>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <%
                    HttpSession s = request.getSession();
                    if(s.getAttribute("numOfCourses") == null) {
                %>
                <form action="initialize" method="post">
                    <table>
                        <tr>
                            <td>
                                <input type="number" placeholder="Number of Courses" name="numOfCourses">
                            </td>
                            <td>
                                <input type="submit" value="Enter">
                            </td>
                        </tr>
                    </table>
                </form>
                <%
                    } else {
                %>
                    <form action="calculate" method="post">
                        <table>
                            <thead>
                            <th>
                                Name (optional)
                            </th>
                            <th>
                                Grade
                            </th>
                            <th>
                                Credit
                            </th>
                            </thead>
                            <tbody>
                            <%
                                int numOfCourses = (int) request.getSession().getAttribute("numOfCourses");
                                for(int i=1;i<=numOfCourses;i++) {
                            %>
                            <tr>
                                <td>
                                    <%
                                        if(request.getSession().getAttribute("available")==null) {
                                    %>
                                    <input name="name <%=i%>" type="text" placeholder="Course <%=i%>">
                                    <%
                                        } else {
                                    %>
                                    <input name="name <%=i%>" value="<%=request.getSession().getAttribute("name "+i)%>" type="text" placeholder="Course <%=i%>">
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if(request.getSession().getAttribute("available")==null) {
                                    %>
                                    <input name="grade <%=i%>" type="text" placeholder="Grade <%=i%>">
                                    <%
                                    } else {
                                    %>
                                    <input name="grade <%=i%>" value="<%=request.getSession().getAttribute("grade "+i)%>" type="text" placeholder="Grade <%=i%>">
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if(request.getSession().getAttribute("available")==null) {
                                    %>
                                    <input name="credit <%=i%>" type="number" placeholder="Credit <%=i%>">
                                    <%
                                    } else {
                                    %>
                                    <input name="credit <%=i%>" value="<%=request.getSession().getAttribute("credit "+i)%>" type="number" placeholder="Credit <%=i%>">
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>

                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>
                                    <%
                                        if(request.getSession().getAttribute("result") != null) {
                                    %>
                                    <p>
                                        <%
                                            double result = (double) request.getSession().getAttribute("result");
                                        %>
                                        <%=String.format("Your GPA is %.2f",result)%>
                                    </p>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>

                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <td>

                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <a href="#"><input type="submit" value="Calculate"></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>

                            </td>
                            </tfoot>
                        </table>
                    </form>
                <%
                    }
                %>
                <%
                    if(request.getSession().getAttribute("numOfCourses") != null) {
                %>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <form action="restart" method="post">
                                <input type="submit" value="Restart">
                            </form>
                        </td>
                    </tr>
                </table>
                    <%
                        }
                    %>
                <br>
                <hr>
                <br>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <h4>&copy; <a href="https://www.github.com/akazimov" target="_blank">Abdullah Kazimov</a></h4>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>