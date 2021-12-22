<%@ page import="model.Results" %>
<%@ page import="model.Point" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="Web-programming, lab2" name="description">
    <meta content="Bachurinskiy Artem Andreevich" name="author">
    <title>Web-programming, lab2</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        Bachurinskiy Artem Andreevich, P3210, var 10888
    </header>

    <br>

    <div id="result">
        <%
            Results results = (Results) application.getAttribute("results"); // javax.servlet.ServletContext application
            Point point = results.getLastPushed();
        %>
        <table class="result_table">
            <thead>
                <tr>
                    <th class="variable">X</th>
                    <th class="variable">Y</th>
                    <th class="variable">R</th>
                    <th>Result</th>
                </tr>
            <thead>
            <tbody>
                <tr>
                    <td><%= point.getString(point.getX()) %></td>
                    <td><%= point.getString(point.getY()) %></td>
                    <td><%= point.getString(point.getR()) %></td>
                    <td style="color: <%= point.getResult() ? "green" : "red" %>"><%= point.getResult() ? "in" : "out" %></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br>

    <div class="form">
        <form method="post" action="index.jsp">
            <button type="submit" >Return</button>
        </form>
    </div>

</body>
</html>