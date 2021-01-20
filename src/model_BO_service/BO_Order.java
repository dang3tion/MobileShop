package model_BO_service;

public class BO_Order {

	private static BO_Order boOrder = null;

	private BO_Order() {
	}

	public static BO_Order getBO_Order() {
		if (boOrder == null) {
			boOrder = new BO_Order();
		}
		return boOrder;
	}
}
