<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>


<jsp:include page="header.jsp" />



          
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT USERID, PASSWORD, USERNAME, ADMININD, INUSE FROM HR.STUDENT_TBL ORDER BY USERID
        </sql:query>
        <table border="2" width="100%" contenteditable="true" style="text-align: center;">
            <tr style=" font-weight: 800; background-color: lightblue">
                <th>User_ID</th>
                <th>Password</th>
                <th>User Name</th>
                <th>Admin Access</th>
                <th>InUSE</th>
                <th>Operations</th>
            </tr>
            <c:forEach var="row" items="${rs.rows}">
                <tr>
                    <td><c:out value="${row.userid}" /></td>
                    <td><c:out value='${row.password}'/></td>
                    <td><c:out value='${row.username}'/></td>
                    <td><c:out value='${row.adminind}'/></td>
                    <td><c:out value='${row.inuse}'/></td>
                <form action="UserRegJSP.jsp" method="POST">

                    <input type="hidden" name="userid" value="${row.userid}">
                    <td><input type="submit" name="action" value="Delete">
                        <c:if test="${row.inuse == 1}">
                            <input type="submit" name="action" value="Unlock">
                        </c:if>
                            <input type="submit" name="action" value="AdminToggle">
                        
                </form>
            </td>
        </tr>
    </c:forEach>
    <tr>
    <form action="UserRegJSP.jsp" method="POST">
        <td><input type="text" name="usr"></td>
        <td><input type="text" name="pwd"></td>
        <td><input type="text" name="user"></td>
        <td><input type="text" name="adminind"></td>
        <td colspan="2"><input type="submit" name="action" value="Add"></td>
    </form>
</tr>
</table>
</form>

<form action="AuthServlet" method="POST">
    <input type="hidden" name="userid" value='<%=request.getAttribute("user")%>'  />
    <br>   Click here to Logout &nbsp;&nbsp;&nbsp; <input type="submit" name="action" value="Logout" />
    <br>   Click here to VIEW MARKS &nbsp;&nbsp;&nbsp; <input type="submit" name="action" value="ViewStudents" />
</form>

<jsp:include page="footer.jsp" />