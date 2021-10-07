package entities;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity
@Data
public class PayOut {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int payout_id;
    private String payment_title;
    private int payout_payment_total;
    private int payment_type;
    private String payout_payment_detail;
    private Date payout_date;

}
