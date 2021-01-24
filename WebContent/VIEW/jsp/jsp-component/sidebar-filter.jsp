<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-3" id="bar-side">
	<div class="filter-bar">
		<div class="filter-bar-frame">
			<div class="filter-bar-card">
				<div class="filter-bar-title">
					<h5>
						<fmt:message key="hdh-filter"></fmt:message>
					</h5>
				</div>
				<div class="filter-bar-select">
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="android" name="android" id="os_ios"> <label
							for=android>IOS </label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="ios" name="ios" id="os_android"> <label for=ios>Andriod
						</label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="ios" name="ios" id="os_other"> <label for=ios>
							<fmt:message key="hdhk-filter"></fmt:message>
						</label>
					</div>

				</div>
			</div>
			<div class="filter-bar-card">
				<div class="filter-bar-title">
					<h5>
						<fmt:message key="manhinh-filter"></fmt:message>
					</h5>
				</div>
				<div class="filter-bar-select">
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="5inch" name="5inch" id="size_0_5inch"> <label
							for=5inch><fmt:message key="manhinhnho-filter"></fmt:message></label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="5-6inch" name="5-6inch" id="size_5_6inch"> <label
							for=5-6inch><fmt:message key="manhinhvua-filter"></fmt:message>
						</label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="6inch" name="6inch" id="size_6_99inch"> <label
							for=6inch><fmt:message key="manhinhlon-filter"></fmt:message></label>
					</div>

				</div>
			</div>
			<div class="filter-bar-card">
				<div class="filter-bar-title">
					<h5><fmt:message key="bonho-filter"></fmt:message></h5>
				</div>
				<div class="filter-bar-select">
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox" value="8g"
							name="8g" id="rom_8GB"> <label for="8g"><fmt:message key="bonhobe8-filter"></fmt:message></label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="16-128g" name="16-128g" id="rom_16_128GB"> <label
							for="16-128g"><fmt:message key="bonho16to18-filter"></fmt:message> </label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="256g" name="256g" id="rom_256GB"> <label
							for="256g"><fmt:message key="bonho256-filter"></fmt:message></label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="512g" name="512g" id="rom_12GB"> <label for="512g"><fmt:message key="bonho512up-filter"></fmt:message> </label>
					</div>

				</div>
			</div>
			<div class="filter-bar-card">
				<div class="filter-bar-title">
					<h5><fmt:message key="ram-filter"></fmt:message></h5>
				</div>
				<div class="filter-bar-select">
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="r-4g-down" name="r-4g-down" id="ram_4GB"> <label
							for="r-4g-down"><fmt:message key="ramduoi4-filter"></fmt:message></label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="r-4g-6g" name="ram_4_6GB" id="r-4g-6g"> <label
							for="r-4g-6g"><fmt:message key="ram4to6-filter"></fmt:message> </label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="r-8g" name="r-8g" id="ram_8GB"> <label for="r-8g"><fmt:message key="ram8-filter"></fmt:message>
						</label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="r-12g-up" name="ram_12GB" id="r-12g-up"> <label
							for="r-12g-up"><fmt:message key="ram12-filter"></fmt:message></label>
					</div>

				</div>
			</div>
			<div class="filter-bar-card">
				<div class="filter-bar-title">
					<h5><fmt:message key="catruoc-filter"></fmt:message></h5>
				</div>
				<div class="filter-bar-select">
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="b-5mp-down" name="b-5mp-down" id="front_cam_5MP">
						<label for="b-5mp-down"><fmt:message key="catruocduoi5-filter"></fmt:message> </label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="b-5mp-12mp" name="b-5mp-12mp" id="front_cam_5_12MP">
						<label for="b-5mp-12mp"><fmt:message key="catruoc5to12-filter"></fmt:message> </label>
					</div>
					<div class="check-select">
						<input onchange="sendAllUserSelected()" type="checkbox"
							value="b-12mp-up" name="b-12mp-up" id="front_cam_12_99MP">
						<label for="b-12mp-up"><fmt:message key="catruoc12-filter"></fmt:message></label>
					</div>


				</div>
				<div class="filter-bar-card">
					<div class="filter-bar-title">
						<h5><fmt:message key="casau-filter"></fmt:message></h5>
					</div>
					<div class="filter-bar-select">
						<div class="check-select">
							<input onchange="sendAllUserSelected()" type="checkbox"
								value="a-5mp-down" name="a-5mp-down" id="rear_cam_5MP">
							<label for="a-5mp-down"><fmt:message key="casauduoi5-filter"></fmt:message> </label>
						</div>
						<div class="check-select">
							<input onchange="sendAllUserSelected()" type="checkbox"
								value="a-5mp-12mp" name="a-5mp-12mp" id="rear_cam_5_12MP">
							<label for="a-5mp-12mp"><fmt:message key="casau5to12-filter"></fmt:message> </label>
						</div>
						<div class="check-select">
							<input onchange="sendAllUserSelected()" type="checkbox"
								value="a-12mp-up" name="a-12mp-up" id="rear_cam_12_99MP">
							<label for="a-12mp-up"><fmt:message key="casau12-filter"></fmt:message></label>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
