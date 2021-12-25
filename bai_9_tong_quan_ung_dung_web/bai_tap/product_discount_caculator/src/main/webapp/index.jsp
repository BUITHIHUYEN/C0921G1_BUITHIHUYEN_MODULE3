<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/23/2021
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Discount Calculator</title>


</head>
<body>
<h2> Product Discount Calculator</h2>
<form action=" /display-discount" method="post">
  <label>Product Description:</label>
  <input type="text" name="productDescription" placeholder="PRODUCT DESCRIPTION" value=""><br/>
  <label>List Price:</label>
  <input type="text" name="listPrice" placeholder="LIST PRICE" value=""><br/>
  <label>Discount Percent:</label>
  <input type="text" name="discountPercent" placeholder="DISCOUNT PERCENT" value =""><br/>
  <input type = "submit" id = "submit" value = "RESULT"/>
</form>
</h2>
</body>

</html>
