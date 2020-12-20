package BeanProduct;

import java.util.ArrayList;

public class Detail_Config {
    private String idConfig;
    private String idPropertie;
    private Detail_Propertie proper;

    public Detail_Config() {
    }

    
    public Detail_Config(String idConfig, String idPropertie) {
		super();
		this.idConfig = idConfig;
		this.idPropertie = idPropertie;
	}


	
  


	public Detail_Config(String idConfig, String idPropertie, Detail_Propertie proper) {
		super();
		this.idConfig = idConfig;
		this.idPropertie = idPropertie;
		this.proper = proper;
	}


	public Detail_Propertie getProper() {
		return proper;
	}


	public void setProper(Detail_Propertie proper) {
		this.proper = proper;
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


	@Override
	public String toString() {
		return "Detail_Config [idConfig=" + idConfig + ", idPropertie=" + idPropertie + ", proper=" + proper + "]";
	}

  
   
}
