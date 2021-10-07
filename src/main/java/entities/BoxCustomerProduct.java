package entities;

import lombok.Data;

import javax.persistence.*;


@Entity
@Data
public class BoxCustomerProduct {
    @Id
    private int bid;
    private String cu_name;
    private int oprice;
    private int adet;
    private int fisNo;
    private String ptitle;



}
