package model_utility;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class OTP {

	private int sysOTP;
	private LocalDateTime timeCreate;
	private int timeLive; // Minute

	public OTP() {
		this.sysOTP = randomOTP();
		timeCreate = LocalDateTime.now();
		this.timeLive = Config.OTP_LIVE_SECOND;
	}

	public int getSysOTP() {
		return sysOTP;
	}

	// OTP mặc định 6 chữ số
	public int randomOTP() {
		return (int) ((Math.random() * (999999 - 100000)) + 100000);
	}

	public LocalDateTime getTimeCreate() {
		return timeCreate;
	}

	public boolean checkOTP(String userOTP) {
		int intOTP = Integer.parseInt(userOTP);
		if (intOTP == sysOTP) {
			return true;
		}
		return false;
	}

	public boolean checkLiveOTP(LocalDateTime userTime) {
		
		if (Math.abs(ChronoUnit.SECONDS.between(timeCreate, userTime)) < timeLive) {
			return true;
		}

		return false;
	}

}
