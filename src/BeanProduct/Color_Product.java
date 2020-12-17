package BeanProduct;

public class Color_Product {
    private String id;
    private String typeColor;
    private String name;
    private Image_Product img;

    public Color_Product(String id, String typeColor, String name, Image_Product img) {
        this.id = id;
        this.typeColor = typeColor;
        this.name = name;
        this.img = img;
    }


    public Color_Product() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTypeColor() {
        return typeColor;
    }

    public void setTypeColor(String typeColor) {
        this.typeColor = typeColor;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Image_Product getImg() {
        return img;
    }

    public void setImg(Image_Product img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Color_Product{" +
                "id='" + id + '\'' +
                ", typeColor='" + typeColor + '\'' +
                ", name='" + name + '\'' +
                ", img=" + img +
                '}';
    }


}
