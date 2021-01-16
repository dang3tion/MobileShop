package controller_AJAX;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

import model_DAO.DAO_Branch;
import model_beans.Branch;

@WebServlet("/AJAXFilterSortHandling")
public class AJAXFilterSortHandling extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String currentURL = request.getParameter("currentURL");
		String thanhNgang = request.getParameter("dataFilterSidebar");
		String thanhLocDung = request.getParameter("jsonDataSortNavigationbar");
		String branchName = getCurrentBranch(currentURL);
		String keyWord = request.getParameter("searchKeyWork");
		String khoanggia = getKhoangGia(currentURL);

		Gson gson = new Gson();
		Filter gsonThanhLocDung = gson.fromJson(thanhLocDung, Filter.class);
		FilterDung gsonLocNgang = gson.fromJson(thanhNgang, FilterDung.class);

		String test = "từ khóa "+keyWord + "\n hiệu :" + branchName + "\n giá :" + khoanggia + "\n" + thanhNgang + "\n" + thanhLocDung;
		request.setAttribute("TESTING", test);
		System.out.println(test);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/card-product-result.jsp");
		dispatcher.forward(request, response);

	}

	public class Filter {
		@SerializedName("sort_lasted_update") // SerializedName giống với Key của Json
		public String sort_lasted_update;
		@SerializedName("sort_new_to_old")
		public String sort_new_to_old;
		@SerializedName("sort_old_to_new")
		public String sort_old_to_new;
		@SerializedName("sort_a_z")
		public String sort_a_z;
		@SerializedName("sort_z_a")
		public String sort_z_a;
		@SerializedName("sort_most_view")
		public String sort_most_view;
		@SerializedName("sort_most_vote")
		public String sort_most_vote;

	}

	public class FilterDung {

		@SerializedName("os_ios")
		public String os_ios;
		@SerializedName("os_android")
		public String os_android;
		@SerializedName("os_other")
		public String os_other;
		@SerializedName("size_0_5inch")
		public String size_0_5inch;
		@SerializedName("size_5_6inch")
		public String size_5_6inch;
		@SerializedName("size_6_99inch")
		public String size_6_99inch;
		@SerializedName("rom_8GB")
		public String rom_8GB;
		@SerializedName("rom_16_128GB")
		public String rom_16_128GB;
		@SerializedName("rom_256GB")
		public String rom_256GB;
		@SerializedName("rom_12GB")
		public String rom_12GB;
		@SerializedName("ram_4GB")
		public String ram_4GB;
		@SerializedName("ram_4_6GB")
		public String ram_4_6GB;
		@SerializedName("ram_8GB")
		public String ram_8GB;
		@SerializedName("ram_12GB")
		public String ram_12GB;
		@SerializedName("front_cam_5MP")
		public String front_cam_5MP;
		@SerializedName("front_cam_5_12MP")
		public String front_cam_5_12MP;
		@SerializedName("front_cam_12_99MP ")
		public String front_cam_12_99MP;
		@SerializedName("rear_cam_5MP ")
		public String rear_cam_5MP;
		@SerializedName("rear_cam_5_12MP")
		public String rear_cam_5_12MP;
		@SerializedName("rear_cam_12_99MP")
		public String rear_cam_12_99MP;

	}

	private static String getCurrentBranch(String url) {
		String branchName = "";
		if (url != null) {
			for (Branch branch : DAO_Branch.getDAO_Branch().getAllBranch()) {
				if (url.contains(branch.getName())) {
					return branch.getName();
				}
			}
		}
		return branchName;
	}

	private static String getKhoangGia(String url) {
		ArrayList<String> arr = new ArrayList<String>();
		arr.add("duoi-1-trieu");
		arr.add("tu-1-den-2-trieu");
		arr.add("tu-2-den-3-trieu");
		arr.add("tu-3-den-5-trieu");
		arr.add("tu-5-den-7-trieu");
		arr.add("tu-7-den-9-trieu");
		arr.add("tu-9-den-12-trieu");
		arr.add("tu-12-den-15-trieu");
		arr.add("tren-15-trieu");
		String khoangGia = "";
		if (url != null) {
			for (String str : arr) {
				if ("a".contains(str)) {
					return str;
				}
			}
		}
		return khoangGia;

	}

}
