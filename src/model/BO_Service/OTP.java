package model.BO_Service;

public class OTP {

	private int sysOTP;

	public OTP() {
		this.sysOTP = randomOTP();
	}

	public int getSysOTP() {
		return sysOTP;
	}

	// OTP mặc định 6 chữ số
	public int randomOTP() {
		return (int) ((Math.random() * (999999 - 100000)) + 100000);
	}

	public boolean checkOTP(String userOTP) {
		int intOTP = Integer.parseInt(userOTP);
		if (intOTP == sysOTP) {
			return true;
		}
		return false;
	}
}
