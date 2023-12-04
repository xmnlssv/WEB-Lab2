package web.servlets;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    private static final String DATA_VALIDATION_ERROR = "Data validation failed: Please check input values.";
    private static final int UNPROCESSABLE_ENTITY = 422;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!isValidRequest(request)) {
            sendError(response, DATA_VALIDATION_ERROR, UNPROCESSABLE_ENTITY);
            return;
        }

        try {
            if (
                    Double.parseDouble(request.getParameter("Y")) < -5
                            || Double.parseDouble(request.getParameter("Y")) > 5
            ) {
                sendError(response, DATA_VALIDATION_ERROR, UNPROCESSABLE_ENTITY);
                return;
            }

            Integer.parseInt(request.getParameter("X"));
            Integer.parseInt(request.getParameter("R"));

            response.sendRedirect("./checkArea?" + request.getQueryString());
        } catch (NumberFormatException e) {
            sendError(response, "Invalid number format", UNPROCESSABLE_ENTITY);
        } catch (Exception e) {
            sendError(response, "Internal server error", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private boolean isValidRequest(HttpServletRequest request) {
        return isParameterValid(request, "x") &&
                isParameterValid(request, "y") &&
                isParameterValid(request, "r");
    }

    private boolean isParameterValid(HttpServletRequest request, String paramName) {
        String paramValue = request.getParameter(paramName);
        return paramValue != null && !paramValue.isEmpty();
    }

    private void sendError(HttpServletResponse response, String errorMessage, int statusCode) throws IOException {
        Map<String, Object> jsonResponse = new HashMap<>();
        jsonResponse.put("error", errorMessage);
        jsonResponse.put("status", statusCode);

        response.setContentType("application/json");
        response.setStatus(statusCode);
        response.getWriter().write(new Gson().toJson(jsonResponse));
    }
}
