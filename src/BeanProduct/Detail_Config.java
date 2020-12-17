package BeanProduct;

import java.util.ArrayList;

public class Detail_Config {
    private String idConfig;
    private String idPropertie;
    private ArrayList<Detail_Propertie> listProper;

    public Detail_Config() {
    }

    public Detail_Config(String idConfig, String idPropertie, ArrayList<Detail_Propertie> listProper) {
        this.idConfig = idConfig;
        this.idPropertie = idPropertie;
        this.listProper = listProper;
    }


    public String getIdConfig() {
        return idConfig;
    }

    public void setIdConfig(String idConfig) {
        this.idConfig = idConfig;
    }

    public String getIdPropertie() {
        return idPropertie;
    }

    public void setIdPropertie(String idPropertie) {
        this.idPropertie = idPropertie;
    }

    public ArrayList<Detail_Propertie> getListProper() {
        return listProper;
    }

    public void setListProper(ArrayList<Detail_Propertie> listProper) {
        this.listProper = listProper;
    }

    @Override
    public String toString() {
        return "Detail_Config{" +
                "idConfig='" + idConfig + '\'' +
                ", idPropertie='" + idPropertie + '\'' +
                ", listProper=" + listProper +
                '}';
    }
}
