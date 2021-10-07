package servlets;

import org.hibernate.SessionFactory;
import utils.DBUtil;
import utils.HibernateUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "adminServlet",value = "/admin-servlet")
public class AdminServlet extends HttpServlet {

    SessionFactory sf= HibernateUtil.getSessionFactory();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String remember=req.getParameter("remember");

       DBUtil util=new DBUtil();
        int ls=util.login(email,password,remember,req,resp);

        if(ls!=0){
            resp.sendRedirect("dashboard.jsp");
        }else{
            req.setAttribute("loginError", "Kullanıcı adı yada şifre hatalı!" );
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/");
            dispatcher.forward(req, resp);
        }
    }
}
