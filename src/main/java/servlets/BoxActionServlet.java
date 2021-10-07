package servlets;

import com.google.gson.Gson;
import entities.BoxAction;
import entities.BoxCustomerProduct;
import entities.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utils.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "boxActionServlet", value = {"/boxAction-post","/boxAction-get","/boxAction-delete"})
public class BoxActionServlet extends HttpServlet {

    SessionFactory sf= HibernateUtil.getSessionFactory();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bid = 0;
        Session sesi = sf.openSession();
        Transaction tr = sesi.beginTransaction();
        try {
            String obj = req.getParameter("obj");
            Gson gson = new Gson();
            BoxAction boxAction = gson.fromJson(obj, BoxAction.class);
            sesi.saveOrUpdate(boxAction);
            tr.commit();
            sesi.close();
            bid = 1;
        }catch ( Exception ex) {
            System.err.println("Save OR Update Error : " + ex);
        }finally {
            sesi.close();
        }

        resp.setContentType("application/json");
        resp.getWriter().write( "" +bid );

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bid= Integer.parseInt(req.getParameter("bid"));
        Gson gson = new Gson();
        Session sesi = sf.openSession();
        List<BoxCustomerProduct> ls = sesi.createNativeQuery("SELECT * FROM boxaction as box INNER JOIN customer as cu ON box.box_customer_id= cu.cu_id\n" +
                "INNER JOIN products as pr ON pr.pid=box.box_product_id \n" +
                "WHERE box.box_customer_id=?1")
                .setParameter(1,bid)
                .addEntity(BoxCustomerProduct.class)
                .getResultList();
        sesi.close();

        String stJson = gson.toJson(ls);
        resp.setContentType("application/json");
        resp.getWriter().write( stJson );
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int return_id = 0;
        Session sesi = sf.openSession();
        Transaction tr = sesi.beginTransaction();
        try {
            int bid = Integer.parseInt( req.getParameter("bid") );
            BoxAction boxAction = sesi.load(BoxAction.class, bid);
            sesi.delete(boxAction);
            tr.commit();
            return_id = boxAction.getBid();
        }catch (Exception ex) {
            System.err.println("Delete Error : " + ex);
        }finally {
            sesi.close();
        }

        resp.setContentType("application/json");
        resp.getWriter().write( ""+return_id );
    }
}

