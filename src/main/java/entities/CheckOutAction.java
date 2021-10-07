package entities;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class CheckOutAction {
    @Id
    private int check_id;
    private int check_cu_id;
    private int type;
    private Date b_date;
    private Date l_date;

    @OneToOne(cascade = CascadeType.DETACH)
    private Customer customer;
}
