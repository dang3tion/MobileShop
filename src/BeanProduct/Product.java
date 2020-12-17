package BeanProduct;

import java.util.ArrayList;

public class Product {
    private String id;
    private String name;
    private String specie;
    private String idBrand;
    private String condition;
    private String dataUpdate;
    private String introduce;
    private int amount;
    private int amountSale;
    private String config;


    public Product() {
    }

    public Product(String id, String name, String specie, String idBrand, String condition, String dataUpdate, String introduce, int amount, int amountSale, String config) {
        this.id = id;
        this.name = name;
        this.specie = specie;
        this.idBrand = idBrand;
        this.condition = condition;
        this.dataUpdate = dataUpdate;
        this.introduce = introduce;
        this.amount = amount;
        this.amountSale = amountSale;
        this.config = config;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecie() {
        return specie;
    }

    public void setSpecie(String specie) {
        this.specie = specie;
    }

    public String getIdBrand() {
        return idBrand;
    }

    public void setIdBrand(String idBrand) {
        this.idBrand = idBrand;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getDataUpdate() {
        return dataUpdate;
    }

    public void setDataUpdate(String dataUpdate) {
        this.dataUpdate = dataUpdate;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAmountSale() {
        return amountSale;
    }

    public void setAmountSale(int amountSale) {
        this.amountSale = amountSale;
    }

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", specie='" + specie + '\'' +
                ", idBrand='" + idBrand + '\'' +
                ", condition='" + condition + '\'' +
                ", dataUpdate='" + dataUpdate + '\'' +
                ", introduce='" + introduce + '\'' +
                ", amount=" + amount +
                ", amountSale=" + amountSale +
                ", config='" + config + '\'' +
                '}';
    }
}
