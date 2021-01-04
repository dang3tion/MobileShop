package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.IconMenu;
import model_beans.Product;

public class DAO_IconMenu extends ExecuteStatementUtility {
	public ArrayList<IconMenu> listIconMenu() {
		ArrayList<IconMenu> listicon = new ArrayList<IconMenu>();
		String query = "select * from ICON_MENU ORDER BY MAIC ASC";

		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				listicon.add(new IconMenu(rs.getString("ICON"), rs.getString("TIEUDE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listicon;
	}

	public void updateIcon(String icon1, String content1, String icon2, String content2, String icon3, String content3,
			String icon4, String content4) {
		if (countIcon() == 0) {
			try {
				String query = "INSERT INTO ICON_MENU VALUES(?,?,?)";
				String[] parameters = {"IC1",icon1,content1};

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				String query = "INSERT INTO ICON_MENU VALUES(?,?,?)";
				String[] parameters = {"IC2",icon2,content2};

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				String query = "INSERT INTO ICON_MENU VALUES(?,?,?)";
				String[] parameters = {"IC3",icon3,content3};

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				String query = "INSERT INTO ICON_MENU VALUES(?,?,?)";
				String[] parameters = {"IC4",icon4,content4};

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				String query = "UPDATE ICON_MENU SET ICON = ? , TIEUDE = ? WHERE MAIC = 'IC1'";
				String[] parameters = { icon1, content1 };

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();

			}
			try {
				String query = "UPDATE ICON_MENU SET ICON = ? , TIEUDE = ? WHERE MAIC = 'IC2'";
				String[] parameters = { icon2, content2};

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();

			}
			try {
				String query = "UPDATE ICON_MENU SET ICON = ? , TIEUDE = ? WHERE MAIC = 'IC3'";
				String[] parameters = { icon3, content3 };

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();

			}
			try {
				String query = "UPDATE ICON_MENU SET ICON = ? , TIEUDE = ? WHERE MAIC = 'IC4'";
				String[] parameters = { icon4, content4};

				try (ResultSet rs = super.AccessDBstr(query, parameters)) {
				}
			} catch (Exception e) {
				e.printStackTrace();

			}
		}

	}
	public int countIcon() {
		String query = "SELECT COUNT(*) FROM ICON_MENU";
		int count = 0;
		try (ResultSet rs = super.AccessDBstr(query)) {
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static void main(String[] args) {
		DAO_IconMenu dao = new DAO_IconMenu();
		dao.updateIcon("cương", "cương","cương", "cương", "cương", "cương", "cương", "cương");
	}
}
