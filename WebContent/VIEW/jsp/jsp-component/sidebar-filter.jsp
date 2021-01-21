<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
	<div class="col-3" id="bar-side">
				<div class="filter-bar">
					<div class="filter-bar-frame">
						<div class="filter-bar-card">
							<div class="filter-bar-title">
								<h5>Hệ điều hành</h5>
							</div>
							<div class="filter-bar-select">
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="android" name="android"
										id="os_ios"> <label for=android>IOS </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="ios" name="ios" id="os_android">
									<label for=ios>Andriod </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="ios" name="ios" id="os_other">
									<label for=ios>Hệ điều hành khác </label>
								</div>

							</div>
						</div>
						<div class="filter-bar-card">
							<div class="filter-bar-title">
								<h5>Kích cỡ màn hình</h5>
							</div>
							<div class="filter-bar-select">
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="5inch" name="5inch" id="size_0_5inch">
									<label for=5inch>Màn hình nhỏ (Dưới 5 INCH)</label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="5-6inch" name="5-6inch"
										id="size_5_6inch"> <label for=5-6inch>Vừa tay (5
										INCH đến 6 INCH) </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="6inch" name="6inch" id="size_6_99inch">
									<label for=6inch>Trên 6 INCH </label>
								</div>

							</div>
						</div>
						<div class="filter-bar-card">
							<div class="filter-bar-title">
								<h5>Bộ nhớ trong</h5>
							</div>
							<div class="filter-bar-select">
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="8g" name="8g" id="rom_8GB"> <label
										for="8g">Nhỏ hơn 8GB </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="16-128g" name="16-128g"
										id="rom_16_128GB"> <label for="16-128g">16GB đến
										128GB </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="256g" name="256g" id="rom_256GB">
									<label for="256g">256GB</label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="512g" name="512g" id="rom_12GB">
									<label for="512g">512GB trở lên </label>
								</div>

							</div>
						</div>
						<div class="filter-bar-card">
							<div class="filter-bar-title">
								<h5>Dung lượng RAM</h5>
							</div>
							<div class="filter-bar-select">
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="r-4g-down" name="r-4g-down"
										id="ram_4GB"> <label for="r-4g-down">Dưới
										4GB </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="r-4g-6g" name="ram_4_6GB"
										id="r-4g-6g"> <label for="r-4g-6g">4GB đến 6GB
									</label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="r-8g" name="r-8g" id="ram_8GB">
									<label for="r-8g">8GB </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="r-12g-up" name="ram_12GB"
										id="r-12g-up"> <label for="r-12g-up">12GB trở
										lên </label>
								</div>

							</div>
						</div>
						<div class="filter-bar-card">
							<div class="filter-bar-title">
								<h5>Camera trước</h5>
							</div>
							<div class="filter-bar-select">
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="b-5mp-down" name="b-5mp-down"
										id="front_cam_5MP"> <label for="b-5mp-down">Dưới
										5 MP </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="b-5mp-12mp" name="b-5mp-12mp"
										id="front_cam_5_12MP"> <label for="b-5mp-12mp">5 MP
										đến 12 MP </label>
								</div>
								<div class="check-select">
									<input onchange="sendAllUserSelected()" type="checkbox" value="b-12mp-up" name="b-12mp-up"
										id="front_cam_12_99MP"> <label for="b-12mp-up">Trên 12
										MP</label>
								</div>


							</div>
							<div class="filter-bar-card">
								<div class="filter-bar-title">
									<h5>Camera sau</h5>
								</div>
								<div class="filter-bar-select">
									<div class="check-select">
										<input onchange="sendAllUserSelected()" type="checkbox" value="a-5mp-down" name="a-5mp-down"
											id="rear_cam_5MP"> <label for="a-5mp-down">Dưới
											5 MP </label>
									</div>
									<div class="check-select">
										<input onchange="sendAllUserSelected()" type="checkbox" value="a-5mp-12mp" name="a-5mp-12mp"
											id="rear_cam_5_12MP"> <label for="a-5mp-12mp">5 MP
											đến 12 MP </label>
									</div>
									<div class="check-select">
										<input onchange="sendAllUserSelected()" type="checkbox" value="a-12mp-up" name="a-12mp-up"
											id="rear_cam_12_99MP"> <label for="a-12mp-up">Trên
											12 MP</label>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		