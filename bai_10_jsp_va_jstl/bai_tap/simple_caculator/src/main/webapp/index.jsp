<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/24/2021
  Time: 5:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Caculator</title>
</head>
<body>
<h2>Simple Caculator</h2>
<%--định nghĩa 1 chú thích cho các phần tử dùng legend dùng kèm với filedsed để nhòm các thành phần bên trong form và tạo--%>
<%--đường viền bao quanh<-->--%>

<form action="/calculate" method="post" >
    <fieldset>
        <legend>Caculator</legend>
            <td>
            <th><label>First operand:</label></th>
            <th><input type="text" name="first_operand"></th>
            </td><br/>
            <td>
            <th><label>Operator:</label></th>
            <th><select name ="operator">
                <option value="+">Addition</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select></th>
            </td><br/>
            <td>
                <label>Second Operand:</label>
            <th><input type="text" name="second_operand"></th>
        </td><br/>
            <th><input type="submit" id="submit" value="Caculate"/></th>
    </fieldset>
</form>
</body>
</html>
