/*
Sourav Banerjee 5/4/2018
Directs from altcalendar.jsp to the ScheduleDeleteBean to delete a calendar entry.
 */
package scheduleDeletion;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sourav
 */
@WebServlet(name = "ScheduleDelete", urlPatterns = {"/scheduleDelete"})
public class ScheduleDelete extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScheduleDelete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleDelete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        System.err.println(request.getParameter("team") + request.getParameter("sport") + request.getParameter("date"));
        ScheduleDeleteBean bean = new ScheduleDeleteBean(request.getParameter("team"), request.getParameter("sport"), request.getParameter("date"));
        boolean success = bean.deleter();
        
        try{
            if(success){
               request.getRequestDispatcher("scheduler.jsp").forward(request,response); 
            }
            else{
               request.getRequestDispatcher("schedulerFail.jsp").forward(request,response);
            }
        }
        catch(Exception e){
            System.err.println(e);
        } 
        
        
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
