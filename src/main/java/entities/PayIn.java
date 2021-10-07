package entities;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class PayIn {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int payin_id;
    private int mu_no;
    private int mu_fisno;
    private int payin_payment_total;
    private String payin_payment_detail;
    private Date payin_date;

    @OneToOne(cascade = CascadeType.DETACH)
    private Customer customer;

    @OneToOne(cascade = CascadeType.DETACH)
    private Products product;



}
