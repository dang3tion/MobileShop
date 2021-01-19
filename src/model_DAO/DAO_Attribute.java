package model_DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import model_ConnectDB.ExecuteCRUD;
import model_beans.AttributeClass;
import model_beans.AttributeManager;

public class DAO_Attribute extends ExecuteCRUD {
	private static DAO_Attribute dao;

	private DAO_Attribute() {

	}

	public static DAO_Attribute getInstance() {
		if (dao == null) {
			dao = new DAO_Attribute();
		}
		return dao;
	}

	public Map<AttributeClass, ArrayList<AttributeManager>> getAllAttributesClasses() {
		Map<AttributeClass, ArrayList<AttributeManager>> map = new LinkedHashMap<AttributeClass, ArrayList<AttributeManager>>();
		ArrayList<AttributeClass> arr = (ArrayList<AttributeClass>) getAllClassAttributes();
		for (int i = 0; i < arr.size(); i++) {
			ArrayList<AttributeManager> list = new ArrayList<AttributeManager>();
			String query = "SELECT * FROM THUOCTINH WHERE MALOP=?";
			String id = arr.get(i).getId();

			try (ResultSet rs = super.ExecuteQuery(query, id)) {
				while (rs.next()) {
					AttributeManager att = new AttributeManager();
					att.setId(rs.getString("MATT").trim());
					att.setType(rs.getString("LOAI_GIATRI"));
					att.setTitle(rs.getString("NOIDUNG"));
					att.setClassAttribute(arr.get(i));
					list.add(att);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			map.put(arr.get(i), list);
		}
		return map;
	}

	public List<AttributeClass> getAllClassAttributes() {
		ArrayList<AttributeClass> list = new ArrayList<AttributeClass>();
		String query = "SELECT * FROM LOP_THUOCTINH";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			while (rs.next()) {
				list.add(new AttributeClass(rs.getString("MALOP").trim(), rs.getString("NOIDUNG")));
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public List<AttributeManager> getListAttributesMain(int start, int end) {
		ArrayList<AttributeManager> list = new ArrayList<AttributeManager>();

		String query = "SELECT * FROM  (SELECT ROW_NUMBER() OVER (ORDER BY TT.MATT asc) \r\n"
				+ "AS STT ,TT.MATT,TT.NOIDUNG NOIDUNG,TT.LOAI_GIATRI,LTT.MALOP,LTT.NOIDUNG NOIDUNGLOP \r\n"
				+ "FROM  THUOCTINH TT  JOIN LOP_THUOCTINH LTT ON LTT.MALOP =TT.MALOP )\r\n"
				+ " TK WHERE TK.STT BETWEEN ? AND ?";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				AttributeManager att = new AttributeManager();
				att.setId(rs.getString("MATT").trim());
				att.setTitle(rs.getString("NOIDUNG"));
				att.setType(rs.getString("LOAI_GIATRI"));
				AttributeClass ac = getAttributeClass(rs.getString("MALOP"));
				att.setClassAttribute(ac);
				list.add(att);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public AttributeClass getAttributeClass(String id) {
		AttributeClass ac = new AttributeClass();
		String query = "SELECT * FROM LOP_THUOCTINH WHERE MALOP=?";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			if (rs.next()) {
				ac.setId(rs.getString("MALOP").trim());
				ac.setName(rs.getString("NOIDUNG"));
			}
			return ac;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public AttributeClass getAttributeClassFromname(String name) {
		AttributeClass ac = new AttributeClass();
		String query = "SELECT * FROM LOP_THUOCTINH WHERE NOIDUNG=?";
		try (ResultSet rs = super.ExecuteQuery(query, name)) {
			if (rs.next()) {
				ac.setId(rs.getString("MALOP").trim());
				ac.setName(rs.getString("NOIDUNG"));
			}
			return ac;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public boolean addAttributeClass(String name) {
		if (!checkNameClass(name)) {
			String query = "INSERT INTO LOP_THUOCTINH VALUES(?,?,?)";
			String id = cutString(name);
			int value = 0;

			try (ResultSet rs = super.ExecuteQuery(query, id, name, value)) {
				return true;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return false;
	}

	public boolean checkNameClass(String name) {
		String query = "SELECT * FROM LOP_THUOCTINH WHERE NOIDUNG=? OR MALOP=?";
		String id = cutString(name);
		try (ResultSet rs = super.ExecuteQuery(query, name.trim(), id)) {
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean checkAttributeName(String name) {
		String query = "SELECT * FROM THUOCTINH WHERE NOIDUNG=?";
		try (ResultSet rs = super.ExecuteQuery(query, name)) {
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public int getTotalAttributesManager() {
		String query = "SELECT COUNT(*) FROM THUOCTINH";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				return rs.getInt(1);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	public boolean addAttributesManager(String name, String type, String nameClass) {
		if (!checkAttributeName(name.trim())) {

			String id = "TT" + (getTotalAttributesManager() + 1);
			String idClass = getAttributeClassFromname(nameClass).getId();
			if (type.equalsIgnoreCase("văn bản")) {
				type = "VB";
			} else {
				type = "SO";
			}
			String query = "INSERT INTO THUOCTINH VALUES(?,?,?,?)";
			try (ResultSet rs = super.ExecuteQuery(query, id, type, name, idClass)) {
				return true;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return false;
	}

	private String cutString(String s) {
		String[] arr = s.replaceAll("\s+", " ").split("\s");
		String result = "";
		for (int i = 0; i < arr.length; i++) {
			result += arr[i].charAt(0);
		}
		return result.toUpperCase();
	}

	public int numberOfPage(int line) {
		int result = getTotalAttributesManager() / line;
		if (getTotalAttributesManager() % line >= 1) {
			result += 1;
		}

		return result;
	}

	public String getIdDetail(String value, String idAtt) {
		String query = "SELECT MACT FROM CHITIET_THUOCTINH WHERE NOIDUNG=? AND MATT=?";
		try (ResultSet rs = super.ExecuteQuery(query, value, idAtt)) {
			if (rs.next()) {
				return rs.getString("MACT").trim();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return DAO_AddProduct.getInstance().addDetailProper(value, idAtt);

	}

	public boolean addConfiguration(String idConfig, String idAttr) {
		String query = "INSERT INTO CH_CTTT VALUES(?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, idConfig, idAttr)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean addNewConfiguration(Map<String, String> map) {
		return false;
	}

}
