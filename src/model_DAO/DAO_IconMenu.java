package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.IconMenu;
import model_beans.Product;

public class DAO_IconMenu extends ExecuteStatementUtility{
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
	public static void main(String[] args) {
		DAO_IconMenu dao = new DAO_IconMenu();
		for (int i = 0; i < dao.listIconMenu().size(); i++) {
			System.out.println(dao.listIconMenu().get(i).toString());
		}
	}
}
