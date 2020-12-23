package BeanProduct;

import java.text.DecimalFormat;

public class StarEvaluate {
    private String idProduct;
    private int star1;
    private int star2;
    private int star3;
    private int star4;
    private int star5;

    public StarEvaluate() {
    }

    public StarEvaluate(String idProduct, int star1, int star2, int star3, int star4, int star5) {
        this.idProduct = idProduct;
        this.star1 = star1;
        this.star2 = star2;
        this.star3 = star3;
        this.star4 = star4;
        this.star5 = star5;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public int getStar1() {
        return star1;
    }

    public void setStar1(int star1) {
        this.star1 = star1;
    }

    public int getStar2() {
        return star2;
    }

    public void setStar2(int star2) {
        this.star2 = star2;
    }

    public int getStar3() {
        return star3;
    }

    public void setStar3(int star3) {
        this.star3 = star3;
    }

    public int getStar4() {
        return star4;
    }

    public void setStar4(int star4) {
        this.star4 = star4;
    }

    public int getStar5() {
        return star5;
    }

    public void setStar5(int star5) {
        this.star5 = star5;
    }

    @Override
    public String toString() {
        return "StartEvaluate{" +
                "idProduct='" + idProduct + '\'' +
                ", star1=" + star1 +
                ", star2=" + star2 +
                ", star3=" + star3 +
                ", star4=" + star4 +
                ", star5=" + star5 +
                '}';
    }

    public double getAvg(){
       double avg = (star1*1+star2*2+star3*3+star4*4+star5*5)/sum();
       avg = Double.valueOf(new DecimalFormat("#.#").format(avg));
       return avg;
    }
     
    public double sum() {
    	return star1+star2+star3+star4+star5;
    }
    public double getPercent1() {
		return ((double)star1/sum())*100;
	}
 
    public double getPercent2() {
		return ((double)star2/sum())*100;
	}
    public double getPercent3() {
		return ((double)star3/sum())*100;
	}
    public double getPercent4() {
		return ((double)star4/sum())*100;
	}
    public double getPercent5() {
		return ((double)star5/sum())*100;
	}
}
