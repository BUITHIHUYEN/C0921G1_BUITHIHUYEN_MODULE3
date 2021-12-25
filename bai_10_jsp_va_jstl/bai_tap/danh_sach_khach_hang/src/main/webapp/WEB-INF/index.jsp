<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>danh sách khách hàng</title>

</head>
<body>

    <table border="1">
        <tr>
            <th colspan="4">Danh Sách Khách Hàng</th> </tr>
        <tr>
            <th>Tên</th>
            <th>Ngày Sinh</th>
            <th>Địa Chỉ</th>
            <th>Ảnh</th>
        </tr>

        <c:forEach var="khachHang" items="${listDanhSachKhachHang}">
            <tr>
                <td>
                    <c:out value="${khachHang.name}"/></td>
                <td>
                    <c:out value="${khachHang.dateofBirth}"/></td>
                <td>
                    <c:out value="${khachHang.address}"/></td>
                <td>
                    <img style="width: 70px;height: 70px" src="<c:out value=" ${khachHang.picture}" />">
                </td>
            </tr>
        </c:forEach>

    </table>
</body>
</html>

