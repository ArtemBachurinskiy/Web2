<%@ page import="model.Point" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.Results" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
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
    <div id="plot_and_form">
        <!-- График -->
        <svg id="plot-svg">
            <rect class="plot-figure" height="50" width="100" x="150" y="150"></rect>
            <polygon class="plot-figure" points="250 150, 150 150, 150 100"></polygon>
            <path class="plot-figure" d="M 150 100 A 50 50 0 0 0 100 150 L 150 150 L 150 100"></path>
            <line class="plot-grid" x1="10" x2="290" y1="150" y2="150" stroke="black"></line>
            <line class="plot-grid" x1="150" x2="150" y1="10" y2="290" stroke="black"></line>
            <line class="plot-grid" x1="50" x2="50" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="100" x2="100" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="200" x2="200" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="250" x2="250" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="50" y2="50" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="100" y2="100" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="200" y2="200" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="250" y2="250" stroke="black"></line>
            <line class="plot-grid" x1="285" x2="290" y1="147" y2="150" stroke="black"></line>
            <line class="plot-grid" x1="285" x2="290" y1="153" y2="150" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="150" y1="15" y2="10" stroke="black"></line>
            <line class="plot-grid" x1="153" x2="150" y1="15" y2="10" stroke="black"></line>
            <text x="280" y="145">X</text>
            <text x="245" y="145">R</text>
            <text x="190" y="145">R/2</text>
            <text x="85" y="145">-R/2</text>
            <text x="40" y="145">-R</text>
            <text x="155" y="20">Y</text>
            <text x="155" y="55">R</text>
            <text x="155" y="105">R/2</text>
            <text x="155" y="205">-R/2</text>
            <text x="155" y="255">-R</text>
            <%
                Results results = (Results) application.getAttribute("results"); // javax.servlet.ServletContext application
                if (results != null) {
                    Collection<Point> points = results.getResults();
                    for (Point point: points) {
                        double x = point.getX();
                        double y = point.getY();
                        double r = point.getR();
                        double cx = 150 + x / r * 100;
                        double cy = 150 - y / r * 100;
                        String color = point.getResult() ? "green" : "red";
            %>
                        <circle style="fill:<%= color %>;
                                fill-opacity: 1;"
                                class="point" r="2" cx="<%= cx %>" cy="<%= cy %>">
                        </circle>
            <%
                    }
                }
            %>
        </svg>

        <!-- Формы для отправки запросов -->
        <form id="inputs" method="post" action="controller-servlet">
            <div>
                X =
                <label>
                    <input class="cbx" type="checkbox" value="-5" name="x_value" onchange="onchangeOfCbx(this)">-5
                    <input class="cbx" type="checkbox" value="-4" name="x_value" onchange="onchangeOfCbx(this)">-4
                    <input class="cbx" type="checkbox" value="-3" name="x_value" onchange="onchangeOfCbx(this)">-3
                    <input class="cbx" type="checkbox" value="-2" name="x_value" onchange="onchangeOfCbx(this)">-2
                    <input class="cbx" type="checkbox" value="-1" name="x_value" onchange="onchangeOfCbx(this)">-1
                    <input class="cbx" type="checkbox" value="0" name="x_value" onchange="onchangeOfCbx(this)">0
                    <input class="cbx" type="checkbox" value="1" name="x_value" onchange="onchangeOfCbx(this)">1
                    <input class="cbx" type="checkbox" value="2" name="x_value" onchange="onchangeOfCbx(this)">2
                    <input class="cbx" type="checkbox" value="3" name="x_value" onchange="onchangeOfCbx(this)">3
                </label>
            </div>
            <div>
                Y =
                <label for="y"></label>
                <input id="y" type="text" name="y_value" placeholder="(-5 ... 5)" maxlength="16">
            </div>
            <div>
                R =
                <label>
                    <input class="cbr" type="checkbox" value="1" name="r_value" onchange="onchangeOfCbr(this)">1
                    <input class="cbr" type="checkbox" value="1.5" name="r_value" onchange="onchangeOfCbr(this)">1.5
                    <input class="cbr" type="checkbox" value="2" name="r_value" onchange="onchangeOfCbr(this)">2
                    <input class="cbr" type="checkbox" value="2.5" name="r_value" onchange="onchangeOfCbr(this)">2.5
                    <input class="cbr" type="checkbox" value="3" name="r_value" onchange="onchangeOfCbr(this)">3
                </label>
            </div>
            <div>
                <button id="submit_button" type="submit">Submit</button>
            </div>
        </form>
    </div>

    <br>
    <div id="results">
        <table class="result_table">
            <thead>
                <tr>
                    <th class="variable">X</th>
                    <th class="variable">Y</th>
                    <th class="variable">R</th>
                    <th>Result</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (results != null) {
                        Collection<Point> points = results.getResults();
                        for (Point point: points) {
                %>
                <tr>
                    <td><%= point.getString(point.getX()) %></td>
                    <td><%= point.getString(point.getY()) %></td>
                    <td><%= point.getString(point.getR()) %></td>
                    <td style="color: <%=point.getResult() ? "green" : "red"%>;"><%= point.getResult() ? "in" : "out" %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="plotClick.js"></script>
    <script src="validator.js"></script>
</body>

</html>