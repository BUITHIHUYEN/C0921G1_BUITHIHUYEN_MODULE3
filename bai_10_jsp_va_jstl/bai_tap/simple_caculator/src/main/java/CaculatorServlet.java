import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CaculatorServlet",urlPatterns = "/calculate")
public class CaculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("first_operand"));
        float secondOperand = Integer.parseInt(request.getParameter("second_operand"));
        char operator = request.getParameter("operator").charAt(0);
        float result = Caculator.calculate(firstOperand, secondOperand, operator);
request.setAttribute("firstOperand",firstOperand);
request.setAttribute("secondOperand",secondOperand);
request.setAttribute("operator",operator);
request.setAttribute("result",result);
request.getRequestDispatcher("display.jsp").forward(request,response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
