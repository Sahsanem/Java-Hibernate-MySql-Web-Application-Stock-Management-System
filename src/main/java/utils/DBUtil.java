package utils;

import entities.Admin;
import entities.Customer;
import entities.Products;
import entities.ViewProductlimit;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public class DBUtil {
    SessionFactory sf = HibernateUtil.getSessionFactory();

    public List<Customer> allCustomerList() {
        Session sesi = sf.openSession();
        List<Customer> ls = sesi.createQuery("from Customer").getResultList();
        sesi.close();
        return ls;
    }

    public List<Products> allProductList() {
        Session sesi = sf.openSession();
        List<Products> ls = sesi.createQuery("from Products").getResultList();
        sesi.close();
        return ls;
    }

    public Customer singleCustomer(int c_id) {
        Customer cs = new Customer();
        try {
            Session sesi = sf.openSession();
            cs = sesi.find(Customer.class, c_id);
            sesi.close();
        } catch (Exception e) {
            System.err.println("SingleCustomer Error" + e);
        }
        return cs;
    }

    public Products singleProduct(int p_id) {
        Products pr = new Products();
        try {
            Session sesi = sf.openSession();
            pr = sesi.find(Products.class, p_id);
            sesi.close();
        } catch (Exception e) {
            System.err.println("SingleProduct Error" + e);
        }
        return pr;
    }

    public int login(String email, String password, String remember, HttpServletRequest req, HttpServletResponse resp) {
        List<Admin> ls=null;
        Session sesi = sf.openSession();

        try {
            String sql = "Select * from Admin where email= ? and password = ?";
            ls=sesi.createNativeQuery(sql)
                    .setParameter(1, email)
                    .setParameter(2, Util.MD5(password))
                    .getResultList();


            if ( ls.size() !=0 ) {
              int aid =ls.get(0).getAid();
                String name = ls.get(1).getName();

                req.getSession().setAttribute("aid", aid);
                req.getSession().setAttribute("name", name);

                if ( remember != null && remember.equals("on")) {
                    name = name.replaceAll(" ", "_");
                    String val = aid+"_"+name;
                    Cookie cookie = new Cookie("admin", val);
                    cookie.setMaxAge( 60*60 );
                    resp.addCookie(cookie);
                }
            }
        }catch (Exception e){
            System.err.println("loginError"+e);
        }finally {
            sesi.close();
        }

        return ls.size();
   }

   public void Box_Order_Add() {
       Session sesi = sf.openSession();
       Transaction tr = sesi.beginTransaction();
       String sql = "insert into order_boxcustomerproduct values (?,?)";
       int status = sesi.createNativeQuery(sql)
               .setParameter(1, 1)
               .setParameter(2, "bid")
               .executeUpdate();
       tr.commit();
       sesi.close();
   }


    public void ViewProductResult(){
        Session sesi=sf.openSession();
        List<ViewProductlimit> ls=sesi.createQuery("from ViewProductlimit ").getResultList();
        ls.forEach(item->{
            System.out.println(item.getPid()+ " "+ item.getAprice());
        });
       sesi.close();
    }






    }

