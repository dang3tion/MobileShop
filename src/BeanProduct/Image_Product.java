package BeanProduct;

public class Image_Product {
    private String idProduct;
    private String idColor;
    private String imgBackground;
    private String imgnum1;
    private String imgnum2;
    private String imgnum3;
    private String imgnum4;
    private String imgDifferent;

    public Image_Product(String idProduct, String idColor, String imgBackground, String imgnum1, String imgnum2, String imgnum3, String imgnum4, String imgDifferent) {
        this.idProduct = idProduct;
        this.idColor = idColor;
        this.imgBackground = imgBackground;
        this.imgnum1 = imgnum1;
        this.imgnum2 = imgnum2;
        this.imgnum3 = imgnum3;
        this.imgnum4 = imgnum4;
        this.imgDifferent = imgDifferent;
    }

    public Image_Product() {
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getIdColor() {
        return idColor;
    }

    public void setIdColor(String idColor) {
        this.idColor = idColor;
    }

    public String getImgBackground() {
        return imgBackground;
    }

    public void setImgBackground(String imgBackground) {
        this.imgBackground = imgBackground;
    }

    public String getImgnum1() {
        return imgnum1;
    }

    public void setImgnum1(String imgnum1) {
        this.imgnum1 = imgnum1;
    }

    public String getImgnum2() {
        return imgnum2;
    }

    public void setImgnum2(String imgnum2) {
        this.imgnum2 = imgnum2;
    }

    public String getImgnum3() {
        return imgnum3;
    }

    public void setImgnum3(String imgnum3) {
        this.imgnum3 = imgnum3;
    }

    public String getImgnum4() {
        return imgnum4;
    }

    public void setImgnum4(String imgnum4) {
        this.imgnum4 = imgnum4;
    }

    public String getImgDifferent() {
        return imgDifferent;
    }

    public void setImgDifferent(String imgDifferent) {
        this.imgDifferent = imgDifferent;
    }

    @Override
    public String toString() {
        return "Image_Product{" +
                "idProduct='" + idProduct + '\'' +
                ", idColor='" + idColor + '\'' +
                ", imgBackground='" + imgBackground + '\'' +
                ", imgnum1='" + imgnum1 + '\'' +
                ", imgnum2='" + imgnum2 + '\'' +
                ", imgnum3='" + imgnum3 + '\'' +
                ", imgnum4='" + imgnum4 + '\'' +
                ", imgDifferent='" + imgDifferent + '\'' +
                '}';
    }
}
