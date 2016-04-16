/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AskQuestionModel;
import model.DBUtilities;
import model.EmailSender;

/**
 *
 * @author kanathip
 */
@WebServlet(name = "AskQuestionServlet", urlPatterns = {"/AskQuestionServlet"})
public class AskQuestionServlet extends HttpServlet {

    private DBUtilities dbUtilities;
    private ServletContext context;

    public void init() {
        dbUtilities = new DBUtilities();
        context = getServletContext();
    }

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
        request.setCharacterEncoding("UTF-8");
        AskQuestionModel questionModel = new AskQuestionModel();
        questionModel.setName(request.getParameter("name"));
        questionModel.setEmail(request.getParameter("email"));
        questionModel.setTitle(request.getParameter("topic"));
        questionModel.setQuestionDesc(request.getParameter("question"));
        
        String adminEmail = (String) context.getAttribute("adminEmail");
        
        try {
            dbUtilities.init();
            dbUtilities.userAskQuestion(questionModel);
            EmailSender emailSender = new EmailSender();
            emailSender.setEmailSubject("คำถามจากลูกค้า");
            emailSender.setEmailMessage("หัวข้อคำถาม : " +questionModel.getTitle());
            emailSender.sendEmail(adminEmail);
            dbUtilities.close();
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(AskQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.getWriter().print(request.getHeader("referer"));

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
