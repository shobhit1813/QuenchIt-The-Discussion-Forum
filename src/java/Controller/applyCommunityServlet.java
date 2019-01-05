/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author shobhit
 */
public class applyCommunityServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean excflag = false;
        PrintWriter out = response.getWriter();
        String username = request.getSession().getAttribute("uname").toString();
        String []checked = request.getParameterValues("community");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
            for(int i=0; i < checked.length; i++){
                  PreparedStatement ps = con.prepareStatement("insert into "+checked[i]+"com values(?,?);");
                  ps.setString(1,username);
                  ps.setString(2,"false");
                  int c = ps.executeUpdate();
                  if(c > 0){
                      excflag = true;
                  }
                  else{
                      excflag = false;
                      break;
                    }
              }
            if(!excflag){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('error');");
                out.println("location='joincommunity.jsp';");
                out.println("</script>");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Response Submitted');");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                rd.forward(request,response);
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
