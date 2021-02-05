<!DOCTYPE html>

<html>
    <head><title>Login App</title>
        
        <link href="css/one.css" rel="stylesheet" type="text/css"/>
    <table width="85%">
        <tr><td>
                <img src="images/duke.png" /> </td><td>
                <h1 style=" align-content: left"> Welcome to Student Information App </h1>
            </td>
            <td>
                Welcome <%  if(session.getAttribute("user") == null)
                                out.println("Guest");  
                         else {
                               out.println(session.getAttribute("user").toString()); 
                        }%> 
            </td>
  
    </table>
</head>
<body>