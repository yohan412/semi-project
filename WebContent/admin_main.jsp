<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#body {
	display:flex;
}
#side_menu, #empty_space{
	width:10%;
}

* {
	list-style: none;
}
ul,li{
	padding-inline-start:0px;
}
#admin_menu {
	display: inline-block;
	position: absolute;
	top:300px;
	background: rgb(00, 68, 137);
	color: white;
}

.acc-menu a {
	text-decoration: none;
	color: white;
	font-weight: bold;
}

#wrap {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

#accordionMenu1 {
	margin: 0;
	width: 150px;
	text-align:center;
}

.acc-menu {
	position: relative;
	list-style: none;
	border: 4px solid #eee;
}

.acc-menu>li {
	overflow: hidden;
	border: 1px solid #000;
	cursor: pointer;
}

.acc-menu li .main-title {
	background-color: black;
	vertical-align: middle;
	position: relative;
	z-index: 100;
}

.acc-menu li .main-title a {
	display: inline-block;
	height: 20px;
	line-height: 20px;
	text-align: center;
	vertical-align: middle;
}

.acc-menu li ul.sub {
	list-style: none;
	z-index: 90;
	position: relative;
}

.acc-menu li ul.sub.open {
	display: block;
}

.acc-menu li ul.sub.hide {
	display: none;
}

.acc-menu li ul.sub li {
	height: 20px;
	line-height: 20px;
	vertical-align: middle;
	cursor: pointer;
}

.acc-menu li ul.sub li.select {
	background-color: #bddeea;
}
.acc-menu li ul.sub li.select a{
	color:black;
}
td a{
 text-decoration:none;
 color:black;
 font-weight:bold;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 인스턴스 생성
		var accordion = new AccordionMenu('.acc-menu');
		accordion.selectMenu(0, 0, true);

		// 애니메이션 타입으로 0번째 메뉴 열기
		// accordion.openSubMenuAt(0, true);

		// 즉시 2번째 메뉴 닫기
		// accordion.closeSubMenuAt(2, false);

		accordion.$accordionMenu.on('open', function(e) {
			console.log('open', e.$target.find('.main-title a').text());
		});

		accordion.$accordionMenu.on('close', function(e) {
			console.log('close', e.$target.find('.main-title a').text());
		});

		accordion.$accordionMenu.on('selected', function(e) {
			var oldText = '없음';

			if (e.$oldItem) {
				oldText = e.$oldItem.text();
			}
			console.log('select old = ', oldText + ', new = '
					+ e.$newItem.text());
		});

	});

	function AccordionMenu(selector) {
		// 프로퍼티 생성 및 초기화
		this.$accordionMenu = null; // 메뉴 랩퍼를 담을 변수
		this.$mainMenuItems = null; // 메인 메뉴아이템을 담을 변수
		this.$selectSubItem = null; // 선택할 서브 메뉴아이템을 담을 변수

		this.init(selector);
		this.initSubMenuPanel();
		this._initEvent();
	}

	AccordionMenu.prototype = {
		// 요소 초기화
		'init' : function(selector) {
			this.$accordionMenu = $(selector);
			this.$mainMenuItems = this.$accordionMenu.children('li');

		},

		// 서브 패널 초기화 - 초기 시작시 닫힌 상태로 만들기
		'initSubMenuPanel' : function() {
			var _self = this;
			this.$mainMenuItems.each(function(index) {
				var $item = $(this), $subMenu = $item.find('.sub');

				// 서브 메뉴가 없는 경우
				if (!$subMenu.length) {
					$item.attr('data-extension', 'empty');
				} else {
					if ($item.attr('data-extension') == 'open') {
						_self.openSbuMenu($item);
					} else {
						if ($item.attr('data-extension') == 'open') {
							_self.openSbuMenu('$item', false);
						} else {
							_self.closeSubMenu($item, false);
						}
					}
				}

			});
		},

		// 아이콘 상태 설정
		'setIconState' : function($item, state) {
			var $folder = $item.find('.main-title .folder');
			// 기존 클래스를 모두 제거
			$folder.removeClass();
			$folder.addClass('folder ' + state);
		},

		// 이벤트 초기화
		'_initEvent' : function() {
			var _self = this, $mainTitle = this.$mainMenuItems
					.find('.main-title'), $subPanelItem = this.$mainMenuItems
					.find('.sub li');

			$mainTitle.on('click', function(e) {
				var $item = $(this).parent();
				_self._toggleSubMenuPanel($item);
			});

			$subPanelItem.on('click', function(e) {
				var $this = $(this);
				_self.selectSubMenuItem($this)
			});

		},

		// 서브 메뉴패널 열기 - animation 기본값은 true
		'openSbuMenu' : function($item, animation) {
			if ($item != null) {
				$item.attr('data-extension', 'open');
				var $subMenu = $item.find('.sub');

				if (!animation) {
					$subMenu.css({
						'margin-top' : 0
					});
				} else {
					$subMenu.stop().animate({
						'margin-top' : 0
					}, 300);
				}

				// 아이콘 상태를 open(-) 상태로 만들기
				this.setIconState($item, 'open');

				// 사용자 정의 open 이벤트 발생
				this.dispatchEvent($item, 'open');

			}
		},

		// 서브 메뉴패널 닫기
		'closeSubMenu' : function($item, animation) {
			if ($item != null) {
				$item.attr('data-extension', 'close');
				var $subMenu = $item.find('.sub'), subMenuPanelHeight = -$subMenu
						.outerHeight(true);

				if (!animation) {
					$subMenu.css({
						'margin-top' : subMenuPanelHeight
					});
				} else {
					$subMenu.stop().animate({
						'margin-top' : subMenuPanelHeight
					}, 300);
				}

				// 아이콘 상태를 close(+) 상태로 만들기
				this.setIconState($item, 'close');

				// 사용자 정의 close 이벤트 발생
				this.dispatchEvent($item, 'close');

			}
		},

		// 서브 메뉴패널 열고 닫기
		'_toggleSubMenuPanel' : function($item) {
			var extension = $item.attr('data-extension');

			// 서브 메뉴패널이 없는 경우 실행하지 않는다.
			if (extension == 'empty') {
				return;
			}

			// 서브 메뉴 패널이 있는 경우에 실행
			if (extension == 'open') {
				this.closeSubMenu($item, true);
			} else {
				this.openSbuMenu($item, true);
			}
		},

		// 인덱스 메뉴의 서브 메뉴패널 열기
		'openSubMenuAt' : function(index, animation) {
			var $item = this.$mainMenuItems.eq(index);
			this.openSbuMenu($item, animation);
		},

		// 인덱스 메뉴의 서브 매뉴패널 닫기
		'closeSubMenuAt' : function(index, animation) {
			var $item = this.$mainMenuItems.eq(index);
			this.closeSubMenu($item, animation);
		},

		// 서브 메뉴아이템 선택
		'selectSubMenuItem' : function($item) {
			var $oldItem = this.$selectSubItem;
			if (this.$selectSubItem != null) {
				this.$selectSubItem.removeClass('select');
			}
			this.$selectSubItem = $item;
			this.$selectSubItem.addClass('select');

			// 사용자 정의 select 이벤트 발생
			this._dispatchSelectEvent($oldItem, this.$selectSubItem);
		},

		// 인덱스를 활용한 메인 메뉴아이템과 서브 메뉴아이템 선택 기능
		'selectMenu' : function(mainIndex, subIndex, animation) {
			// 메인 메뉴아이템
			var $item = this.$mainMenuItems.eq(mainIndex);

			// 서브 메뉴아이템
			var $subMenuItem = $item.find('.sub li').eq(subIndex);
			// 서브 메뉴아이템이 존재하는 경우에만 처리
			if ($subMenuItem) {
				// 서브 메뉴패널 열기
				this.openSbuMenu($item, animation);
				// 서브 메뉴아이템 선택
				this.selectSubMenuItem($subMenuItem);
			}
		},

		// 사용자 정의 open, close 이벤트 발생 처리
		'dispatchEvent' : function($item, eventName) {
			var customEvent = jQuery.Event(eventName);
			customEvent.$target = $item;

			this.$accordionMenu.trigger(customEvent);
		},

		// 사용자 정의 select 이벤트 발생 처리
		'_dispatchSelectEvent' : function($oldItem, $newItem) {
			var customEvent = jQuery.Event('selected');
			customEvent.$oldItem = $oldItem;
			customEvent.$newItem = $newItem;

			this.$accordionMenu.trigger(customEvent);
		}

	};
	function center_list(){
		
		var centerList = new Array();
		
		var centerObj = function(no,name,writer,reg){
			this.no=no;
			this.name=name;
			this.writer=writer;
			this.reg=reg;
		}
		$("#wrap h1").html("센터 게시판");
		$.ajax({
			url:"CenterController?command=centerlist_ajax",
			dataType:"json",
			success:function(data){
				for(var i = 0 ; i <data.length;i++){
					var tmpObj = new centerObj(data[i].no,data[i].name,data[i].writer,data[i].reg);
					centerList.push(tmpObj);
				}
				make_centertable(centerList);
			},
			error:function(){
				alert("실패");
			}
		});
	}
	function used_list(){
		
		var usedList = new Array();
		
		var usedObj = function(no,name,writer,reg){
			this.no=no;
			this.name=name;
			this.writer=writer;
			this.reg=reg;
		}
		$("#wrap h1").html("센터 게시판");
		$.ajax({
			url:"usedcontroller?command=usedlist_ajax",
			dataType:"json",
			success:function(data){
				for(var i = 0 ; i <data.length;i++){
					var tmpObj = new usedObj(data[i].no,data[i].name,data[i].writer,data[i].reg);
					usedList.push(tmpObj);
				}
				make_usedtable(centerList);
			},
			error:function(){
				alert("실패");
			}
		});
	}
	function make_centertable(list){
		$("#table_data").empty();
		
		$("#table_data").append(
				"<form>"
				+"<table style='margin-left: auto; margin-right: auto;' border='1'>"
				+"<thead>"
				+"<col width='20px'><col width='400px'><col width='100px'><col width='100px'>"
				+"<tr><th>No</th><th>게시글 이름</th><th>작성자</th><th>작성일</th></tr>"
				+"</thead><tbody></tbody></table></form>"
		);
		for(var i = 0 ; i<list.length;i++){
			$("tbody").append(
				"<tr>"
				+"<td>"+list[i].no+"</td>"+"<td><a href='CenterController?command=centerdetail&centerno="+list[i].no+"'>"+list[i].name+"</a></td>"+"<td>"+list[i].writer+"</td>"+"<td>"+list[i].reg+"</td>"
				+"</tr>"
			);
		}
	}
	function make_usedtable(list){
		$("#table_data").empty();
		$("#table_data").append(
				"<form>"
				+"<table style='margin-left: auto; margin-right: auto;' border='1'>"
				+"<thead>"
				+"<col width='20px'><col width='400px'><col width='100px'><col width='100px'>"
				+"<tr><th>No</th><th>게시글 이름</th><th>작성자</th><th>작성일</th></tr>"
				+"</thead><tbody></tbody></table></form>"
		);
		for(var i = 0 ; i<list.length;i++){
			$("tbody").append(
				"<tr>"
				+"<td>"+list[i].no+"</td>"+"<td><a href='usedcontroller?command=useddetail&usedno="+list[i].no+"'>"+list[i].name+"</a></td>"+"<td>"+list[i].writer+"</td>"+"<td>"+list[i].reg+"</td>"
				+"</tr>"
			);
		}
	}
	
</script>
</head>
<body>
	<header><%@ include file="./form/header.jsp"%></header>
	<div id="body">
	<div id="side_menu">
	<div id="admin_menu">
		<ul class="acc-menu" id="accordionMenu1">
			<li data-extension="close">
				<div class="main-title">
					<span class="folder"> </span><a>유저관리</a>
				</div>
				<ul class="sub">
					<li><a>일반유저</a></li>
					<li><a>사업자</a></li>
					<li><a>관리자</a></li>
				</ul>
			</li>

			<li data-extension="close">
				<div class="main-title">
					<span class="folder"> </span><a>게시판 관리</a>
				</div>
				<ul class="sub">
					<li><a href="#" onclick="center_list()">센터 게시판</a></li>
					<li><a>회원권 게시판</a></li>
				</ul>
			</li>
		</ul>
	</div></div>
	<div id="wrap">
		<h1>유저 관리</h1>
		<div id="table_data">
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	</div>
	<div id="empty_space">
	
	</div>
	</div>
	<footer><%@ include file="./form/footer.jsp"%></footer>
</body>
</html>