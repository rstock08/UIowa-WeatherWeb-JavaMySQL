/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to update database with new user. (Registration servlet).
*/

package Admin;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;


public class AddWeatherServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Request info from html form
        String location=request.getParameter("location");
        String day=request.getParameter("day");
        String zip=request.getParameter("zip");
        String temperaturef=request.getParameter("temperaturef");
        String temperaturec=request.getParameter("temperaturec");
        String humidity=request.getParameter("humidity");
        String feelslike=request.getParameter("feelslike");
        String wind=request.getParameter("wind");
        String pressure=request.getParameter("pressure");

        // Connect to mysql and verify username password
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection

            PreparedStatement ps = c.prepareStatement("INSERT INTO daily VALUES (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, location);
            ps.setString(2, day);
            ps.setString(3, zip);
            ps.setString(4, temperaturef);
            ps.setString(5, temperaturec);
            ps.setString(6, humidity);
            ps.setString(7, feelslike);
            ps.setString(8, wind);
            ps.setString(9, pressure);
        
            int i=ps.executeUpdate(); 
            if (i>0){
                response.sendRedirect("admin.jsp");
            } else {
                String resultMessage = "Failed";
                request.setAttribute("Message", resultMessage);
                response.sendRedirect("result.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        }
    }
}
