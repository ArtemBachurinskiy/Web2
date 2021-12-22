package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

//  TODO:
//      - разработанное веб-приложение необходимо развернуть на сервере WildFly. Сервер должен быть запущен в...

@WebServlet(name = "ControllerServlet", value = "/controller-servlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xStr = request.getParameter("x_value");
        String yStr = request.getParameter("y_value");
        String rStr = request.getParameter("r_value");

        if (requiredValuesAbsent(xStr, yStr, rStr)) {
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            if (nonNumericValues(xStr, yStr, rStr))
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            if (valuesInRanges(xStr, yStr, rStr))
                getServletContext().getRequestDispatcher("/area-check-servlet").forward(request, response);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private boolean requiredValuesAbsent(String xStr, String yStr, String rStr) {
        return xStr == null || yStr == null || rStr == null;
    }

    private boolean nonNumericValues(String xStr, String yStr, String rStr) {
        try {
            Double.parseDouble(xStr);
            Double.parseDouble(yStr);
            Double.parseDouble(rStr);
            return false;
        } catch (NumberFormatException e) {
            return true;
        }
    }

    private boolean valuesInRanges(String xStr, String yStr, String rStr) {
        return inRange(xStr,-5,3,true, true) &&
                inRange(yStr,-5,5,false, false) &&
                inRange(rStr,1,3,true, true);
    }

    private boolean inRange(String str, double min, double max, boolean minSquareBracket, boolean maxSquareBracket) {
        double value = Double.parseDouble(str);
        if ((minSquareBracket && value < min) || (!minSquareBracket && value <= min))
            return false;
        if ((maxSquareBracket && value > max) || (!minSquareBracket && value >= max))
            return false;
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}

//      важно! валидация правильности ввода должна проводиться и на клиенте (JS), и на сервере (сервлет). Проверка же на попадание
//      точки в область - только на сервере (сервлет)