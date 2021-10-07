package entities;

import lombok.Data;

import javax.persistence.*;
import java.util.List;


@Entity
@Data
public class Cu_Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int oid;
    private int b_bid;
    private String b_urun;
    private int b_fiyat;
    private int b_adet;
    private String b_cu_name;
    private int b_fisNo;

    @OneToMany(cascade = CascadeType.DETACH)
    private List<BoxCustomerProduct> boxCustomerProduct;



}
