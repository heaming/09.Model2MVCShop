<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>Model2 MVC Shop</title>

	<link href="/css/left.css" rel="stylesheet" type="text/css">
	
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		function history(){
			popWin = window.open("/history.jsp",
														"popWin",
														"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	
		//==> jQuery 적용 추가된 부분
		 $(function() {
			 
			//==> 개인정보조회 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('개인정보조회')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('개인정보조회')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			
			
			//==> 회원정보조회 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('회원정보조회')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('회원정보조회')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			}); 
		});	
		 
	</script>
	
</head>
<body background="/images/left/imgLeftBg.gif" leftmargin="0"
	topmargin="0" marginwidth="0" marginheight="0">

	<table width="159" border="0" cellspacing="0" cellpadding="0">

		<!--menu 01 line-->
		<tr>
			<td valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width="159">
					<tr>
						<c:if test="${ !empty user }">
							<tr>
								<td class="Depth03">
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
							<a href="/getUser.do?userId=${user.userId}" target="rightFrame">개인정보조회</a>
							////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<a href="/user/getUser?userId=${user.userId}"
									target="rightFrame">개인정보조회</a>
								</td>
							</tr>
						</c:if>

						<c:if test="${user.role == 'admin'}">
							<tr>
								<td class="Depth03">
									<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
							<a href="/listUser.do" target="rightFrame">회원정보조회</a>
							////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
									<a href="/user/listUser" target="rightFrame">회원정보조회</a>
								</td>
							</tr>
						</c:if>
					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>

		<!--menu 02 line-->
		<c:if test="${user.role == 'admin'}">
			<tr>
				<td valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width="159">
						<tr>
							<td class="Depth03"><a href="/product/addProduct"
								target="rightFrame">판매상품등록</a></td>
						</tr>
						<tr>
							<td class="Depth03"><a
								href="/product/listProduct?menu=manage" target="rightFrame">판매상품관리</a>
							</td>
						</tr>
						<tr>
							<td class="Depth03"><a href="/purchase/listSale?menu=manage"
								target="rightFrame">판매내역관리</a></td>
						</tr>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</c:if>

		<!--menu 03 line-->
		<tr>
			<td valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width="159">
					<tr>
						<td class="Depth03"><a href="/product/listProduct?menu=search"
							target="rightFrame">상 품 검 색</a></td>
					</tr>

					<c:if test="${ !empty user && user.role == 'user'}">
						<tr>
							<td class="Depth03"><a href="/product/addProduct?menu=manage"
								target="rightFrame">판매상품등록</a></td>
						</tr>

						<tr>
							<td class="Depth03"><a href="/purchase/listPurchase?menu=search"
								target="rightFrame">내가 산 물건</a></td>
						</tr>
						<tr>
							<td class="Depth03"><a href="/purchase/listSale?menu=search"
								target="rightFrame">내가 판 물건</a></td>
						</tr>
					</c:if>

					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
					<tr>
						<td class="Depth03"><a href="javascript:history()">최근 본
								상품</a></td>
					</tr>
				</table>
			</td>
		</tr>

	</table>

</body>

</html>