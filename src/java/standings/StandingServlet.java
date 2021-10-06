/**
 *
 * @author Sourav Banerjee 5/4/2018
 * This program takes standings input from alternate sports pages and sends them to the standings bean. 
 */
package standings;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "StandingServlet", urlPatterns = {"/standings"})
public class StandingServlet extends HttpServlet {

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
            out.println("<title>Servlet StandingServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StandingServlet at " + request.getContextPath() + "</h1>");
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
        
        StandingsBean standings = new StandingsBean();
        
        standings.setAway(request.getParameter("awayTeam"));
        standings.setHome(request.getParameter("homeTeam"));
        standings.setDate(request.getParameter("date"));
        standings.setHomeScore(Integer.parseInt(request.getParameter("homeScore")));
        standings.setOpponentScore(Integer.parseInt(request.getParameter("awayScore")));
        standings.setSport(request.getParameter("sport"));

        standings.scoreCalculator();
        String userPath = request.getServletPath();
        
         try{
             if("football".equals(request.getParameter("sport"))){
                 request.getRequestDispatcher("footballredirect.jsp").forward(request,response);
             }else if("mlacrosse".equals(request.getParameter("sport"))){
                 request.getRequestDispatcher("mlacrosseredirect.jsp").forward(request,response);
             }else if("msoccer".equals(request.getParameter("sport"))){
                 request.getRequestDispatcher("msoccerredirect.jsp").forward(request,response);
             }
             
             
         }
         catch(IOException | ServletException e){
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
