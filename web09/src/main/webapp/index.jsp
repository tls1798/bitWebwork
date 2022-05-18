<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/mygrid.css">
	<style rel="stylesheet" type="text/css">
		#header {
				
		}
		
		#header h1 {
			height: 42px;
			background-image: url("imgs/logo.jpg"); 
			background-repeat: no-repeat;
			text-indent: -9999px;
		}

		#menu {
			text-align: center;
			background-color: gray;
		}

		#menu a {
			color: white;
			text-decoration: none;
			display: block;
			height: 35px;
			line-height: 30px;
		}

		#menu a:hover {
			border-bottom: 5px solid black;
			border-top: 5px solid black;
			box-sizing: border-box;
		}
		
		#bx {
			width: 800px;
			margin: 10px auto;
			position: relative;
		}
		
		#bx img {
			width: 800px;
		}
		
		#bx a {
			display: inline-block;
			position: absolute;
			top: 17px;
			height: 220px;
			width: 100px;
			background-color: black;
			opacity: 0.4;
			color: white;
			line-height: 200px;
			text-decoration: none;
			font-weight: bold;
			font-size: 100px;
			text-align: center;
		}
		
		#bx a:last-child {
			left: 700px;
		}
		
		#footer {
			padding-top: 100px;
			padding-left: 200px;
		}
		
		#list-group {
			width: 80%;
			margin: 0px auto;
			border-radius: 10px;
			border: 1px solid gray;
		}
		
		#list-group>* {
			padding: 20px;
		}
		
		#list-group>*:not(:last-child) {
			border-bottom: 1px solid gray;
		}
		
		#list-group>*:first-child {
			background-color: aqua;
			border-radius: 10px 10px 0px 0px;
		}
		
		#list-group>*:last-child {
			border-radius: 0px 0px 10px 10px;
		}
		
		#popup {
			position: absolute;
			left: 0px;
			top: 0px;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.5);
		}
		
		#popup>div {
			background-color: white;
			width: 400px;
			height: 400px;
			margin: 100px auto;
			padding: 50px;
			box-sizing: border-box;
			border-radius: 20px;
		}
		
		#popup>div>form {
			
		}
		
		#popup>div>form>div {
			margin-bottom: 10px;
			text-align: center;
		}
		
		#popup>div>form>div>label {
			display: inline-block;
			width: 40%;
			background-color: darkgray;
		}
		
		#popup>div>form>div>input {
			width: 50%;
		}
		
		#popup>div>form>div>button {
			
		}
		#popup>div>.err{
			background-color: red;
			color: white;
			text-align: center;
			font-style: italic;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			// 이벤트 callback
			var delEvent=function(e){
				e.preventDefault();
				delOne($(e.target).parent().parent().find('[type=number]').val());
			};
			
			var addEvent=function(e){
				var param=$(e.target).serialize();
				addList(param);
				return false;
			};
			
			var editEvent=function(e){
				var param=$(e.target).serialize();
				editOne(param);
				$(e.target).off('submit',editEvent).on('submit',detailEvent);
				return false;
			};
			
			var detailEvent=function(e){
				$(e.target).prev().text('수정페이지');
				$(e.target).find('button').eq(1).text('취소').off('click',delEvent);
				$(e.target).find('input').each(function(idx,ele){
					if(idx!=0) $(ele).removeProp('readonly');
				});
				$(e.target).off('submit',detailEvent).on('submit',editEvent);
				return false;
			}
			
			var menu1Click = function() {
				$('#content>.row').hide().eq(0).show();
				return false;
			};
			
			var menu2Click = function() {
				$('#content>.row').hide().eq(1).show();
				return false;
			};
			
			var menu3Click = function() {
				$('#content>.row').hide().eq(2).show();
				getList();
				return false;
			};
			
			//ajax
			var delOne=function(param){
				$.post('bbs/delete.jsp','empno='+param,function(){
					$('#menu a').eq(2).click();
					$('#popup').click();
				})
			}
			var editOne=function(param){
				$.ajax({
					type:'post',
					url:'bbs/update.jsp',
					data:param,
					error:function(a,b,c){
						console.log(b,c);
					},
					success:function(data){
						$('#menu a').eq(2).click();
						$('#popup').click();
					}
				});
			}
			
			var getOne = function(empno){				
				$('#popup').find('h2').text('상세페이지');
				$('#popup')
					.find('button')
						.first().text('수정')
						.next().text('삭제').on('click',delEvent);				
				$('#popup').find('input').prop('readonly',true);
				$.getJSON('bbs/detail.jsp','empno='+empno,function(data){					
					$('#popup').find('input').eq(0).val(data.root[0].empno);
					$('#popup').find('input').eq(1).val(data.root[0].ename);
					$('#popup').find('input').eq(2).val(data.root[0].sal);
				});
				$('#popup form').off('submit',addEvent);
				$('#popup form').on('submit',detailEvent);
				$('#popup').show();
			};
			
			var getList = function() {
				$('#list-group').html('<div><span>ename</span></div>');
				$.getJSON('bbs/list.jsp', function(data) {
					data.root.forEach(function(ele, idx) {
						var alink=$('<a/>').text(ele.ename).attr('href', '#');
						alink.click(function(){
							getOne(ele.empno);
							return false;
						});
						$('<div/>')
							.append(alink)
							.appendTo('#list-group');
					});
				});
			};
			
			var addList=function(param){
				$.post('bbs/insert.jsp',param,function(){
					$('#menu a').eq(2).click();
					$('#popup').click();
				});

				$.ajax({
					url:'bbs/insert.jsp',
					data:param,
					type:'post',
					error:function(xhr,a,b){
						$('#popup h2').before('<div class="err">에러발생('+b+')</div>');
					},
					success:function(){
						$('#menu a').eq(2).click();
						$('#popup').click();
					}
				});
			};
			
			// 이벤트 등록
			$('#menu a')
				.first().click(menu1Click)
				.end().eq(1).click(menu2Click)
				.end().eq(2).click(menu3Click);

			$('#popup>div').click(function(e) {
				e.stopPropagation();
			});
			
			$('#popup').add('#popup form button:eq(2)').click(function() {
				$('#popup form input').val('');
				$('#popup .err').remove();
				$('#popup').find('h2').text('입력페이지');
				$('#popup')
					.find('button')
						.first().text('입력')
						.next().text('취소').off('click',delEvent);			
				$('#popup').find('input').removeProp('readonly');
				$('#popup form').off('submit',detailEvent).on('submit',addEvent);				
				$('#popup').hide();
			});

			$('#p3>a').click(function() {
				$('#popup').show();
				return false;
			});
			
			$('#popup form').on('submit',addEvent);
			
			// init
			$('#popup').hide();
			
			$('#bx>ul').bxSlider({
				slideWidth : 800,
				minSlides : 1,
				maxSlides : 1,
				moveSlides : 1,
				auto : true,
				pager : false,
				nextText : '>',
				prevText : '<'
			});
			
			$('#menu a').first().click();
			
		});
</script>
</head>
<body>
	<div class="container">
		<div id="header" class="row">
			<div class="grid12">
				<h1>비트교육센터</h1>
			</div>
		</div>
		<div id="menu" class="row">
			<div class="grid2">&nbsp;</div>
			<div class="grid2">
				<a href="#">HOME</a>
			</div>
			<div class="grid2">
				<a href="#">INTRO</a>
			</div>
			<div class="grid2">
				<a href="#">BBS</a>
			</div>
			<div class="grid2">
				<a href="#">LOGIN</a>
			</div>
			<div class="grid2">&nbsp;</div>
		</div>
		<div id="content">
			<div id="p1" class="row">
				<div id="bx">
					<ul>
						<li><img
							src="https://www.bitacademy.com/img/main_bn_0503.png" /></li>
						<li><img
							src="https://www.bitacademy.com/img/main_bn_0414_1.png" /></li>
						<li><img
							src="https://www.bitacademy.com/img/main_bn_0414_2.png" /></li>
						<li><img
							src="https://www.bitacademy.com/img/main_bn_0414_3.png" /></li>
					</ul>
				</div>
			</div>

			<div id="p2" class="row">
				<dl>


					<dt>대통령이 궐위된 때</dt>
					<dd>모든 국민은 소급입법에 의하여 참정권의 제한을 받거나 재산권을 박탈당하지 아니한다. 국가는
						사회보장·사회복지의 증진에 노력할 의무를 진다. 국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이 아닌 한 국회의
						요구가 있으면 회기중 석방된다.</dd>


					<dt>대한민국은 국제평화</dt>
					<dd>국회의원과 정부는 법률안을 제출할 수 있다. 모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한
						재판을 받을 권리를 가진다. 국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나
						의견을 진술하고 질문에 응답할 수 있다.</dd>


					<dt>제2항과 제3항의 처분</dt>
					<dd>형사피해자는 법률이 정하는 바에 의하여 당해 사건의 재판절차에서 진술할 수 있다. 헌법재판소 재판관의
						임기는 6년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다.</dd>


					<dt>군인 또는 군무원이</dt>
					<dd>군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다. 헌법개정안이 제2항의 찬성을 얻은 때에는
						헌법개정은 확정되며, 대통령은 즉시 이를 공포하여야 한다.</dd>


				</dl>
			</div>
			<div id="p3" class="row">
				<h2>리스트</h2>
				<a href="#">입력</a>
				<div id="list-group">
					<div>
						<span>ename</span>
					</div>
				</div>
			</div>
		</div>

		<div id="footer" class="row">
			<address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
			&copy; bitacademy co.ltd. All rights reserved.
		</div>
	</div>

	<div id="popup">
		<div>
			<h2>입력 페이지</h2>
			<form action="#" method="POST">
				<div>
					<label for="empno">empno</label> <input type="number" name="empno"
						id="empno" />
				</div>
				<div>
					<label for="ename">ename</label> <input type="text" name="ename"
						id="ename" />
				</div>
				<div>
					<label for="sal">sal</label> <input type="text" name="sal" id="sal" />
				</div>
				<div>
					<button>입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>

			</form>
		</div>
	</div>
</body>
</html>