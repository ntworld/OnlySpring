<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${owner.username }</title>
</head>
<body class="blogLayout">
	<c:if test="${owner.userid eq member.userid }">
		<%@ include file="updatePic.jsp"%>
	</c:if>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div class="header_hidden"></div>

	<div id="globalContainer">
		<div id="mainContainer">
			<div id="leftCol"></div>
			<div id="contentCol">
				<jsp:include page="blogHeader.jsp"></jsp:include>
				<!-- 타임라인 -->
				<div class="blogTimelineCapsule">

					<div class="blogTimelineContent" id="recent_capsule_container">
						<ol class="post_view_box">
							<li class="type_choice_box" id="infinite_container">
								<form action="/only/postWrite" method="post"
									enctype="multipart/form-data">
									<input type="hidden" value="<%=userid%>" name="userid">
									<input type="hidden"
										value="<%=application.getRealPath("/fileSave")%>" name="path">
									<c:if test="${owner.userid eq member.userid }">
										<textarea rows="1" cols="1" class="type_choice_textarea"
											name="text"
											placeholder="What's on your mind , ${member.username }?"></textarea>
									</c:if>

									<c:if test="${owner.userid ne member.userid }">
										<textarea rows="1" cols="1" class="type_choice_textarea"
											name="text"
											placeholder="Write Someting to , ${owner.username }?"></textarea>

									</c:if>
									<!-- 지도 -->
									<div id="google_place_view"></div>
									<input type="hidden" name="place" id="place" value=''>
									<input type="hidden" name="lat" id="lat" value=0> <input
										type="hidden" name="lng" id="lng" value=0>
									<div id='google_view'>
										<input id='pac-input' style='display: none;' type='text'
											placeholder='Search Box'> <input type="button"
											id="google_button" style='display: none;' value="확인">
										<div id='map'
											style='width: 100%; height: 200px; display: none;'></div>
									</div>
									<div class="tagInput" id="friendTag">
										<table id='addFriend' style='display: none;'>
											<tr style="border-color: #adbed8;">
												<td class="withWho">With</td>
												<td><div id="selectedfriends" class="friendTagListSpan">
														<span><input onkeyup="runSearch(event)"
															id="friendTagInput" placeholder='Who are you with?'>
														</span>
													</div></td>
											</tr>
										</table>
									</div>
									<div class="bloc" style="display: none;">
										<select id="friendTagList"></select>
									</div>
									<div class="write_type_choice">
										<a class="choice_type" id="preview"></a> <a
											class="choice_type"> <br> <img alt=""
											src="${path }/img_timeline/picture.svg"
											class="img_hide img_hidden type_photo" width="30px"
											border='0' onclick='document.all.files.click();'> <input
											type="file" name="files" style='display: none;'
											id="input_img" accept="image/*, video/*"
											onchange="previewFiles()" multiple>
										</a> <a class="choice_type"><img alt=""
											src="${path }/img_timeline/location.svg"
											class="img_hide img_hidden type_photo" width="30px"
											border='0' id="google"> <input type="button"
											name="google" style='display: none;' id="google"
											onclick="google()"> </a> <a class="choice_type"
											id="friendTagBtn"><img alt=""
											src="${path }/img_timeline/friendTag.png	"
											class="img_hide img_hidden type_photo" width="25px"
											border='0'> <input type="button" name="google"
											style='display: none;' id="google" onclick="google()">
										</a>
										<!-- <label class="img_hide img_hidden"><br>해시태그</label><input
									class="img_hide img_hidden" type="text" name="hashtag"><br>
								<label class="img_hide img_hidden">회원태그</label><input
									class="img_hide img_hidden" type="text" name="membertag"><br> -->
									</div>
									<button type="submit" class="post_submit_btn">작성</button>
								</form>
							</li>
							<!-- 타입 선택 후 끝 -->
						</ol>
						<div id="postList"></div>
					</div>
					<div class="blogTimelineMenu">
						<!-- 사진 타일 -->
						<div
							style="bottom: 0px; left: 54px; top: auto; z-index: 0; width: 323px;">
							<span display="inline">
								<ol class="blogMenuList">
									<div id="photos_tile">
										<li class="photos_tile_col">
											<div style="border-radius: 3px; background-color: #ffffff">
												<div class="tile_title_wraper">
													<a href="/only/blog/${owner.userid }/photos"><span
														style="font-size: 16px; line-height: 20px;">Photo</span></a>
												</div>
												<div style="padding: 0 5px 4px 5px;">
													<table>
														<tr>
															<c:forEach var="photo" items="${photoList }" begin="0"
																end="5" varStatus="status">
																<td>
																<div style="width: 101px; height: 101px;">
																	<img src="${path }/img_timeline/${photo}"
																			style="width: 100px; height: 100px;">
																	</div> <c:if test="${status.count %3 ==0 }">
														</tr>
														<tr>
															</c:if>
															</c:forEach>
														</tr>
													</table>
												</div>
											</div>
										</li>
									</div>
									<div id="friends_tile"></div>
								</ol>
							</span>
						</div>
						<!-- 친구 타일 -->
						<div
							style="bottom: 0px; left: 54px; top: auto; z-index: 0; width: 323px;">
							<span display="inline">
								<ol class="blogMenuList">
									<div id="photos_tile">
										<li class="photos_tile_col">
											<div style="border-radius: 3px; background-color: #ffffff">
												<div class="tile_title_wraper">
													<a href="/only/blog/${owner.userid }/friendList"><span
														style="font-size: 16px; line-height: 20px;">Friends</span></a>
												</div>
												<div style="padding: 0 5px 4px 5px;">
													<table>
														<tr>
															<c:forEach var="friend" items="${friendList }" begin="0"
																end="8" varStatus="status">
																<td>
																	<div style="width: 101px; height: 101px;">
																		<div style="position: relative; text-align: center; width: 100%; height: 100%;">
																			<a href="${path }/blog/${friend.userid }/friendList">
																			<img
																				src="${path }/img_timeline/${friend.profile_image}"
																				style="width: 100px; height: 100px;">
																				<div style="position: absolute; background: linear-gradient(transparent, rgba(0, 0, 0, .7)); bottom: 0; color: #fff;  left: 0; padding: 5px; right: 0;">
																				${friend.username }</div>
																		</a>
																		</div>
																	</div> <c:if test="${status.count %3 ==0 }">
														</tr>
														<tr>
															</c:if>
															</c:forEach>
														</tr>
													</table>
												</div>
											</div>
										</li>
									</div>
									<div id="friends_tile"></div>
								</ol>
							</span>
						</div>
					</div>
				</div>
				<!-- 친구 리스트 -->
				<div class="blogFriendList" style="display: node;"></div>
			</div>
		</div>
	</div>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1aRB-FJzz3Vtd6iiZdlCCk1DCfDxWDko&libraries=places&&callback=initAutocomplete1"
		async defer></script>
</body>
</html>