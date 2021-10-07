package entities;


import javax.persistence.*;
import lombok.Data;

@Entity
@Data
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int aid;

    private String name;
    @Column(length = 32)
    private String password;
    private String email;

}
