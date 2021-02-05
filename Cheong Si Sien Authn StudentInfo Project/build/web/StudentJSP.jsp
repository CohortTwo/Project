<%-- 
    Document   : UserRegJSP
    Created on : Dec 23, 2020, 3:35:24 PM
    Author     : chand
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB Operations Page </title>
    </head>
    <body>
        <sql:setDataSource var="myDBAccess"  dataSource="jdbc/oraDS" />
        <c:set var="op" value='<%=request.getParameter("action")%>' />
        <c:if test="${op == 'Add'}">
            console.log ("come to add");
            <sql:update dataSource="${myDBAccess}" var="count">
            INSERT INTO HR.STUDENT_TBL(USERID,PASSWORD,USERNAME,INUSE, ADMININD) VALUES('<%=request.getParameter("usr")%>','<%=request.getParameter("pwd")%>','<%=request.getParameter("user")%>', 0, '<%=request.getParameter("adminind")%>')
            </sql:update>    
        </c:if>    
        <c:if test="${op == 'Unlock'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                UPDATE HR.STUDENT_TBL SET INUSE = 0 WHERE USERID='<%=request.getParameter("userid")%>'
            </sql:update>    
        </c:if>   
         <c:if test="${op == 'AdminToggle'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                UPDATE HR.STUDENT_TBL SET ADMININD = 1- ADMININD WHERE USERID='<%=request.getParameter("userid")%>'
            </sql:update>    
        </c:if>            
        <c:if test="${op == 'Delete'}">
            <sql:update dataSource="${myDBAccess}" var="count">
                DELETE HR.STUDENT_TBL WHERE USERID='<%=request.getParameter("userid")%>'
            </sql:update>    
        </c:if>    

                <% 
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                %>
    </body>
</html>   
