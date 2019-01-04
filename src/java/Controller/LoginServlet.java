/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modal.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shobhit
 */
public class LoginServlet extends HttpServlet {

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
        boolean adminflag = false;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("nm");
        String pass = request.getParameter("pwd");
        try{
            boolean flags[] = LoginDao.validate(username,pass);
                if(flags[0]){
                    HttpSession session = request.getSession();
                    session.setAttribute("uname",username);
                    if(flags[1]){
                       
                       RequestDispatcher rd = request.getRequestDispatcher("adminportal.html"); 
                       rd.forward(request,response);
                    }
                    else if(flags[2]){
                        RequestDispatcher rd = request.getRequestDispatcher("request.jsp"); 
                       rd.forward(request,response);
                    }
                    else if(flags[3]){
                        RequestDispatcher rd = request.getRequestDispatcher("javascriptCommunity.jsp"); 
                       rd.forward(request,response);
                    }
                    else if(flags[4]){
                        RequestDispatcher rd = request.getRequestDispatcher("linuxCommunity.jsp"); 
                       rd.forward(request,response);
                    }
                    else if(flags[5]){
                        RequestDispatcher rd = request.getRequestDispatcher("cppCommunity.jsp"); 
                       rd.forward(request,response);
                    }
                    else if(flags[6]){
                        RequestDispatcher rd = request.getRequestDispatcher("cCommunity.jsp"); 
                       rd.forward(request,response);
                    }
                    else if(flags[7]){
                        RequestDispatcher rd = request.getRequestDispatcher("nodeCommunity.jsp"); 
                       rd.forward(request,response);
                    }
                    else{
                    
                    RequestDispatcher rd = request.getRequestDispatcher("feeds.jsp");
                    rd.forward(request,response);
                    }
                }
                else{
                    System.out.println("wrong");
                    out.print("alert(userName or password wrong)");
                    RequestDispatcher rd = request.getRequestDispatcher("login.html");
                    rd.forward(request, response);
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
