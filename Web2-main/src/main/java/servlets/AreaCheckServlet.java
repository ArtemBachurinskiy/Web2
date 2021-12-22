package servlets;

import model.Point;
import model.Results;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AreaCheckServlet", value = "/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double x = Double.parseDouble(request.getParameter("x_value"));
        double y = Double.parseDouble(request.getParameter("y_value"));
        double r = Double.parseDouble(request.getParameter("r_value"));
        Point point = new Point(x, y ,r);
        point.setResult(inArea(x, y ,r));

        Results results = (Results) getServletContext().getAttribute("results");
        if (results == null) {
            results = new Results();
            results.pushPoint(point);
            getServletContext().setAttribute("results", results);
        } else {
            results.pushPoint(point);
        }

        getServletContext().getRequestDispatcher("/res_page.jsp").forward(request, response);
    }

    private boolean inArea(double x, double y, double r) {
        return (x >= 0 && y >= 0 && y <= -0.5*x + r/2) ||
                (x <= 0 && y >= 0 && x*x + y*y <= (r/2)*(r/2)) ||
                (x >= 0 && y <= 0 && x <= r && y >= -r/2);
    }
}