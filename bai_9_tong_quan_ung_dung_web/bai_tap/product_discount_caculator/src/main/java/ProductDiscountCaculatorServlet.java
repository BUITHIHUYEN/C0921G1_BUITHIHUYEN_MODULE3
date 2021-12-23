import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCaculatorServlet", urlPatterns = "/display-discount")
public class ProductDiscountCaculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("product description");
        String b = request.getParameter("list price");
        String c = request.getParameter("discount percent");
        Double d = 0.01;
        Double DiscountAmount = Integer.parseInt(b) * Integer.parseInt(c) * d;
        Double DiscountPrice = Integer.parseInt(b) - DiscountAmount;
        request.setAttribute("result1", DiscountAmount);
        request.setAttribute("result2", DiscountPrice);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
