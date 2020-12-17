package BeanProduct;

public class Config {
    private String id;
    private int numberConfig;

    public Config(String id, int numberConfig) {
        this.id = id;
        this.numberConfig = numberConfig;
    }

    public Config() {
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getNumberConfig() {
        return numberConfig;
    }

    public void setNumberConfig(int numberConfig) {
        this.numberConfig = numberConfig;
    }

    @Override
    public String toString() {
        return "Config{" +
                "id='" + id + '\'' +
                ", numberConfig=" + numberConfig +
                '}';
    }

}
