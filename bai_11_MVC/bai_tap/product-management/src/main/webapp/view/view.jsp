<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/28/2021
  Time: 4:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
    <tr>
        <td>Product Description: </td>
        <td>${requestScope["product"].getProductDescription()}</td>
    </tr>
    <tr>
        <td>Producer:</td>
        <td>${requestScope["product"].getProducer()}</td>
    </tr>
</table>
</body>
</html>
