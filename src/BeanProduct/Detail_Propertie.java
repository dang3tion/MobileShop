package BeanProduct;

import java.util.ArrayList;

public class Detail_Propertie {
    private String idDetail;
    private String value;
    private String content;
    private String  idTT;
    private ArrayList<Propertie> listPropr;

    public Detail_Propertie(String idDetail, String value, String content, String idTT, ArrayList<Propertie> listPropr) {
        this.idDetail = idDetail;
        this.value = value;
        this.content = content;
        this.idTT = idTT;
        this.listPropr = listPropr;
    }

    public Detail_Propertie() {
    }

    public String getIdDetail() {
        return idDetail;
    }

    public void setIdDetail(String idDetail) {
        this.idDetail = idDetail;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIdTT() {
        return idTT;
    }

    public void setIdTT(String idTT) {
        this.idTT = idTT;
    }

    public ArrayList<Propertie> getListPropr() {
        return listPropr;
    }

    public void setListPropr(ArrayList<Propertie> listPropr) {
        this.listPropr = listPropr;
    }

    @Override
    public String toString() {
        return "Detail_Propertie{" +
                "idDetail='" + idDetail + '\'' +
                ", value='" + value + '\'' +
                ", content='" + content + '\'' +
                ", idTT='" + idTT + '\'' +
                ", listPropr=" + listPropr +
                '}';
    }

}
