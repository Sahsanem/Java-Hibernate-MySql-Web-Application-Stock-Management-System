package entities;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Products {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private int pid;
    private String ptitle;
    private int aprice;
    private int oprice;
    private int pcode;
    private int ptax;
    private int psection;
    private int psize;
    private String pdetail;


}
