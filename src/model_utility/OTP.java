package model_utility;

import java.time.LocalDateTime;

public class OTP {

	private int sysOTP;
	private LocalDateTime timeout;

	public OTP() {
		this.sysOTP = randomOTP();
		timeout = LocalDateTime.now().plusMinutes(Const.OTP_LIVE_MINUTES);
	}

	public int getSysOTP() {
		return sysOTP;
	}

	// OTP mặc định 6 chữ số
	public int randomOTP() {
		return (int) ((Math.random() * (999999 - 100000)) + 100000);
	}

	public LocalDateTime getTimeout() {
		return timeout;
	}

	public boolean checkOTP(String userOTP) {
		int intOTP = Integer.parseInt(userOTP);
		if (intOTP == sysOTP) {
			return true;
		}
		return false;
	}

	public boolean checkLiveOTP(LocalDateTime userTime) {
		if (userTime.getYear() != timeout.getYear()) {
			return false;
		}
		if (userTime.getMonth() != timeout.getMonth()) {
			return false;
		}
		if (userTime.getDayOfMonth() != timeout.getDayOfMonth()) {
			return false;
		}
		if (userTime.getHour() != timeout.getHour()) {
			return false;
		}
		if (userTime.getMinute() - timeout.getMinute() > 2) {
			return false;
		}

		return true;
	}

}
