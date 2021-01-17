package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model_ConnectDB.ExecuteCRUD;
import model_beans.Attribute;
import model_beans.Branch;
import model_beans.Color_main;
import model_beans.Price_product_main;
import model_beans.Product_main;
import model_beans.StarEvaluate;

public class DAO_Product_main extends ExecuteCRUD {
	private final String PRODUCT = "SANPHAM";
	private final String ID = "MASP";
	private final String PRICE = "GIA_SP";
	private final String PRICE_DATE = "NGAYCAPNHAT";
	private static DAO_Product_main dao_product_main = null;
	private String query;

	private DAO_Product_main() {

	}

	public int getTotalQuantity() {
		String query = "SELECT SUM(SS.SOLUONG) FROM SANPHAM SP JOIN SOLUONG_SP SS ON SS.MASP=SP.MASP";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {

				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getTotalQuantity_isSaled() {
		String query = "SELECT SUM(SS.SL_DABAN) FROM SANPHAM SP JOIN SOLUONG_SP SS ON SS.MASP=SP.MASP";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {

				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getNumberOfPage(int numRow) {
		int num = getTotalProduct() / numRow;

		if (getTotalProduct() % numRow > 1) {
			num += 1;
		}

		return num;
	}

	public int getTotalProduct() {
		String query = "SELECT COUNT(*) FROM SANPHAM";

		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {

				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}

	public int getTotalNumberAccount_areSaling() {
		String query = "SELECT * FROM SANPHAM WHERE TINHTRANG =N'Đang bán'";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}

	public int getTotalNumberAccount_stopSale() {
		String query = "SELECT * FROM SANPHAM WHERE TINHTRANG !=N'Đang bán'";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}

	public String convertBetweenURLandID(String ID_or_Name) {
		String query = null;
		String result = null;
		String para = null;

		if (ID_or_Name.length() < 6) {
			query = "SELECT TENSP FROM SANPHAM WHERE MASP= ?";
			para = ID_or_Name;
		} else {
			query = "SELECT MASP FROM SANPHAM WHERE TENSP= ? ";
			para = ID_or_Name.replace('-', ' ');
		}

		try (ResultSet rs = super.ExecuteQuery(query, para)) {
			if (rs.next()) {
				result = rs.getString(1).trim();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		result = result.replace(' ', '-');
		return result;
	}

	public static DAO_Product_main getDao_Product_main() {
		if (dao_product_main == null) {
			dao_product_main = new DAO_Product_main();
		}
		return dao_product_main;
	}

	public Price_product_main getPrices_Product(String id) {
		Price_product_main price = new Price_product_main();
		query = "SELECT TOP 1 *  FROM " + PRICE + " WHERE " + ID + " = ? ORDER BY " + PRICE_DATE + " DESC";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			while (rs.next()) {
				price.setPrice(rs.getInt(3));
				price.setPriceSales(rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}

	public Branch getBranch_Product(String id) {
		Branch branch = new Branch();
		query = "SELECT TH.MATH,TH.TENTH,TH.SLDT FROM THUONGHIEU TH JOIN SANPHAM SP ON SP.MATH=TH.MATH WHERE SP.MASP= ? ";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			while (rs.next()) {
				branch.setId(rs.getString(1));
				branch.setName(rs.getString(2));
				branch.setproductQuantity(rs.getInt(3));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return branch;
	}

	public List<Attribute> getAttribute_Product(String id) {
		ArrayList<Attribute> lstAtt = new ArrayList<Attribute>();
		query = "  SELECT SP.MASP, LTT.MALOP,LTT.NOIDUNG FROM SANPHAM SP JOIN CAUHINH CH ON CH.MACH=SP.MACH JOIN CH_CTTT CT ON CT.MACH=CH.MACH JOIN CHITIET_THUOCTINH CTT ON CTT.MACT=CT.MACT JOIN THUOCTINH TT ON TT.MATT=CTT.MATT JOIN LOP_THUOCTINH LTT ON LTT.MALOP=TT.MALOP WHERE SP.MASP= ? GROUP BY SP.MASP, LTT.MALOP,LTT.NOIDUNG";
		// set thuoc tinh
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			while (rs.next()) {
				Attribute att = new Attribute();
				att.setName(rs.getString(3));
				String idAtt = rs.getString(2);
				String query2 = "\r\n"
						+ "SELECT SP.MASP, LTT.MALOP,tt.MATT,tt.NOIDUNG,ctt.NOIDUNG,ctt.MACT FROM SANPHAM SP JOIN CAUHINH CH ON CH.MACH=SP.MACH JOIN CH_CTTT CT ON CT.MACH=CH.MACH JOIN CHITIET_THUOCTINH CTT ON CTT.MACT=CT.MACT\r\n"
						+ "JOIN THUOCTINH TT ON TT.MATT=CTT.MATT JOIN LOP_THUOCTINH LTT ON LTT.MALOP=TT.MALOP WHERE SP.MASP=? AND LTT.MALOP=? \r\n"
						+ "GROUP BY SP.MASP, LTT.MALOP,tt.MATT,tt.NOIDUNG,ctt.NOIDUNG,ctt.MACT ORDER BY TT.MATT ASC";
				ResultSet rs2 = super.ExecuteQuery(query2, id, idAtt);
				while (rs2.next()) {
					att.addAttribute(rs2.getString(4), rs2.getString(5));
				}
				lstAtt.add(att);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lstAtt;
	}

	public List<Color_main> getColors_Product(String id) {
		ArrayList<Color_main> lstColor = new ArrayList<Color_main>();
		query = "SELECT HA.MASP,HA.MAMAU,MS.TENMAU,SS.SOLUONG,SS.SL_DABAN FROM HINHANH HA JOIN MAUSAC MS ON MS.MAMAU=HA.MAMAU JOIN SOLUONG_SP SS ON SS.MAMAU=HA.MAMAU AND SS.MASP=HA.MASP WHERE HA.MASP=? GROUP BY HA.MASP,HA.MAMAU,MS.TENMAU,SS.SOLUONG,SS.SL_DABAN\r\n"
				+ "";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			while (rs.next()) {
				Color_main cl = new Color_main();
				cl.setId(rs.getString("MAMAU"));
				cl.setName(rs.getString("TENMAU"));
				cl.setQuantity(rs.getInt("SOLUONG"));
				cl.setQuantity_sale(rs.getInt("SL_DABAN"));
				String idColor = rs.getString("MAMAU");
				String query2 = "SELECT * FROM HINHANH HA JOIN MAUSAC MS ON MS.MAMAU=HA.MAMAU WHERE HA.MASP=? AND HA.MAMAU=? ";
				ResultSet rs2 = super.ExecuteQuery(query2, id, idColor);
				while (rs2.next()) {
					String type = rs2.getString(4).trim();
					if (type.equals("NEN")) {
						cl.setImgMain(rs2.getString(3));
					} else {
						cl.addImgSubs(rs2.getString(3));
					}
				}

				lstColor.add(cl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lstColor;
	}

	public Product_main getProduct_Form(String id) {
		ArrayList<Color_main> lstColor = (ArrayList<Color_main>) getColors_Product(id);
		Price_product_main price = getPrices_Product(id);
		StarEvaluate stars = new StarEvaluate();
		Product_main product = new Product_main();
		product.setID(id.trim());

		query = "SELECT * FROM dbo.GETPRODUCT_FORM(?)	";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			if (rs.next()) {
				product.setName(rs.getString("TENSP"));
				price.setPrice(Integer.parseInt(rs.getString("GIA")));
				if (rs.getString("GIA_KM") != null) {
					price.setPriceSales(Integer.parseInt(rs.getString("GIA_KM")));
				}
				product.setPrices(price);
				Color_main color = new Color_main();
				color.setImgMain(rs.getString("ANH"));
				lstColor.add(color);
				product.setColors(lstColor);
				query = "SELECT * FROM dbo.GETEVALUATE_AVG(?)	";
				ResultSet rs2 = super.ExecuteQuery(query, id);
				if (rs2.next()) {
					stars.setAvgStars(Double.parseDouble(rs2.getString("STB")));
					product.setEvaluate(stars);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return product;
	}

	public Product_main getProduct_main(String id) {
		Branch branch = getBranch_Product(id);
		ArrayList<Color_main> lstColor = (ArrayList<Color_main>) getColors_Product(id);
		Price_product_main price = getPrices_Product(id);
		ArrayList<Attribute> lstAtt = (ArrayList<Attribute>) getAttribute_Product(id);
		query = "SELECT * FROM SANPHAM WHERE MASP=?";
		Product_main product = new Product_main();
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			if (rs.next()) {
				product.setID(rs.getString("MASP").trim());
				product.setName(rs.getString("TENSP"));
				product.setType(rs.getString("LOAI_SP"));
				product.setStatus(rs.getString("TINHTRANG"));
				product.setUpdate_date(rs.getString("NGAYCAPNHAT"));
				product.setPosts(rs.getString("GIOITHIEU"));

				product.setView(rs.getInt("LUOTXEM"));
				product.setAttributes(lstAtt);
				product.setColors(lstColor);
				product.setBranch(branch);
				product.setPrices(price);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return product;
	}

	public List<Product_main> getAllProduct(int start, int end) {
		ArrayList<Product_main> arr = new ArrayList<Product_main>();
		String query = "SELECT * FROM  (SELECT ROW_NUMBER() OVER (ORDER BY masp ASC) AS STT ,* FROM  SANPHAM) AS X  WHERE STT BETWEEN ? AND ? ";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				Product_main p = getProduct_main(rs.getString("MASP"));
				arr.add(p);
			}
			return arr;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public int updateViewProduct(String id) {
		String query = "EXEC  INCREASE_VIEW @ID= ? ";
		int total = 0;
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public String getColorName(String ColorId) {
		String query = "select TENMAU from MAUSAC where MAMAU = ? ";
		String color = null;
		try (ResultSet rs = super.ExecuteQuery(query, ColorId)) {
			if (rs.next()) {
				color = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return color;
	}

	public String getURLthumbnail(String productId) {
		String query = "select ANH from HINHANH where MaSP = ? and LOAIANH = 'nen'  ";
		String url = null;
		try (ResultSet rs = super.ExecuteQuery(query, productId)) {
			if (rs.next()) {
				url = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

}
