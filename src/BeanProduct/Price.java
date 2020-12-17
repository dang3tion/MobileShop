package BeanProduct;

public class Price {
    private String idProduct;
    private String dateUpdate;
    private double price;
    private double priceSale;

    public Price(String idProduct, String dateUpdate, double price, double priceSale) {
        this.idProduct = idProduct;
        this.dateUpdate = dateUpdate;
        this.price = price;
        this.priceSale = priceSale;
    }


    public Price() {
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getDateUpdate() {
        return dateUpdate;
    }

    public void setDateUpdate(String dateUpdate) {
        this.dateUpdate = dateUpdate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(double priceSale) {
        this.priceSale = priceSale;
    }

    @Override
    public String toString() {
        return "Price{" +
                "idProduct='" + idProduct + '\'' +
                ", dateUpdate='" + dateUpdate + '\'' +
                ", price=" + price +
                ", priceSale=" + priceSale +
                '}';
    }

}
