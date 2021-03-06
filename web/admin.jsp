<%-- 
    Document   : profile
    Created on : Apr 17, 2018, 12:55:39 AM
    Author     : ReedS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%      
String logPage, logSet, profilePage, profileSet;
if (session.getAttribute("email") != null) {
    if (session.getAttribute("type").equals("admin")){
        profilePage = "admin.jsp";
        profileSet = "Admin";
        logPage = "logout.jsp";
        logSet = "Logout";
    } else {
        profilePage = "profile.jsp";
        profileSet = "Profile";
        logPage = "logout.jsp";
        logSet = "Logout";
    }
} else {
    logPage = "login.jsp";
    logSet = "Login";
    profilePage = "";
    profileSet = "";
}
%>

<html>
    <head>
        <title>Admin Page</title>
        <link rel='stylesheet' href='css/style.css'>
    </head>
    
    <body>
        <header>
            <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
        </header>
        
        <ul>
          <li><a href="daily.jsp">Daily</a></li>
          <li><a href="location.jsp">Hourly</a></li>
          <li style="float:right"><a class="active" href="<%=profilePage%>"><%=profileSet%></a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
          
        </ul>

        <div class="adminupdatepass">
            <form method="post" action="UpdatePassServlet">
                <input type="password" placeholder="Password" name="password" required>
                <input type="submit" value="Update Password">
            </form>
        </div>
          
        <div class="adminweather">
            <form method="post" action="addWeatherServlet">
                <input type="text" placeholder="City" name="location" required>
                <input type="text" placeholder="Day Ex: Mon/Tues/Wed..." name="day" required>
                <input type="text" placeholder="Zipcode" name="zip" required>
                <input type="text" placeholder="Temperature F" name="temperaturef" required>
                <input type="text" placeholder="Temperature C" name="temperaturec" required>
                <input type="text" placeholder="Humidity" name="humidity" required>
                <input type="text" placeholder="Feels Like Temperature" name="feelslike" required>
                <input type="text" placeholder="Wind Ex: 5MPH/N" name="wind" required>
                <input type="text" placeholder="Pressure" name="pressure" required>
                <input type="submit" value="Add Weather">
            </form>
        </div>
    </body>
</html>
