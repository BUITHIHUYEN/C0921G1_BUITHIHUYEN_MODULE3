import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCaculatorServlet", urlPatterns = "/display-discount")
public class ProductDiscountCaculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription= request.getParameter("productDescription");
        String listPrice= request.getParameter("listPrice");
        String discountPercent= request.getParameter("discountPercent");
        Double DiscountAmount = Integer.parseInt(listPrice) * Integer.parseInt(discountPercent) * 0.01;
        Double DiscountPrice = Integer.parseInt(listPrice) - DiscountAmount;
        request.setAttribute("disCountAmount", DiscountAmount);
        request.setAttribute("disCountPrice", DiscountPrice);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
