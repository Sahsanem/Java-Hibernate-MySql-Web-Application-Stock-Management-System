package servlets;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import entities.Customer;
import entities.Products;
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

@WebServlet(name = "productsServlet",value = {"/product-post","/delete-product","/product-get"})
public class ProductsServlet extends HttpServlet {

    SessionFactory sf = HibernateUtil.getSessionFactory();

    //insert
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pidx=0;
        Session sesi = sf.openSession();
        Transaction tr = sesi.beginTransaction();
        try {
            String obj = req.getParameter("obj");
            Gson gson = new Gson();
            Products product = gson.fromJson(obj, Products.class);

            sesi.saveOrUpdate(product);
            tr.commit();
            sesi.close();
           pidx = 1;
        }catch (Exception e){
            System.err.println("Save OR Update Error : " + e);
        }finally {
            sesi.close();
        }
        resp.setContentType("application/json");
        resp.getWriter().write( "" +pidx );
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        Session sesi = sf.openSession();
        List<Products> ls = sesi.createQuery("from Products").getResultList();
        sesi.close();

        String stJson = gson.toJson(ls);
        resp.setContentType("application/json");
        resp.getWriter().write( stJson );
    }
    //remove

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int return_id = 0;
        Session sesi = sf.openSession();
        Transaction tr = sesi.beginTransaction();
        try {
            int pid = Integer.parseInt( req.getParameter("pid") );
            Products products = sesi.load(Products.class, pid);
            sesi.delete(products);
            tr.commit();
            return_id = products.getPid();
        }catch (Exception ex) {
            System.err.println("Delete Error : " + ex);
        }finally {
            sesi.close();
        }

        resp.setContentType("application/json");
        resp.getWriter().write( ""+return_id );
    }

}
