<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>


<jsp:include page="header.jsp" />

<sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <sql:query dataSource="${myDBAccess}" var="rs">
            SELECT * FROM HR.STUDENTREC ORDER BY NRIC
        </sql:query>
        <table border="2" width="70%" contenteditable="true" style="text-align: center;">
            <tr style=" font-weight: 800; background-color: lightblue">
                <th>NRIC</th>
                <th>Name</th>
                <th>Course</th>
                <th>Contact</th>
            </tr>
            <c:forEach var="row" items="${rs.rows}">
                <tr>
                    <td><c:out value="${row.NRIC}" /></td>
                    <td><c:out value="${row.NAME}" /></td>
                    <td><c:out value='${row.SUBJECT}'/></td>
                    <td><c:out value='${row.PHONE}'/></td>
                    
                        
                </form>
            </td>
        </tr>
    </c:forEach>
    
</table>
</form>















<form action="AuthServlet" method="POST">
    <input type="hidden" name="userid" value='<%=request.getAttribute("user")%>'  />
    <br>   Click here to Logout &nbsp;&nbsp;&nbsp; <input type="submit" name="action" value="Logout" />
</form>

<jsp:include page="footer.jsp" />