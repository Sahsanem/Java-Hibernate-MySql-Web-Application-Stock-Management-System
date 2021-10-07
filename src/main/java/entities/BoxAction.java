package entities;

import lombok.Data;

import javax.persistence.*;



@Entity
@Data
public class BoxAction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bid;

    private int box_customer_id;

    private int box_product_id;

    private int adet;
    private int fisNo;


    @OneToOne(cascade=CascadeType.DETACH)
    private Products products;

    @OneToOne(cascade = CascadeType.DETACH)
    private Customer customer;

}
