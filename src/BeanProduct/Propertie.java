package BeanProduct;

public class Propertie {
    private String id;
    private String value;
    private String content;

    public Propertie() {
    }

    public Propertie(String id, String value, String content) {
        this.id = id;
        this.value = value;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    @Override
    public String toString() {
        return "Propertie{" +
                "id='" + id + '\'' +
                ", value='" + value + '\'' +
                ", content='" + content + '\'' +
                '}';
    }

}
