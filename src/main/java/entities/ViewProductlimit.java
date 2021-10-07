package entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "view_productlimit")
public class ViewProductlimit {
    @Id
    private int pid;
    private int pcode;
    private String ptitle;
    private int aprice;

    @Basic
    @Column(name = "pid")
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    @Basic
    @Column(name = "pcode")
    public int getPcode() {
        return pcode;
    }

    public void setPcode(int pcode) {
        this.pcode = pcode;
    }

    @Basic
    @Column(name = "ptitle")
    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    @Basic
    @Column(name = "aprice")
    public int getAprice() {
        return aprice;
    }

    public void setAprice(int aprice) {
        this.aprice = aprice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ViewProductlimit that = (ViewProductlimit) o;
        return pid == that.pid && pcode == that.pcode && aprice == that.aprice && Objects.equals(ptitle, that.ptitle);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pid, pcode, ptitle, aprice);
    }
}
