 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">  
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv=X-UA-Compatible content=IE=8/>

	<title>双11会场</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css02/normalize.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css02/font-awesome.min.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css02/bootstrap.css"type="text/css"/>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css02/index.css" type="text/css" media="screen and (min-width:1000px)"/> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css02/ipa.css"type="text/css"media="screen and (min-width:700px) and (max-width:999px)"/> 

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css02/index.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/js02/jquery-1.7.2.js"></script>
	<script src="${pageContext.request.contextPath}/js02/jquery-1.11.3.js"></script>
	<script src="${pageContext.request.contextPath}/js02/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js02/stylee.js"></script>
	<script src="${pageContext.request.contextPath}/js02/jQueryRotate.js"></script>
	<script src="${pageContext.request.contextPath}/js02/snowfall.jquery.js"></script>
	
	 <script type="text/javascript">
     //点击切换验证码
     function refreshCode() {
         //获取
         var vcode = document.getElementById("vcode");

         //设置时间捉 和图片路径
         vcode.src="${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();

     }
 </script>
	
	
</head>
<body>
	
	<!--侧边菜单栏开始-->
	<div class="mgj_rightbar" data-ptp="_sidebar" style="right: 0px;">
		<!--空的右侧边栏-->
		<div id="mgj_rightbar_top_blank" class="mgj_rightbar_960"></div>
		<!--方便定margin的空dediv-->
		<div id="mgj_rightbar_blank_div"></div>
		<!--购物车-->
		<div id="my-cart"class="sidebar-item mgj-my-cart" data-label="1"style="left: 0px;"> 
			<a href="${pageContext.request.contextPath}/jsp/cart.jsp">
				<i class="s-icon"></i> 
				<div class="s-txt">购物车</div> 
				<div class="num" style="display: none;"></div> 
			</a>
		</div>
		<!--优惠券-->
		<div class="sidebar-item mgj-my-coupon" data-label="1"id="my-coupon"> 	
			<a   href="#"> 
				<i class="s-icon"></i> 
				<div class="s-txt">优惠券</div> 
				<div class="num"></div> 
			</a>
		</div>
		<!--钱包-->
		<div class="sidebar-item mgj-my-wallet"id="my-wallet"data-label="1">
		 	<a  href="#"> 
		 		<i class="s-icon"></i> 
		 		<div class="s-txt">钱包</div> 
			 </a>
		 </div>
		 <!--足迹-->
		<div class="sidebar-item mgj-my-browserlog" id="my-browserlog"data-label="1"> 
		 	<a   href="#"> 
		 		<i class="s-icon"></i> 
		 		<div class="s-txt">足迹</div>
		  	</a>
		</div>
		<div class="sideBottom clearfix" id="sideBottom"style="display:none;"> 
		  	<!--回到顶部--> 
		  	<div class="sidebar-item mgj-back2top" data-label="1"style="left: 0px;">
		  		<a  href="javascript:;">
		  			<i class="s-icon"></i>
		  		</a>
		  	</div>
		</div>
	</div>
	<!--侧边菜单栏结束-->

	<!--弹出层遮罩及登录框开始-->
	<div id="mask"></div>
	<div id="login-box"style="left:0;top:0;">
		<div id="login-logo">
			<img src="./images/mogulogo_220x52.png" alt="该链接已失效">
		</div>
		<div id="login-wrap">
			<div class="register"id="register">
				<div class="register-top" id="reg-top">
					<h2 class="normal"id="normal">普通登录</h2>
					<h2 class="nopassword"id="nopw">手机无密码登录</h2>
					<!-- <a  id="qrcode"href="#"></a> -->
				</div>

				<!--普通登录-->
				<div class="register-con" id="rc">
					<form action="${pageContext.request.contextPath}/userServlet?method=userLogin02" method="post">
						<ul>
							
							<li>
								<input type="text"  name="username" placeholder="昵称/邮箱/手机号码"/>
								
							</li>
							<li>
								<input type="password"  name="password" id="pas"placeholder="密码"/>
						
							</li>
							<li>
								<input type="text" name="verifycode"  id="verifycode" placeholder="请输入验证码" style="width: 150px;"/>
								 <a href="javascript:refreshCode();">
              						  <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
      							</a>
							</li>
							<li class="read">
								<input type="checkbox" class="ck"   value="1"checked="checked"/>
								<b>2周内自动登录</b>
								<a href="#">忘记密码？</a>
							</li>
							<li>
								<button class="submit"type="submit"id="login-btn">立即登录</button>
							</li>
							<li>
								<a href="#" class="haiwai">海外手机登录</a>
								<a href="#"class="zhuce">新用户注册</a>
							</li>
						</ul>
					</form>	
				</div>
				<!--手机无密码登录-->
				<div class="login-con" id="lc">
					<form action="#">
					<ul>
						<li id="inner-num">
							<i></i>
							<span>请输入手机号码</span>
						</li>
						<li id="inner-virity">
							<i></i>
							<span>请输入验证码</span>
						</li>
						<li class="lg-num">
							<select name="country" id="country"class="info-select">
								<option value="中国">中国</option>
							</select>
							<input type="text"name="phone-num"placeholder="手机号码"/>	
						</li>
						<li class="password">
							<input type="password"name="password"id="pass"placeholder="动态密码"/>
							
						</li>
						<li>
							<button class="getcode"id="getcode">获取手机动态密码</button>
						</li>
						<li class="read">
							<input type="checkbox" class="ck" name="check"value="1"checked="checked"/>
							<b>2周内自动登录</b>
							<a href="#">忘记密码？</a>
						</li>						
						<li>
							<button class="submit"type="submit"id="login-btn1">登录</button>
						</li>
						<li>
							<a href="#" class="haiwai">海外手机登录</a>
							<a href="#"class="zhuce">新用户注册</a>
						</li>
					</ul>
				</form>	
				</div>
			</div>

			<div class="third-part">
				<ul>
					<li class="zjdl">
						一键授权，轻松登录
					</li>
					<li>
						<div class="qq"></div>
						<div class="weixin"></div>
						<div class="weibo"></div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!--弹出层遮罩及登录框结束-->

	<!--弹出搜索框开始-->
	<div id="J_sticky_container" class="sticky-search-container lets-rock">
		<div class="wrap clearfix">
			<div class="logo-wrap clearfix">

				<div  href="#" id="pop-logo"class="logo" title="蘑菇街|我的买手街">

					<div class="search-nav-menu">
						<i class="nav-menu-logo"></i>
						<span class="nav-menu-all">全部商品分类</span>
						<i class="nav-menu-icon"></i>
					</div>
					<div class="pc-indexPage-nav-menu fl" id="float-nav-menu">
						<ul class="nav-list" id="more-nav-list">
							<li class="nav-li nav-li-first" >
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory" href="#">上衣</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">初冬上新</a><ins></ins>
											<a  href="#">毛呢外套</a><ins></ins>
											<a href="#">棉服</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">上衣</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">当季热卖</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">时尚卫衣</a>
											<a  href="#" style="color:#FF0077">精致套装</a>
											<a  href="#" style="color:#999">针织衫</a>
											<a  href="#" style="color:#999">气质风衣</a>
											<a  href="#" style="color:#999">衬衫</a>
											<a    href="#" style="color:#999">棒球外套</a>
											<a    href="#" style="color:#999">长袖T恤</a>
											<a  href="#" style="color:#999">牛仔外套</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">秋冬新品</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">针织开衫</a>
											<a    href="#" style="color:#999">秋季外套</a>
											<a   href="#" style="color:#999">毛衣</a>
											<a  href="#" style="color:#FF0077">毛呢外套</a>
											<a   href="#" style="color:#999">马甲</a>
											<a   href="#" style="color:#999">皮衣</a>
											<a   href="#" style="color:#FF0077">棉服</a>
											<a    href="#" style="color:#999">长款衬衫</a>
											<a  href="#" style="color:#999">连帽卫衣</a>
											<a   href="#" style="color:#999">羽绒服</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">潮流时尚</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">性感V领</a>
											<a    href="#" style="color:#999">喇叭袖</a>
											<a   href="#" style="color:#999">荷叶边</a>
											<a   href="#" style="color:#999">刺绣</a>
											<a    href="#" style="color:#999">俏皮露肩</a>
											<a    href="#" style="color:#999">绑带衬衫</a>
											<a   href="#" style="color:#999">条纹控</a>
											<a   href="#" style="color:#FF0077">白衬衫</a>
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="skirt">
								<dl class="nav-wrap">
									<dt>
										<a class="catagory"  href="#">裙子</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">流行榜</a><ins></ins>
											<a href="#">美裙套装</a><ins></ins>
											<a  href="#">半身裙</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">裙子</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">当季热卖</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">秋季新品</a>
											<a  href="#" style="color:#FF0077">美裙套装</a>
											<a  href="#" style="color:#999">半身裙</a>
											<a  href="#" style="color:#999">长袖连衣裙</a>
											<a  href="#" style="color:#999">针织裙</a>
											<a    href="#" style="color:#999">连衣裙</a>
											<a    href="#" style="color:#999">卫衣裙</a>
											<a  href="#" style="color:#999">小黑裙</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">流行精选</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">皮裙</a>
											<a    href="#" style="color:#999">收腰裙</a>
											<a   href="#" style="color:#999"> 秋季背心裙</a>
											<a  href="#" style="color:#FF0077">包臀裙</a>
											<a   href="#" style="color:#999">蕾丝裙</a>
											<a   href="#" style="color:#999">高腰裙</a>
											<a   href="#" style="color:#FF0077">衬衫裙</a>
											<a    href="#" style="color:#999">牛仔半身裙</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">经典必备</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">鱼尾裙</a>
											<a    href="#" style="color:#999">背带裙</a>
											<a   href="#" style="color:#999">半身长裙</a>
											<a   href="#" style="color:#999">公主袖裙</a>
											<a    href="#" style="color:#999">小白裙</a>
											<a    href="#" style="color:#999">A字裙</a>
											<a   href="#" style="color:#999">百褶裙</a>
											<a   href="#" style="color:#FF0077">雪纺裙</a>
										</dd>
									</dl>
								</div>
							</li>

							<li class="nav-li" data-topic="pants">
								<dl class="nav-wrap">
									<dt>
										<a class="catagory" href="#">裤子</a>
									</dt>
									<dd>
										<span>
											<a  class="first" href="#">打底裤</a><ins></ins>
											<a  href="#">牛仔裤</a><ins></ins>
											<a  href="#">小脚裤</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">裤子</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">当季热卖</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">打底裤</a>
											<a  href="#" style="color:#FF0077">牛仔裤</a>
											<a  href="#" style="color:#999">阔腿裤</a>
											<a  href="#" style="color:#999">小脚裤</a>
											<a  href="#" style="color:#999">背带裤</a>
											<a    href="#" style="color:#999">休闲裤</a>
											<a    href="#" style="color:#999">九分裤 </a>
											<a  href="#" style="color:#999">七分裤</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">流行精选</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">秋季新品</a>
											<a    href="#" style="color:#999">破洞牛仔裤</a>
											<a   href="#" style="color:#999">毛衣</a>
											<a  href="#" style="color:#FF0077">哈伦裤</a>
											<a   href="#" style="color:#999">连体裤</a>
											<a   href="#" style="color:#999">直筒裤</a>
											<a   href="#" style="color:#FF0077">喇叭裤</a>
											<a    href="#" style="color:#999">灯笼裤</a>
											<a  href="#" style="color:#999">宽松牛仔裤</a>
											<a   href="#" style="color:#999">磨边牛仔裤</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">经典必备</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">铅笔裤</a>
											<a    href="#" style="color:#999">五分裤</a>
											<a   href="#" style="color:#999">裙裤</a>
											<a   href="#" style="color:#999">皮裤</a>
											<a    href="#" style="color:#999">条纹裤</a>
											<a    href="#" style="color:#999">高腰裤</a>
											<a   href="#" style="color:#999">运动裤</a>
										</dd>
									</dl>
								</div>
							</li>

							<li class="nav-li" data-topic="underwear">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory" href="#">内衣</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">热销榜</a><ins></ins>
											<a href="#">睡衣套装</a><ins></ins>
											<a href="#">内裤</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">内衣</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">内衣</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">内衣套装</a>
											<a  href="#" style="color:#FF0077">调整型内衣</a>
											<a  href="#" style="color:#999">文胸</a>
											<a  href="#" style="color:#999">内裤</a>
											<a  href="#" style="color:#999">无痕内衣</a>
											<a    href="#" style="color:#999">运动内衣</a>
											<a    href="#" style="color:#999">卡通内裤</a>
											<a  href="#" style="color:#999">保暖内衣</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">家居睡衣</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">睡衣套装</a>
											<a    href="#" style="color:#999">家居服</a>
											<a   href="#" style="color:#999">睡裙</a>
											<a  href="#" style="color:#FF0077">情侣睡衣</a>
											<a   href="#" style="color:#999">睡袍</a>
											<a   href="#" style="color:#999">甜美家居服</a>
											<a   href="#" style="color:#FF0077">性感睡衣</a>
											<a    href="#" style="color:#999">珊瑚绒</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">袜子</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">堆堆袜</a>
											<a    href="#" style="color:#999">短袜</a>
											<a   href="#" style="color:#999">瘦腿袜</a>
											<a   href="#" style="color:#999">丝袜</a>
											<a    href="#" style="color:#999">打底袜</a>
											<a    href="#" style="color:#999">中筒袜</a>
											<a   href="#" style="color:#999">船袜</a>
											
										</dd>
									</dl>
								</div>
							</li>


							<li class="nav-li" data-topic="shoes">
								<dl class="nav-wrap">
									<dt>
										<a class="catagory" href="#">女鞋</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">靴子</a><ins></ins>
											<a  href="#">单鞋</a><ins></ins>
											<a href="#">运动鞋</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">女鞋</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">人气热销</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">单鞋</a>
											<a  href="#" style="color:#FF0077">运动鞋</a>
											<a  href="#" style="color:#999">靴子</a>
											<a  href="#" style="color:#999">小白鞋</a>
											<a  href="#" style="color:#999">帆布鞋</a>
											<a    href="#" style="color:#999">厚底鞋</a>
											<a    href="#" style="color:#999">高跟鞋</a>
											<a  href="#" style="color:#999">休闲鞋</a>
											<a  href="#" style="color:#999">一脚蹬</a>
											<a    href="#" style="color:#999">马丁靴</a>
											<a    href="#" style="color:#999">牛津鞋</a>
											<a  href="#" style="color:#999">粗跟鞋</a>

										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">热门推荐</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">当季热卖</a>
											<a    href="#" style="color:#999">厚底运动</a>
											<a   href="#" style="color:#999">及踝靴</a>
											<a  href="#" style="color:#FF0077">英伦靴子</a>
											<a   href="#" style="color:#999">甜美高跟</a>
											<a   href="#" style="color:#999">玛丽珍鞋</a>
											<a   href="#" style="color:#FF0077">学院帆布</a>
											<a    href="#" style="color:#999">尖头单鞋</a>
											<a  href="#" style="color:#999">豆豆鞋</a>
											<a   href="#" style="color:#999">乐福鞋</a>
											<a   href="#" style="color:#999">松糕鞋</a>
											<a    href="#" style="color:#999">坡跟鞋</a>
											<a  href="#" style="color:#999">雪地靴</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">经典直击</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">明星同款</a>
											<a    href="#" style="color:#999">韩版运动</a>
											<a   href="#" style="color:#999">欧美范</a>
											<a   href="#" style="color:#999">情侣款</a>
											<a    href="#" style="color:#999">学生党</a>
											<a    href="#" style="color:#999">原宿风</a>
											<a   href="#" style="color:#999">复古擦色</a>
											<a   href="#" style="color:#FF0077">系带款</a>
											<a    href="#" style="color:#999">舒适平底</a>
											<a    href="#" style="color:#999">学院休闲</a>
											<a   href="#" style="color:#999">名媛淑女</a>
											<a   href="#" style="color:#FF0077">森系清新</a>
										</dd>
									</dl>
								</div>
							</li>

							<li class="nav-li" data-topic="boyfriend">
								<dl class="nav-wrap">
									<dt>
										<a class="catagory"  href="#">男友</a>
									</dt>
									<dd>
										<span>
											<a  class="first" href="#">夹克</a><ins></ins>
											<a  href="#">加厚裤装</a><ins></ins>
											<a  href="#">棉衣</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">男友</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">当季热卖</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">棉衣棉服</a>
											<a  href="#" style="color:#FF0077">牛仔裤</a>
											<a  href="#" style="color:#999">卫衣</a>
											<a  href="#" style="color:#999">夹克</a>
											<a  href="#" style="color:#999">休闲鞋</a>
											<a    href="#" style="color:#999">休闲裤</a>
											<a    href="#" style="color:#999">毛衣针织</a>
											<a  href="#" style="color:#999">绅士皮鞋</a>
											<a  href="#" style="color:#999">时尚套装</a>
											<a    href="#" style="color:#999">男袜</a>
											<a    href="#" style="color:#999">贴身内裤</a>
											<a  href="#" style="color:#999">衬衫</a>
											<a  href="#" style="color:#999">11.11夯货</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">人气单品</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">九分裤</a>
											<a    href="#" style="color:#999">帆布鞋</a>
											<a   href="#" style="color:#999">马丁靴</a>
											<a  href="#" style="color:#FF0077">牛仔外套</a>
											<a   href="#" style="color:#999">风衣</a>
											<a   href="#" style="color:#999">棒球夹克</a>
											<a   href="#" style="color:#FF0077">皮衣</a>
											<a    href="#" style="color:#999">休闲西装</a>
											<a  href="#" style="color:#999">板鞋</a>
											<a   href="#" style="color:#999">运动鞋</a>
											<a   href="#" style="color:#999">西装裤</a>
											<a    href="#" style="color:#999">买就送</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">潮流元素</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">单宁风</a>
											<a    href="#" style="color:#999">约会装</a>
											<a   href="#" style="color:#999">基本款</a>
											<a   href="#" style="color:#999">中国风</a>
											<a    href="#" style="color:#999">最品质</a>
											<a    href="#" style="color:#999">条纹装</a>
											<a   href="#" style="color:#999">印花刺绣</a>
											<a   href="#" style="color:#FF0077">飞行员夹克</a>
											<a    href="#" style="color:#999">连帽服</a>
											<a    href="#" style="color:#999">一脚蹬</a>
											<a   href="#" style="color:#999">束脚裤</a>
											<a   href="#" style="color:#FF0077">破洞风</a>
										</dd>
									</dl>
								</div>
							</li>

							<li class="nav-li" data-topic="bag">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">包包</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">秋上新</a><ins></ins>
											<a   href="#">女包</a><ins></ins>
											<a   href="#">男包</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">包包</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">热门</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">新品</a>
											<a  href="#" style="color:#FF0077">双肩包</a>
											<a  href="#" style="color:#999">斜挎包</a>
											<a  href="#" style="color:#999">手提包</a>
											<a  href="#" style="color:#999">单肩包</a>
											<a    href="#" style="color:#999">百搭大包</a>
											<a    href="#" style="color:#999">迷你小包</a>
											<a  href="#" style="color:#999">旅行箱包</a>
											<a  href="#" style="color:#999">女士钱包</a>
											<a    href="#" style="color:#999">男士钱包</a>
											<a    href="#" style="color:#999">香风链条</a>
											<a  href="#" style="color:#999">手拿包</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">款式</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">双肩包</a>
											<a    href="#" style="color:#999">斜挎包</a>
											<a   href="#" style="color:#999">单肩包</a>
											<a  href="#" style="color:#FF0077">手提包</a>
											<a   href="#" style="color:#999">钱包</a>
											<a   href="#" style="color:#999">旅行箱</a>
											<a   href="#" style="color:#FF0077">手拿包</a>
											<a    href="#" style="color:#999">帆布包</a>
											<a  href="#" style="color:#999">mini小包</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">流行</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">链条包</a>
											<a    href="#" style="color:#999">贝壳包</a>
											<a   href="#" style="color:#999">水桶包</a>
											<a   href="#" style="color:#999">方形包</a>
											<a    href="#" style="color:#999">复古包</a>
											<a    href="#" style="color:#999">卡通包</a>
											<a   href="#" style="color:#999">铆钉包</a>
											<a   href="#" style="color:#FF0077">邮差包</a>
											<a    href="#" style="color:#999">子母包</a>
											<a    href="#" style="color:#999">印花包</a>
											
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="sport">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">运动</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">运动套装</a><ins></ins>
											<a   href="#">运动鞋</a><ins></ins>
											<a   href="#">卫衣</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">运动</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">1111精选</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">运动套装</a>
											<a  href="#" style="color:#FF0077">运动鞋</a>
											<a  href="#" style="color:#999">元气棉服</a>
											<a  href="#" style="color:#999">时尚卫衣</a>
											<a  href="#" style="color:#999">秋冬短靴</a>
											<a    href="#" style="color:#999">跑鞋</a>
											<a    href="#" style="color:#999">棒球衫</a>
											<a  href="#" style="color:#999">帆布鞋</a>
											<a  href="#" style="color:#999">情侣款</a>
											<a    href="#" style="color:#999">双肩包</a>
											<a    href="#" style="color:#999">烧烤用品</a>

											<a  href="#" style="color:#999">衬衫</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">火爆热卖</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">时尚卫衣</a>
											<a    href="#" style="color:#999">人气套装</a>
											<a   href="#" style="color:#999">网红款</a>
											<a  href="#" style="color:#FF0077">小白鞋</a>
											<a   href="#" style="color:#999">跑鞋</a>
											<a   href="#" style="color:#999">瑜伽必备</a>
											<a   href="#" style="color:#FF0077">运动内衣</a>
											<a    href="#" style="color:#999">明星同款</a>
											<a  href="#" style="color:#999">休闲板鞋</a>
											<a   href="#" style="color:#999">运动裤</a>
											<a   href="#" style="color:#999">体重秤</a>
											<a    href="#" style="color:#999">拉力器</a>
											<a   href="#" style="color:#999">小型装备</a>
											<a   href="#" style="color:#999">大型装备</a>
											<a    href="#" style="color:#999">减脂神器</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">品牌专柜</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">耐克</a>
											<a    href="#" style="color:#999">阿迪达斯</a>
											<a   href="#" style="color:#999">匡威</a>
											<a   href="#" style="color:#999">特步</a>
											<a    href="#" style="color:#999">鸿星尔克</a>
											<a    href="#" style="color:#999">乔丹</a>
											<a   href="#" style="color:#999">李宁</a>
											<a   href="#" style="color:#FF0077">法国公鸡</a>
											<a    href="#" style="color:#999">环球</a>
											<a    href="#" style="color:#999">回力</a>
											<a   href="#" style="color:#999">asics</a>
											<a   href="#" style="color:#FF0077">New</a>
											<a   href="#" style="color:#999">花花公子</a>
											<a   href="#" style="color:#FF0077">全部品牌</a>
											<a   href="#" style="color:#FF0077">11.11品牌会场</a>
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="makeups">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">美妆</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">补水保湿</a><ins></ins>
											<a   href="#">面膜</a><ins></ins>
											<a   href="#">BB霜</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">美妆</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">必备护肤</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">保湿补水</a>
											<a  href="#" style="color:#FF0077">美白淡斑</a>
											<a  href="#" style="color:#999">洁面</a>
											<a  href="#" style="color:#999">人气面膜</a>
											<a  href="#" style="color:#999">水乳</a>
											<a    href="#" style="color:#999">眼唇护理</a>
											<a    href="#" style="color:#999">T区护理</a>
											<a  href="#" style="color:#999">护唇膏</a>
											<a  href="#" style="color:#999">精华</a>
											<a    href="#" style="color:#999">护肤套装</a>
											<a    href="#" style="color:#999">防晒</a>

											<a  href="#" style="color:#999">男士护肤</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">潮流彩妆</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">妆前隔离</a>
											<a    href="#" style="color:#999">BB霜</a>
											<a   href="#" style="color:#999">遮瑕粉底</a>
											<a  href="#" style="color:#FF0077">腮红</a>
											<a   href="#" style="color:#999">阴影高光</a>
											<a   href="#" style="color:#999">定妆散粉</a>
											<a   href="#" style="color:#FF0077">口红</a>
											<a    href="#" style="color:#999">眼妆</a>
											<a  href="#" style="color:#999">眉笔</a>
											<a   href="#" style="color:#999">美妆工具</a>
											<a   href="#" style="color:#999">彩妆套装</a>
											<a    href="#" style="color:#999">香水</a>
											<a   href="#" style="color:#999">指甲油</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">个人护理</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">洗发护发</a>
											<a    href="#" style="color:#999">烫染造型</a>
											<a   href="#" style="color:#999">沐浴露</a>
											<a   href="#" style="color:#999">沐浴露</a>
											<a    href="#" style="color:#999">c</a>
											<a    href="#" style="color:#999">全身呵护</a>
											<a   href="#" style="color:#999">手足护理</a>
											<a   href="#" style="color:#FF0077">美胸瘦身</a>
											<a    href="#" style="color:#999">口腔护理</a>
											<a    href="#" style="color:#999">卫生巾</a>
											<a   href="#" style="color:#999">避孕套</a>
											<a   href="#" style="color:#FF0077">情趣用具</a>
											<a   href="#" style="color:#999">脱毛膏</a>
											
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="decoration">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">配饰</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">热卖围巾</a><ins></ins>
											<a   href="#">项链</a><ins></ins>
											<a   href="#">男士配饰</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">配饰</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">秋季新品</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">早秋围巾</a>
											<a  href="#" style="color:#FF0077">手表</a>
											<a  href="#" style="color:#999">锁骨链</a>
											<a  href="#" style="color:#999">帽子</a>
											<a  href="#" style="color:#999">发饰</a>
											<a    href="#" style="color:#999">戒指</a>
											<a    href="#" style="color:#999">眼镜框</a>
											<a  href="#" style="color:#999">耳饰</a>
											<a  href="#" style="color:#999">棒球帽</a>
											<a    href="#" style="color:#999">手链</a>
											<a    href="#" style="color:#999">墨镜</a>

											<a  href="#" style="color:#999">耳钉</a>
											<a    href="#" style="color:#999">男士手表</a>

											<a  href="#" style="color:#999">皮带</a>
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">潮流速递</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">几何项链</a>
											<a    href="#" style="color:#999">情侣手表</a>
											<a   href="#" style="color:#999">银饰</a>
											<a  href="#" style="color:#FF0077">发箍</a>
											<a   href="#" style="color:#999">吊坠</a>
											<a   href="#" style="color:#999">组合戒指</a>
											<a   href="#" style="color:#FF0077">手镯</a>
											<a    href="#" style="color:#999">颈链</a>
											<a  href="#" style="color:#999">渔夫帽</a>
											<a   href="#" style="color:#999">脚链</a>
											<a   href="#" style="color:#999">男士墨镜</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">特色饰品</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">轻奢珠宝</a>
											<a    href="#" style="color:#999">腰带</a>
											<a   href="#" style="color:#999">胸针</a>
											<a   href="#" style="color:#999">假领子</a>
											<a    href="#" style="color:#999">新娘配饰</a>
											<a    href="#" style="color:#999">假发</a>
											<a   href="#" style="color:#999">钥匙扣</a>
											<a   href="#" style="color:#FF0077">纹身贴</a>
											
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="household">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">家居</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">新品</a><ins></ins>
											<a   href="#">四件套</a><ins></ins>
											<a   href="#">小家具</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">家居</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">家纺布艺</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">四件套</a>
											<a  href="#" style="color:#FF0077">秋冬被</a>
											<a  href="#" style="color:#999">沙发垫</a>
											<a  href="#" style="color:#999">抱枕</a>
											<a  href="#" style="color:#999">家居鞋</a>
											<a    href="#" style="color:#999">枕头</a>
											<a    href="#" style="color:#999">地毯地垫</a>
											<a  href="#" style="color:#999">床幔</a>
											<a  href="#" style="color:#999">床垫</a>
											<a    href="#" style="color:#999">坐垫</a>
											<a    href="#" style="color:#999">毯子</a>

											<a  href="#" style="color:#999">窗帘</a>
											<a    href="#" style="color:#999">被套</a>

											<a  href="#" style="color:#999">餐桌布艺</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">家具家饰</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">简易衣柜</a>
											<a    href="#" style="color:#999">墙贴</a>
											<a   href="#" style="color:#999">鞋架</a>
											<a  href="#" style="color:#FF0077">摆件</a>
											<a   href="#" style="color:#999">电脑桌</a>
											<a   href="#" style="color:#999">绿植盆栽</a>
											<a   href="#" style="color:#FF0077">镜子</a>
											<a    href="#" style="color:#999">仿真花</a>
											<a  href="#" style="color:#999">闹钟</a>
											<a   href="#" style="color:#999">相片墙</a>
											<a   href="#" style="color:#999">香薰</a>
											<a    href="#" style="color:#999">衣帽架</a>
											<a   href="#" style="color:#999">花架</a>
											<a   href="#" style="color:#999">DIY</a>
											<a    href="#" style="color:#999">鲜花速递</a>
											<a   href="#" style="color:#999">沙发</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">美味厨房</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">锅具</a>
											<a    href="#" style="color:#999">碗</a>
											<a   href="#" style="color:#999">叉勺筷</a>
											<a   href="#" style="color:#999">调味罐</a>
											<a    href="#" style="color:#999">c</a>
											<a    href="#" style="color:#999">饭盒</a>
											<a   href="#" style="color:#999">烘焙器具</a>
											<a   href="#" style="color:#FF0077">保鲜罐</a>
											<a    href="#" style="color:#999">围裙</a>
											<a    href="#" style="color:#999">厨房小家电</a>
											<a   href="#" style="color:#999">厨房清洁</a>
											<a   href="#" style="color:#FF0077">橡胶手套</a>
											<a   href="#" style="color:#999">隔热手套</a>
											
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="baby">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">母婴</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">秋季热销</a><ins></ins>
											<a   href="#">童装</a><ins></ins>
											<a   href="#">孕妇装</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">母婴</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">当季热卖</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">男童装</a>
											<a  href="#" style="color:#FF0077">女童装</a>
											<a  href="#" style="color:#999">轻薄外套</a>
											<a  href="#" style="color:#999">童裤</a>
											<a  href="#" style="color:#999">孕妇连衣裙</a>
											<a    href="#" style="color:#999">孕妇装</a>
											<a    href="#" style="color:#999">运动鞋</a>
											<a  href="#" style="color:#999">帆布鞋</a>
											<a  href="#" style="color:#999">家居服</a>
											<a    href="#" style="color:#999">益智早教</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">流行精选母婴</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">儿童套装</a>
											<a    href="#" style="color:#999">卫衣</a>
											<a   href="#" style="color:#999">打底裤</a>
											<a  href="#" style="color:#FF0077">单鞋</a>
											<a   href="#" style="color:#999">亲子装</a>
											<a   href="#" style="color:#999">孕妇套装</a>
											<a   href="#" style="color:#FF0077">衬衫</a>
											<a    href="#" style="color:#999">袜子</a>
											<a  href="#" style="color:#999">孕产洗护</a>
											<a   href="#" style="color:#999">孕妇裤</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">经典必备</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">新生儿</a>
											<a    href="#" style="color:#999">T恤</a>
											<a   href="#" style="color:#999">婴儿礼盒</a>
											<a   href="#" style="color:#999">待产包</a>
											<a    href="#" style="color:#999">托腹裤</a>
											<a    href="#" style="color:#999">哺乳内衣</a>
											<a   href="#" style="color:#999">童车</a>
											<a   href="#" style="color:#FF0077">婴儿床品</a>
											<a    href="#" style="color:#999">连体衣</a>
											<a    href="#" style="color:#999">月子服</a>
											
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="food">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">食品</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">休闲食品</a><ins></ins>
											<a   href="#">进口食品</a><ins></ins>
											<a   href="#">肉食</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">食品</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">茶酒饮料</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">咖啡</a>
											<a  href="#" style="color:#FF0077">冲饮谷物</a>
											<a  href="#" style="color:#999">花草茶</a>
											<a  href="#" style="color:#999">饮料</a>
											<a  href="#" style="color:#999">冲饮</a>
											<a    href="#" style="color:#999">果味茶饮</a>
											<a    href="#" style="color:#999">酒类</a>
											<a  href="#" style="color:#999">早餐茶饮</a>
											<a  href="#" style="color:#999">代餐粉粉</a>
											
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">进口食品</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">韩国</a>
											<a    href="#" style="color:#999">日本</a>
											<a   href="#" style="color:#999">东南亚</a>
											<a  href="#" style="color:#FF0077">进口饼干</a>
											<a   href="#" style="color:#999">进口糕点</a>
											<a   href="#" style="color:#999">进口糖巧</a>
											<a   href="#" style="color:#FF0077">进口水饮</a>
											<a    href="#" style="color:#999">泰国</a>
										
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">休闲零食</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">饼干</a>
											<a    href="#" style="color:#999">糕点</a>
											<a   href="#" style="color:#999">糖果</a>
											<a   href="#" style="color:#999">蜜饯</a>
											<a    href="#" style="color:#999">坚果</a>
											<a    href="#" style="color:#999">肉铺肉食</a>
											<a   href="#" style="color:#999">巧克力</a>
											<a   href="#" style="color:#FF0077">膨化食品</a>
											<a    href="#" style="color:#999">零食大礼包</a>
											<a    href="#" style="color:#999">方便速食</a>
											<a    href="#" style="color:#999">曲奇</a>
										</dd>
									</dl>
								</div>
							</li>
							<li class="nav-li" data-topic="merchandise">
								<dl class="nav-wrap">
									<dt>
										<a  class="catagory"  href="#">百货</a>
									</dt>
									<dd>
										<span>
											<a  class="first"  href="#">新品</a><ins></ins>
											<a   href="#">玻璃杯</a><ins></ins>
											<a   href="#">雨伞</a>
										</span>
									</dd>
								</dl>
								<div data-nav="nav-menu"class="nav-more"style="display:none;">
									<h2>
										<a   href="#">百货</a>
									</h2>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">生活小物</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#FF0077">保温杯</a>
											<a  href="#" style="color:#FF0077">晴雨伞</a>
											<a  href="#" style="color:#999">玻璃杯</a>
											<a  href="#" style="color:#999">毛绒玩具</a>
											<a  href="#" style="color:#999">心机小物</a>
											<a    href="#" style="color:#999">衣物护理工具</a>
											<a    href="#" style="color:#999">防护用品</a>
											<a  href="#" style="color:#999">家务清洁</a>
											<a  href="#" style="color:#999">毛巾/浴巾</a>
											<a    href="#" style="color:#999">情趣内衣</a>
											<a    href="#" style="color:#999">纸品洗液</a>
											<a  href="#" style="color:#999">餐具</a>
											<a  href="#" style="color:#999">文具纸本</a>
											
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">收纳控</a>
										</dt>
										<dd class="more-list">
											<a  href="#" style="color:#999">收纳盒</a>
											<a    href="#" style="color:#999">收纳箱</a>
											<a   href="#" style="color:#999">收纳袋</a>
											<a  href="#" style="color:#FF0077">首饰盒</a>
											<a   href="#" style="color:#999">桌面收纳</a>
											<a   href="#" style="color:#999">纸巾盒</a>
											<a   href="#" style="color:#FF0077">内衣收纳</a>
											<a    href="#" style="color:#999">脏衣篓</a>
											<a   href="#" style="color:#999">鞋盒</a>
											<a   href="#" style="color:#999">化妆品收纳</a>
											<a   href="#" style="color:#FF0077">挂钩</a>
											<a    href="#" style="color:#999">防尘袋</a>
										
										</dd>
									</dl>
									<dl class="nav-more-wrap">
										<dt>
											<a   href="#">手机数码</a>
										</dt>
										<dd class="more-list">
											<a   href="#" style="color:#FF0077">手机</a>
											<a    href="#" style="color:#999">手机壳</a>
											<a   href="#" style="color:#999">耳机</a>
											<a   href="#" style="color:#999">蜜饯</a>
											<a    href="#" style="color:#999">智能手环</a>
											<a    href="#" style="color:#999">移动电源</a>
											<a   href="#" style="color:#999">手机贴膜</a>
											<a   href="#" style="color:#FF0077">自拍杆</a>
											<a    href="#" style="color:#999">U盘</a>
											<a    href="#" style="color:#999">手机支架</a>
											<a    href="#" style="color:#999">小音箱</a>
											<a    href="#" style="color:#999">数据线</a>
											<a    href="#" style="color:#999">鼠标</a>
										</dd>
									</dl>
								</div>
							</li>
						</ul>				
					</div>
				</div>
				
			</div>
			<div class="sticky-search-content">
				<div class="top-nav-search" id="nav-search-form"> 
					<!--搜索框 -->
	                <div class="search-inner-box clearfix">
	                    <div id="select-box"class="select-box" data-v="1">
	                        <span class="selected">搜商品</span>
	                        <ol>
	                            <li class="current" data-index="bao"><a href="javascript:void(0);">商品</a></li>
	                            <li data-index="shop"><a href="javascript:void(0)">店铺</a></li>
	                        </ol>
	                    </div>
	                    <form action="/search" method="get" id="top_nav_form">
	                        <input data-tel="search_book" name="q" class="ts_txt fl" data-def="打底裤" value="" autocomplete="off" def-v="人手一件万能打底裤" type="text">
	                        <input value="搜  索" class="ts_btn" type="submit">
	                
	                    </form>
	                    <div id="top-search-hint-1"class="top_search_hint is-not-ie8-hack">
	                    	<div class="search_tip_box fl">
	                    		<div class="mr300 tip_wrap">
	                    			<h3 class="search_tip_title local_title clearfix">历史记录</h3>
	                    			<ul class="search_tip"></ul>
	                    		</div>
	                    	</div>
	                    </div>
	                </div>  
            	</div>
        	</div>
    	</div>
    </div>
	<!--弹出搜索框结束-->

	<!--会场导航开始-->
	<div class="top-hc">
		<dl>
			<dt><a href="#"></a></dt>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
			<dd><a href="#"></a></dd>
		</dl>
	</div>
	<!--会场导航结束-->

	<!--头部导航栏开始-->
	<div class="header-nav">
		<div class="header-wrap">
			<a class="mgj-home" href="${pageContext.request.contextPath}/indexServlet" style="color:red">王一宁网络商城首页</a>
			<ul class="header-wrap-nav">
			
				<li class="login header-item">
					<c:if test="${empty loginUser}">
						<a href="${pageContext.request.contextPath}/userServlet?method=registUI">注册</a>
						<a href="#" id="login">登录</a>
					</c:if>
				</li>
			
		
				<li class="order header-item">
					<c:if test="${not empty loginUser}">
					<a href="#" style="color:red">欢迎您回来，${loginUser.username}</a>
					</c:if>
				</li>	
				<li class="order header-item">
					<a href="#">我的订单</a>
				</li>
				<li class="cart header-item"id="cart">
					<a href="${pageContext.request.contextPath}/jsp/cart.jsp">购物车</a>
					<div class="empty-cart">购物车里没有商品</div>
					
				</li>
			
				<li class="custom header-item" id="custom">
					<a href="#">客户服务</a>
					<i class="icon_delta"></i>
					<ol class="custom-con">
						<li class="cs2">
							<a href="#">消费者服务</a>
						</li>
						<li class="cs2">
							<a href="#">商家服务</a>
						</li>
						<li class="cs2">
							<a href="#">规则中心</a>
						</li>
					</ol>
				</li>
				<li class="store header-item"id="store">
					<a href="#">我的小店</a>
					<ol class="store-con">
						<li class="s2">
							<a href="#">管理后台</a>
						</li>
						<li class="s2">
							<a href="#">商家社区</a>
						</li>
						<li class="s2">
							<a href="#">商家培训</a>
						</li>
						<li class="s2">
							<a href="#">市场入驻</a>
						</li>
					</ol>
				</li>
		
			</ul>
		</div>
	</div>
	<!--头部导航栏结束-->

	<!--头部搜索开始-->
	<div class="header-mid">
		<div class="header-mid-wrap">
			<a href="#" >
				<img  id="s1111-logo"src="./images/1111_220x90.gif" alt="该链接已失效">
			</a>
			<div class="search-content">
				<div class="top_nav_search">
					<div class="search-inner-box">
						<div id="select-box-1"class="select-box">
							<span class="selected">搜商品</span>
							<ol>
								<li class="current"data-index="goods">
									<a href="#">商品</a>
								</li>
								<li data-index="store">
									<a href="#">店铺</a>
								</li>
							</ol>
						</div>
						<form action="/search" method="get" id="top_nav_form">
                       	 	<input data-tel="search_book" name="q1" class="ts_txt fl" data-def="睡衣女冬" value="" autocomplete="off" def-v="韩版可爱秋冬季睡衣套装" type="text">
                        	<input value="搜  索" class="ts_btn" type="submit">
                        	<input name="t" value="bao" id="select_type" type="hidden">
                        	<input name="ptp" value="" type="hidden">
                    	</form>
	                    <div id="top-search-hint"class="top_search_hint is-not-ie8-hack" >
	                    	<div class="search_tip_box fl">
	                    		<div class="mr300 tip_wrap">
	                    			<h3 class="search_tip_title local_title clearfix">历史记录</h3>
	                    			<ul class="search_tip"></ul>
	                    		</div>
	                    	</div>
	                    </div>
					</div>
					<div class="ts_hotwords">
						<a href="#" class="ts_hotword">毛呢外套</a>
						<a href="#" class="ts_hotword">短靴</a>
						<a href="#" class="ts_hotword">毛衣</a>
						<a href="#" class="ts_hotword">男士外套</a>
						<a href="#" class="ts_hotword">卫衣</a>
						<a href="#" class="ts_hotword">睡衣</a>
						<a href="#" class="ts_hotword">打底裤</a>
						<a href="#" class="ts_hotword">秋冬套装</a>
						<a href="#" class="ts_hotword">连衣裙</a>
					</div>
				</div>
			</div>
			<div class="header-mid-qrcode">
				<img src="./images/qrcode.png" alt="该链接已失效">
			</div>
		</div>
	</div>
	<!--头部搜索结束-->

	<!--头部轮播图开始-->
	<div class="header-banner clearfix"id="header-banner"style="background:#FF9003;">
		<div class="banner-wrap clearfix">
			<div class="nav-aside-menu">
				<div class="pc-indexPage-nav-menu fl" id="banner-nav-menu">
					<ul class="nav-list" id="more-banner-list">
						<li class="nav-li nav-li-first" >
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory" href="#">上衣</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">初冬上新</a>
										<ins></ins>
										<a  href="#">毛呢外套</a>
										<ins></ins>
										<a href="#">棉服</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">上衣</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">当季热卖</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">时尚卫衣</a>
										<a  href="#" style="color:#FF0077">精致套装</a>
										<a  href="#" style="color:#999">针织衫</a>
										<a  href="#" style="color:#999">气质风衣</a>
										<a  href="#" style="color:#999">衬衫</a>
										<a    href="#" style="color:#999">棒球外套</a>
										<a    href="#" style="color:#999">长袖T恤</a>
										<a  href="#" style="color:#999">牛仔外套</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">秋冬新品</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">针织开衫</a>
										<a    href="#" style="color:#999">秋季外套</a>
										<a   href="#" style="color:#999">毛衣</a>
										<a  href="#" style="color:#FF0077">毛呢外套</a>
										<a   href="#" style="color:#999">马甲</a>
										<a   href="#" style="color:#999">皮衣</a>
										<a   href="#" style="color:#FF0077">棉服</a>
										<a    href="#" style="color:#999">长款衬衫</a>
										<a  href="#" style="color:#999">连帽卫衣</a>
										<a   href="#" style="color:#999">羽绒服</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">潮流时尚</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">性感V领</a>
										<a    href="#" style="color:#999">喇叭袖</a>
										<a   href="#" style="color:#999">荷叶边</a>
										<a   href="#" style="color:#999">刺绣</a>
										<a    href="#" style="color:#999">俏皮露肩</a>
										<a    href="#" style="color:#999">绑带衬衫</a>
										<a   href="#" style="color:#999">条纹控</a>
										<a   href="#" style="color:#FF0077">白衬衫</a>
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="skirt">
							<dl class="nav-wrap">
								<dt>
									<a class="catagory"  href="#">裙子</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">流行榜</a>
										<ins></ins>
										<a href="#">美裙套装</a>
										<ins></ins>
										<a  href="#">半身裙</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">裙子</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">当季热卖</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">秋季新品</a>
										<a  href="#" style="color:#FF0077">美裙套装</a>
										<a  href="#" style="color:#999">半身裙</a>
										<a  href="#" style="color:#999">长袖连衣裙</a>
										<a  href="#" style="color:#999">针织裙</a>
										<a    href="#" style="color:#999">连衣裙</a>
										<a    href="#" style="color:#999">卫衣裙</a>
										<a  href="#" style="color:#999">小黑裙</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">流行精选</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">皮裙</a>
										<a    href="#" style="color:#999">收腰裙</a>
										<a   href="#" style="color:#999"> 秋季背心裙</a>
										<a  href="#" style="color:#FF0077">包臀裙</a>
										<a   href="#" style="color:#999">蕾丝裙</a>
										<a   href="#" style="color:#999">高腰裙</a>
										<a   href="#" style="color:#FF0077">衬衫裙</a>
										<a    href="#" style="color:#999">牛仔半身裙</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">经典必备</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">鱼尾裙</a>
										<a    href="#" style="color:#999">背带裙</a>
										<a   href="#" style="color:#999">半身长裙</a>
										<a   href="#" style="color:#999">公主袖裙</a>
										<a    href="#" style="color:#999">小白裙</a>
										<a    href="#" style="color:#999">A字裙</a>
										<a   href="#" style="color:#999">百褶裙</a>
										<a   href="#" style="color:#FF0077">雪纺裙</a>
									</dd>
								</dl>
							</div>
						</li>

						<li class="nav-li" data-topic="pants">
							<dl class="nav-wrap">
								<dt>
									<a class="catagory" href="#">裤子</a>
								</dt>
								<dd>
									<span>
										<a  class="first" href="#">打底裤</a>
										<ins></ins>
										<a  href="#">牛仔裤</a>
										<ins></ins>
										<a  href="#">小脚裤</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">裤子</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">当季热卖</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">打底裤</a>
										<a  href="#" style="color:#FF0077">牛仔裤</a>
										<a  href="#" style="color:#999">阔腿裤</a>
										<a  href="#" style="color:#999">小脚裤</a>
										<a  href="#" style="color:#999">背带裤</a>
										<a    href="#" style="color:#999">休闲裤</a>
										<a    href="#" style="color:#999">九分裤 </a>
										<a  href="#" style="color:#999">七分裤</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">流行精选</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">秋季新品</a>
										<a    href="#" style="color:#999">破洞牛仔裤</a>
										<a   href="#" style="color:#999">毛衣</a>
										<a  href="#" style="color:#FF0077">哈伦裤</a>
										<a   href="#" style="color:#999">连体裤</a>
										<a   href="#" style="color:#999">直筒裤</a>
										<a   href="#" style="color:#FF0077">喇叭裤</a>
										<a    href="#" style="color:#999">灯笼裤</a>
										<a  href="#" style="color:#999">宽松牛仔裤</a>
										<a   href="#" style="color:#999">磨边牛仔裤</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">经典必备</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">铅笔裤</a>
										<a    href="#" style="color:#999">五分裤</a>
										<a   href="#" style="color:#999">裙裤</a>
										<a   href="#" style="color:#999">皮裤</a>
										<a    href="#" style="color:#999">条纹裤</a>
										<a    href="#" style="color:#999">高腰裤</a>
										<a   href="#" style="color:#999">运动裤</a>
									</dd>
								</dl>
							</div>
						</li>

						<li class="nav-li" data-topic="underwear">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory" href="#">内衣</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">热销榜</a>
										<ins></ins>
										<a href="#">睡衣套装</a>
										<ins></ins>
										<a href="#">内裤</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">内衣</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">内衣</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">内衣套装</a>
										<a  href="#" style="color:#FF0077">调整型内衣</a>
										<a  href="#" style="color:#999">文胸</a>
										<a  href="#" style="color:#999">内裤</a>
										<a  href="#" style="color:#999">无痕内衣</a>
										<a    href="#" style="color:#999">运动内衣</a>
										<a    href="#" style="color:#999">卡通内裤</a>
										<a  href="#" style="color:#999">保暖内衣</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">家居睡衣</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">睡衣套装</a>
										<a    href="#" style="color:#999">家居服</a>
										<a   href="#" style="color:#999">睡裙</a>
										<a  href="#" style="color:#FF0077">情侣睡衣</a>
										<a   href="#" style="color:#999">睡袍</a>
										<a   href="#" style="color:#999">甜美家居服</a>
										<a   href="#" style="color:#FF0077">性感睡衣</a>
										<a    href="#" style="color:#999">珊瑚绒</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">袜子</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">堆堆袜</a>
										<a    href="#" style="color:#999">短袜</a>
										<a   href="#" style="color:#999">瘦腿袜</a>
										<a   href="#" style="color:#999">丝袜</a>
										<a    href="#" style="color:#999">打底袜</a>
										<a    href="#" style="color:#999">中筒袜</a>
										<a   href="#" style="color:#999">船袜</a>
										
									</dd>
								</dl>
							</div>
						</li>


						<li class="nav-li" data-topic="shoes">
							<dl class="nav-wrap">
								<dt>
									<a class="catagory" href="#">女鞋</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">靴子</a>
										<ins></ins>
										<a  href="#">单鞋</a>
										<ins></ins>
										<a href="#">运动鞋</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">女鞋</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">人气热销</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">单鞋</a>
										<a  href="#" style="color:#FF0077">运动鞋</a>
										<a  href="#" style="color:#999">靴子</a>
										<a  href="#" style="color:#999">小白鞋</a>
										<a  href="#" style="color:#999">帆布鞋</a>
										<a    href="#" style="color:#999">厚底鞋</a>
										<a    href="#" style="color:#999">高跟鞋</a>
										<a  href="#" style="color:#999">休闲鞋</a>
										<a  href="#" style="color:#999">一脚蹬</a>
										<a    href="#" style="color:#999">马丁靴</a>
										<a    href="#" style="color:#999">牛津鞋</a>
										<a  href="#" style="color:#999">粗跟鞋</a>

									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">热门推荐</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">当季热卖</a>
										<a    href="#" style="color:#999">厚底运动</a>
										<a   href="#" style="color:#999">及踝靴</a>
										<a  href="#" style="color:#FF0077">英伦靴子</a>
										<a   href="#" style="color:#999">甜美高跟</a>
										<a   href="#" style="color:#999">玛丽珍鞋</a>
										<a   href="#" style="color:#FF0077">学院帆布</a>
										<a    href="#" style="color:#999">尖头单鞋</a>
										<a  href="#" style="color:#999">豆豆鞋</a>
										<a   href="#" style="color:#999">乐福鞋</a>
										<a   href="#" style="color:#999">松糕鞋</a>
										<a    href="#" style="color:#999">坡跟鞋</a>
										<a  href="#" style="color:#999">雪地靴</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">经典直击</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">明星同款</a>
										<a    href="#" style="color:#999">韩版运动</a>
										<a   href="#" style="color:#999">欧美范</a>
										<a   href="#" style="color:#999">情侣款</a>
										<a    href="#" style="color:#999">学生党</a>
										<a    href="#" style="color:#999">原宿风</a>
										<a   href="#" style="color:#999">复古擦色</a>
										<a   href="#" style="color:#FF0077">系带款</a>
										<a    href="#" style="color:#999">舒适平底</a>
										<a    href="#" style="color:#999">学院休闲</a>
										<a   href="#" style="color:#999">名媛淑女</a>
										<a   href="#" style="color:#FF0077">森系清新</a>
									</dd>
								</dl>
							</div>
						</li>

						<li class="nav-li" data-topic="boyfriend">
							<dl class="nav-wrap">
								<dt>
									<a class="catagory"  href="#">男友</a>
								</dt>
								<dd>
									<span>
										<a  class="first" href="#">夹克</a>
										<ins></ins>
										<a  href="#">加厚裤装</a>
										<ins></ins>
										<a  href="#">棉衣</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">男友</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">当季热卖</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">棉衣棉服</a>
										<a  href="#" style="color:#FF0077">牛仔裤</a>
										<a  href="#" style="color:#999">卫衣</a>
										<a  href="#" style="color:#999">夹克</a>
										<a  href="#" style="color:#999">休闲鞋</a>
										<a    href="#" style="color:#999">休闲裤</a>
										<a    href="#" style="color:#999">毛衣针织</a>
										<a  href="#" style="color:#999">绅士皮鞋</a>
										<a  href="#" style="color:#999">时尚套装</a>
										<a    href="#" style="color:#999">男袜</a>
										<a    href="#" style="color:#999">贴身内裤</a>
										<a  href="#" style="color:#999">衬衫</a>
										<a  href="#" style="color:#999">11.11夯货</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">人气单品</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">九分裤</a>
										<a    href="#" style="color:#999">帆布鞋</a>
										<a   href="#" style="color:#999">马丁靴</a>
										<a  href="#" style="color:#FF0077">牛仔外套</a>
										<a   href="#" style="color:#999">风衣</a>
										<a   href="#" style="color:#999">棒球夹克</a>
										<a   href="#" style="color:#FF0077">皮衣</a>
										<a    href="#" style="color:#999">休闲西装</a>
										<a  href="#" style="color:#999">板鞋</a>
										<a   href="#" style="color:#999">运动鞋</a>
										<a   href="#" style="color:#999">西装裤</a>
										<a    href="#" style="color:#999">买就送</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">潮流元素</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">单宁风</a>
										<a    href="#" style="color:#999">约会装</a>
										<a   href="#" style="color:#999">基本款</a>
										<a   href="#" style="color:#999">中国风</a>
										<a    href="#" style="color:#999">最品质</a>
										<a    href="#" style="color:#999">条纹装</a>
										<a   href="#" style="color:#999">印花刺绣</a>
										<a   href="#" style="color:#FF0077">飞行员夹克</a>
										<a    href="#" style="color:#999">连帽服</a>
										<a    href="#" style="color:#999">一脚蹬</a>
										<a   href="#" style="color:#999">束脚裤</a>
										<a   href="#" style="color:#FF0077">破洞风</a>
									</dd>
								</dl>
							</div>
						</li>

						<li class="nav-li" data-topic="bag">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">包包</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">秋上新</a>
										<ins></ins>
										<a   href="#">女包</a>
										<ins></ins>
										<a   href="#">男包</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">包包</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">热门</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">新品</a>
										<a  href="#" style="color:#FF0077">双肩包</a>
										<a  href="#" style="color:#999">斜挎包</a>
										<a  href="#" style="color:#999">手提包</a>
										<a  href="#" style="color:#999">单肩包</a>
										<a    href="#" style="color:#999">百搭大包</a>
										<a    href="#" style="color:#999">迷你小包</a>
										<a  href="#" style="color:#999">旅行箱包</a>
										<a  href="#" style="color:#999">女士钱包</a>
										<a    href="#" style="color:#999">男士钱包</a>
										<a    href="#" style="color:#999">香风链条</a>
										<a  href="#" style="color:#999">手拿包</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">款式</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">双肩包</a>
										<a    href="#" style="color:#999">斜挎包</a>
										<a   href="#" style="color:#999">单肩包</a>
										<a  href="#" style="color:#FF0077">手提包</a>
										<a   href="#" style="color:#999">钱包</a>
										<a   href="#" style="color:#999">旅行箱</a>
										<a   href="#" style="color:#FF0077">手拿包</a>
										<a    href="#" style="color:#999">帆布包</a>
										<a  href="#" style="color:#999">mini小包</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">流行</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">链条包</a>
										<a    href="#" style="color:#999">贝壳包</a>
										<a   href="#" style="color:#999">水桶包</a>
										<a   href="#" style="color:#999">方形包</a>
										<a    href="#" style="color:#999">复古包</a>
										<a    href="#" style="color:#999">卡通包</a>
										<a   href="#" style="color:#999">铆钉包</a>
										<a   href="#" style="color:#FF0077">邮差包</a>
										<a    href="#" style="color:#999">子母包</a>
										<a    href="#" style="color:#999">印花包</a>
										
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="sport">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">运动</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">运动套装</a>
										<ins></ins>
										<a   href="#">运动鞋</a>
										<ins></ins>
										<a   href="#">卫衣</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">运动</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">1111精选</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">运动套装</a>
										<a  href="#" style="color:#FF0077">运动鞋</a>
										<a  href="#" style="color:#999">元气棉服</a>
										<a  href="#" style="color:#999">时尚卫衣</a>
										<a  href="#" style="color:#999">秋冬短靴</a>
										<a    href="#" style="color:#999">跑鞋</a>
										<a    href="#" style="color:#999">棒球衫</a>
										<a  href="#" style="color:#999">帆布鞋</a>
										<a  href="#" style="color:#999">情侣款</a>
										<a    href="#" style="color:#999">双肩包</a>
										<a    href="#" style="color:#999">烧烤用品</a>

										<a  href="#" style="color:#999">衬衫</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">火爆热卖</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">时尚卫衣</a>
										<a    href="#" style="color:#999">人气套装</a>
										<a   href="#" style="color:#999">网红款</a>
										<a  href="#" style="color:#FF0077">小白鞋</a>
										<a   href="#" style="color:#999">跑鞋</a>
										<a   href="#" style="color:#999">瑜伽必备</a>
										<a   href="#" style="color:#FF0077">运动内衣</a>
										<a    href="#" style="color:#999">明星同款</a>
										<a  href="#" style="color:#999">休闲板鞋</a>
										<a   href="#" style="color:#999">运动裤</a>
										<a   href="#" style="color:#999">体重秤</a>
										<a    href="#" style="color:#999">拉力器</a>
										<a   href="#" style="color:#999">小型装备</a>
										<a   href="#" style="color:#999">大型装备</a>
										<a    href="#" style="color:#999">减脂神器</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">品牌专柜</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">耐克</a>
										<a    href="#" style="color:#999">阿迪达斯</a>
										<a   href="#" style="color:#999">匡威</a>
										<a   href="#" style="color:#999">特步</a>
										<a    href="#" style="color:#999">鸿星尔克</a>
										<a    href="#" style="color:#999">乔丹</a>
										<a   href="#" style="color:#999">李宁</a>
										<a   href="#" style="color:#FF0077">法国公鸡</a>
										<a    href="#" style="color:#999">环球</a>
										<a    href="#" style="color:#999">回力</a>
										<a   href="#" style="color:#999">asics</a>
										<a   href="#" style="color:#FF0077">New</a>
										<a   href="#" style="color:#999">花花公子</a>
										<a   href="#" style="color:#FF0077">全部品牌</a>
										<a   href="#" style="color:#FF0077">11.11品牌会场</a>
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="makeups">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">美妆</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">补水保湿</a>
										<ins></ins>
										<a   href="#">面膜</a>
										<ins></ins>
										<a   href="#">BB霜</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">美妆</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">必备护肤</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">保湿补水</a>
										<a  href="#" style="color:#FF0077">美白淡斑</a>
										<a  href="#" style="color:#999">洁面</a>
										<a  href="#" style="color:#999">人气面膜</a>
										<a  href="#" style="color:#999">水乳</a>
										<a    href="#" style="color:#999">眼唇护理</a>
										<a    href="#" style="color:#999">T区护理</a>
										<a  href="#" style="color:#999">护唇膏</a>
										<a  href="#" style="color:#999">精华</a>
										<a    href="#" style="color:#999">护肤套装</a>
										<a    href="#" style="color:#999">防晒</a>

										<a  href="#" style="color:#999">男士护肤</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">潮流彩妆</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">妆前隔离</a>
										<a    href="#" style="color:#999">BB霜</a>
										<a   href="#" style="color:#999">遮瑕粉底</a>
										<a  href="#" style="color:#FF0077">腮红</a>
										<a   href="#" style="color:#999">阴影高光</a>
										<a   href="#" style="color:#999">定妆散粉</a>
										<a   href="#" style="color:#FF0077">口红</a>
										<a    href="#" style="color:#999">眼妆</a>
										<a  href="#" style="color:#999">眉笔</a>
										<a   href="#" style="color:#999">美妆工具</a>
										<a   href="#" style="color:#999">彩妆套装</a>
										<a    href="#" style="color:#999">香水</a>
										<a   href="#" style="color:#999">指甲油</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">个人护理</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">洗发护发</a>
										<a    href="#" style="color:#999">烫染造型</a>
										<a   href="#" style="color:#999">沐浴露</a>
										<a   href="#" style="color:#999">沐浴露</a>
										<a    href="#" style="color:#999">c</a>
										<a    href="#" style="color:#999">全身呵护</a>
										<a   href="#" style="color:#999">手足护理</a>
										<a   href="#" style="color:#FF0077">美胸瘦身</a>
										<a    href="#" style="color:#999">口腔护理</a>
										<a    href="#" style="color:#999">卫生巾</a>
										<a   href="#" style="color:#999">避孕套</a>
										<a   href="#" style="color:#FF0077">情趣用具</a>
										<a   href="#" style="color:#999">脱毛膏</a>
										
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="decoration">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">配饰</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">热卖围巾</a>
										<ins></ins>
										<a   href="#">项链</a>
										<ins></ins>
										<a   href="#">男士配饰</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">配饰</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">秋季新品</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">早秋围巾</a>
										<a  href="#" style="color:#FF0077">手表</a>
										<a  href="#" style="color:#999">锁骨链</a>
										<a  href="#" style="color:#999">帽子</a>
										<a  href="#" style="color:#999">发饰</a>
										<a    href="#" style="color:#999">戒指</a>
										<a    href="#" style="color:#999">眼镜框</a>
										<a  href="#" style="color:#999">耳饰</a>
										<a  href="#" style="color:#999">棒球帽</a>
										<a    href="#" style="color:#999">手链</a>
										<a    href="#" style="color:#999">墨镜</a>

										<a  href="#" style="color:#999">耳钉</a>
										<a    href="#" style="color:#999">男士手表</a>

										<a  href="#" style="color:#999">皮带</a>
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">潮流速递</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">几何项链</a>
										<a    href="#" style="color:#999">情侣手表</a>
										<a   href="#" style="color:#999">银饰</a>
										<a  href="#" style="color:#FF0077">发箍</a>
										<a   href="#" style="color:#999">吊坠</a>
										<a   href="#" style="color:#999">组合戒指</a>
										<a   href="#" style="color:#FF0077">手镯</a>
										<a    href="#" style="color:#999">颈链</a>
										<a  href="#" style="color:#999">渔夫帽</a>
										<a   href="#" style="color:#999">脚链</a>
										<a   href="#" style="color:#999">男士墨镜</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">特色饰品</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">轻奢珠宝</a>
										<a    href="#" style="color:#999">腰带</a>
										<a   href="#" style="color:#999">胸针</a>
										<a   href="#" style="color:#999">假领子</a>
										<a    href="#" style="color:#999">新娘配饰</a>
										<a    href="#" style="color:#999">假发</a>
										<a   href="#" style="color:#999">钥匙扣</a>
										<a   href="#" style="color:#FF0077">纹身贴</a>
										
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="household">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">家居</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">新品</a>
										<ins></ins>
										<a   href="#">四件套</a>
										<ins></ins>
										<a   href="#">小家具</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">家居</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">家纺布艺</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">四件套</a>
										<a  href="#" style="color:#FF0077">秋冬被</a>
										<a  href="#" style="color:#999">沙发垫</a>
										<a  href="#" style="color:#999">抱枕</a>
										<a  href="#" style="color:#999">家居鞋</a>
										<a    href="#" style="color:#999">枕头</a>
										<a    href="#" style="color:#999">地毯地垫</a>
										<a  href="#" style="color:#999">床幔</a>
										<a  href="#" style="color:#999">床垫</a>
										<a    href="#" style="color:#999">坐垫</a>
										<a    href="#" style="color:#999">毯子</a>

										<a  href="#" style="color:#999">窗帘</a>
										<a    href="#" style="color:#999">被套</a>

										<a  href="#" style="color:#999">餐桌布艺</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">家具家饰</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">简易衣柜</a>
										<a    href="#" style="color:#999">墙贴</a>
										<a   href="#" style="color:#999">鞋架</a>
										<a  href="#" style="color:#FF0077">摆件</a>
										<a   href="#" style="color:#999">电脑桌</a>
										<a   href="#" style="color:#999">绿植盆栽</a>
										<a   href="#" style="color:#FF0077">镜子</a>
										<a    href="#" style="color:#999">仿真花</a>
										<a  href="#" style="color:#999">闹钟</a>
										<a   href="#" style="color:#999">相片墙</a>
										<a   href="#" style="color:#999">香薰</a>
										<a    href="#" style="color:#999">衣帽架</a>
										<a   href="#" style="color:#999">花架</a>
										<a   href="#" style="color:#999">DIY</a>
										<a    href="#" style="color:#999">鲜花速递</a>
										<a   href="#" style="color:#999">沙发</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">美味厨房</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">锅具</a>
										<a    href="#" style="color:#999">碗</a>
										<a   href="#" style="color:#999">叉勺筷</a>
										<a   href="#" style="color:#999">调味罐</a>
										<a    href="#" style="color:#999">c</a>
										<a    href="#" style="color:#999">饭盒</a>
										<a   href="#" style="color:#999">烘焙器具</a>
										<a   href="#" style="color:#FF0077">保鲜罐</a>
										<a    href="#" style="color:#999">围裙</a>
										<a    href="#" style="color:#999">厨房小家电</a>
										<a   href="#" style="color:#999">厨房清洁</a>
										<a   href="#" style="color:#FF0077">橡胶手套</a>
										<a   href="#" style="color:#999">隔热手套</a>
										
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="baby">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">母婴</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">秋季热销</a>
										<ins></ins>
										<a   href="#">童装</a>
										<ins></ins>
										<a   href="#">孕妇装</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">母婴</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">当季热卖</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">男童装</a>
										<a  href="#" style="color:#FF0077">女童装</a>
										<a  href="#" style="color:#999">轻薄外套</a>
										<a  href="#" style="color:#999">童裤</a>
										<a  href="#" style="color:#999">孕妇连衣裙</a>
										<a    href="#" style="color:#999">孕妇装</a>
										<a    href="#" style="color:#999">运动鞋</a>
										<a  href="#" style="color:#999">帆布鞋</a>
										<a  href="#" style="color:#999">家居服</a>
										<a    href="#" style="color:#999">益智早教</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">流行精选母婴</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">儿童套装</a>
										<a    href="#" style="color:#999">卫衣</a>
										<a   href="#" style="color:#999">打底裤</a>
										<a  href="#" style="color:#FF0077">单鞋</a>
										<a   href="#" style="color:#999">亲子装</a>
										<a   href="#" style="color:#999">孕妇套装</a>
										<a   href="#" style="color:#FF0077">衬衫</a>
										<a    href="#" style="color:#999">袜子</a>
										<a  href="#" style="color:#999">孕产洗护</a>
										<a   href="#" style="color:#999">孕妇裤</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">经典必备</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">新生儿</a>
										<a    href="#" style="color:#999">T恤</a>
										<a   href="#" style="color:#999">婴儿礼盒</a>
										<a   href="#" style="color:#999">待产包</a>
										<a    href="#" style="color:#999">托腹裤</a>
										<a    href="#" style="color:#999">哺乳内衣</a>
										<a   href="#" style="color:#999">童车</a>
										<a   href="#" style="color:#FF0077">婴儿床品</a>
										<a    href="#" style="color:#999">连体衣</a>
										<a    href="#" style="color:#999">月子服</a>
										
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="food">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">食品</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">休闲食品</a>
										<ins></ins>
										<a   href="#">进口食品</a>
										<ins></ins>
										<a   href="#">肉食</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">食品</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">茶酒饮料</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">咖啡</a>
										<a  href="#" style="color:#FF0077">冲饮谷物</a>
										<a  href="#" style="color:#999">花草茶</a>
										<a  href="#" style="color:#999">饮料</a>
										<a  href="#" style="color:#999">冲饮</a>
										<a    href="#" style="color:#999">果味茶饮</a>
										<a    href="#" style="color:#999">酒类</a>
										<a  href="#" style="color:#999">早餐茶饮</a>
										<a  href="#" style="color:#999">代餐粉粉</a>
										
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">进口食品</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">韩国</a>
										<a    href="#" style="color:#999">日本</a>
										<a   href="#" style="color:#999">东南亚</a>
										<a  href="#" style="color:#FF0077">进口饼干</a>
										<a   href="#" style="color:#999">进口糕点</a>
										<a   href="#" style="color:#999">进口糖巧</a>
										<a   href="#" style="color:#FF0077">进口水饮</a>
										<a    href="#" style="color:#999">泰国</a>
									
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">休闲零食</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">饼干</a>
										<a    href="#" style="color:#999">糕点</a>
										<a   href="#" style="color:#999">糖果</a>
										<a   href="#" style="color:#999">蜜饯</a>
										<a    href="#" style="color:#999">坚果</a>
										<a    href="#" style="color:#999">肉铺肉食</a>
										<a   href="#" style="color:#999">巧克力</a>
										<a   href="#" style="color:#FF0077">膨化食品</a>
										<a    href="#" style="color:#999">零食大礼包</a>
										<a    href="#" style="color:#999">方便速食</a>
										<a    href="#" style="color:#999">曲奇</a>
									</dd>
								</dl>
							</div>
						</li>
						<li class="nav-li" data-topic="merchandise">
							<dl class="nav-wrap">
								<dt>
									<a  class="catagory"  href="#">百货</a>
								</dt>
								<dd>
									<span>
										<a  class="first"  href="#">新品</a>
										<ins></ins>
										<a   href="#">玻璃杯</a>
										<ins></ins>
										<a   href="#">雨伞</a>
									</span>
								</dd>
							</dl>
							<div data-ban="ban-menu"class="nav-more"style="display:none;">
								<h2>
									<a   href="#">百货</a>
								</h2>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">生活小物</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#FF0077">保温杯</a>
										<a  href="#" style="color:#FF0077">晴雨伞</a>
										<a  href="#" style="color:#999">玻璃杯</a>
										<a  href="#" style="color:#999">毛绒玩具</a>
										<a  href="#" style="color:#999">心机小物</a>
										<a    href="#" style="color:#999">衣物护理工具</a>
										<a    href="#" style="color:#999">防护用品</a>
										<a  href="#" style="color:#999">家务清洁</a>
										<a  href="#" style="color:#999">毛巾/浴巾</a>
										<a    href="#" style="color:#999">情趣内衣</a>
										<a    href="#" style="color:#999">纸品洗液</a>
										<a  href="#" style="color:#999">餐具</a>
										<a  href="#" style="color:#999">文具纸本</a>
										
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">收纳控</a>
									</dt>
									<dd class="more-list">
										<a  href="#" style="color:#999">收纳盒</a>
										<a    href="#" style="color:#999">收纳箱</a>
										<a   href="#" style="color:#999">收纳袋</a>
										<a  href="#" style="color:#FF0077">首饰盒</a>
										<a   href="#" style="color:#999">桌面收纳</a>
										<a   href="#" style="color:#999">纸巾盒</a>
										<a   href="#" style="color:#FF0077">内衣收纳</a>
										<a    href="#" style="color:#999">脏衣篓</a>
										<a   href="#" style="color:#999">鞋盒</a>
										<a   href="#" style="color:#999">化妆品收纳</a>
										<a   href="#" style="color:#FF0077">挂钩</a>
										<a    href="#" style="color:#999">防尘袋</a>
									
									</dd>
								</dl>
								<dl class="nav-more-wrap">
									<dt>
										<a   href="#">手机数码</a>
									</dt>
									<dd class="more-list">
										<a   href="#" style="color:#FF0077">手机</a>
										<a    href="#" style="color:#999">手机壳</a>
										<a   href="#" style="color:#999">耳机</a>
										<a   href="#" style="color:#999">蜜饯</a>
										<a    href="#" style="color:#999">智能手环</a>
										<a    href="#" style="color:#999">移动电源</a>
										<a   href="#" style="color:#999">手机贴膜</a>
										<a   href="#" style="color:#FF0077">自拍杆</a>
										<a    href="#" style="color:#999">U盘</a>
										<a    href="#" style="color:#999">手机支架</a>
										<a    href="#" style="color:#999">小音箱</a>
										<a    href="#" style="color:#999">数据线</a>
										<a    href="#" style="color:#999">鼠标</a>
									</dd>
								</dl>
							</div>
						</li>
					</ul>				
				</div>
			</div>
			<div id="banner-box"class="banner-box clearfix">
				<div class="banner-button">
					<ul>
						<li data-bi="1">
							<img data-btn="1"src="./banner/button.png" alt="">
						</li>
						<li data-bi="2">
							<img data-btn="2"src="./banner/button.png" alt="">
						</li>
						<li data-bi="3">
							<img data-btn="3"src="./banner/button.png" alt="">
						</li>
						<li data-bi="4">
							<img data-btn="4"src="./banner/button.png" alt="">
						</li>
						<li data-bi="5">
							<img data-btn="5"src="./banner/button.png" alt="">
						</li>
						<li data-bi="6">
							<img data-btn="6"src="./banner/button.png" alt="">
						</li>
						<li data-bi="7">
							<img data-btn="7"src="./banner/button.png" alt="">
						</li>
					</ul>
				</div>
				<div class="banner-img"id="banner-img">
					<a href="javascript:void(0);"data-bi="1"style="display: block;">
						<img src="./banner/1.jpg" alt="">
					</a>
					<a href="javascript:void(0);"data-bi="2">
						<img src="./banner/2.jpg" alt="">
					</a>
					<a href="javascript:void(0);"data-bi="3">
						<img src="./banner/3.jpg" alt="">
					</a>
					<a href="javascript:void(0);"data-bi="4">
						<img src="./banner/4.jpg" alt="">
					</a>
					<a href="javascript:void(0);"data-bi="5">
						<img src="./banner/5.jpg" alt="">
					</a>
					<a href="javascript:void(0);"data-bi="6">
						<img src="./banner/6.jpg" alt="">
					</a>
					<a href="javascript:void(0);"data-bi="7">
						<img src="./banner/7.jpg" alt="">
					</a>
				</div>
			</div>
			<div class="user_info fl">
				<a  href="#" class="avatar"></a>
				<div class="welcome">
					<p class="txt"><a href="" style="color:red;font-size: 15px">${loginUser.username}</a></p>
					<p class="name" style="color:blue">欢迎来逛蘑菇街~</p>
					
				</div>

				<!-- 未登录 -->
				<c:if test="${empty loginUser}">
				<a  href="#" class="login_btn" style="display: block;">
					<span>登录</span>
				</a>
				
				<div class="register" style="display: block;">
					<a href="#">免费注册</a>
					<a  href="#">开小店</a>
				</div>
				
				</c:if>
				<div class="foot_wrapper">
					<div class="propaganda">
						<p>上万网红在APP教你搭配和化妆</p>
					</div>
					<div class="live_show" style="background-image: url(./images/yhtu.gif);">
						<img class="yh-qrCode" src="./images/yhqr.png" style="display: none;"> 
					</div>
					<div class="info">
						<span>手机专属功能</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--头部轮播结束-->
	<div class="storey">
		<div class="floor-item"data-fl="0">蘑菇优选</div>
		<div class="floor-item"data-fl="1">品牌精选</div>
		<div class="floor-item"data-fl="2">潮流女装</div>
		<div class="floor-item"data-fl="3">人气美鞋</div>
		<div class="floor-item"data-fl="4">绝配男友</div>
		<div class="floor-item"data-fl="5">箱包美学</div>
		<div class="floor-item"data-fl="6">时髦运动</div>
		<div class="floor-item"data-fl="7">护肤彩妆</div>
		<div class="floor-item"data-fl="8">品质家居</div>
		<div class="floor-item"data-fl="9">辣妈潮宝</div>
		<div class="floor-item"data-fl="10">食品</div>
		<div class="floor-item"data-fl="11">猜你喜欢</div>
	</div>
	<!--主体部分开始-->
	<div class="body-wrap clearfix">
		<div class="wrap clearfix">
			<!--会场菜单开始-->
			<div class="conference-menu" id="conference-menu">
				<ul>
					<li>
						<a href="#">
							<img src="./banner/hc1.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc2.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc3.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc4.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc5.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc6.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc7.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc8.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc9.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc10.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc11.png" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/hc12.png" alt="">
						</a>
					</li>
				</ul>
			</div>
			<!--会场菜单结束-->
			<!--团购开始-->
			<div class="tuangou">
				<div class="tuangou-big">
					<a href="#">
						<div class="tg-tilte"style="position: absolute;top: 10px;width: 105px;height: 22px;font-size:20px;font-weight:600;z-index: 2;left: 20px;color: #000;">
							团购热卖
						</div>
						<div class="tg-sub-title1"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 45px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							每一款都质检
						</div>
						<div class="tg-sub-title2"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 66px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							要买就买有保障的
						</div>
						<img id="tg1"src="./banner/tg1.png" >
					</a>
					<a href="#"class="tg">
						<div class="tg-tilte"style="position: absolute;top: 10px;width: 105px;height: 22px;font-size:20px;font-weight:600;z-index: 2;left: 20px;color: #000;">
							现实快抢
						</div>
						<div class="tg-sub-title1"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 45px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							品质精选
						</div>
						<div class="tg-sub-title2">
							<span class="ct_num hh"id="hou">00</span>
							:
							<span class="ct_num hh"id="min">00</span>
							:
							<span class="ct_num hh"id="sec">00</span>
						</div>
						<img id="tg2"src="./banner/tg2.png" alt="">
					</a>
				</div>
				<div class="tuangou-small">
					<a  class="xp"href="#">
						<div class="tg-tilte"style="position: absolute;top: 10px;width: 105px;height: 22px;font-size:20px;font-weight:600;z-index: 2;left: 20px;color: #000;">
							新品发现
						</div>
						<div class="tg-sub-title1"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 45px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							潮流风向标
						</div>
						<div class="tg-sub-title2"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 66px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							SHOW
						</div>
						<img id="tg3"src="./banner/tg3.png" alt="">
					</a>
					<a class="cl"href="#">
						<div class="tg-tilte"style="position: absolute;top: 10px;width: 105px;height: 22px;font-size:20px;font-weight:600;z-index: 2;left: 20px;color: #000;">
							潮流女装
						</div>
						<div class="tg-sub-title1"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 45px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							美衣
						</div>
						<div class="tg-sub-title2"style="position:absolute;width:140px;font-weight:600;height: 20px;top: 66px;left:20px;font-size: 15px;overflow: hidden;z-index: 2;color: #935c3d;">
							人气精选
						</div>
						<img id="tg4"src="./banner/tg4.png" alt="">
					</a>
				</div>
				<div class="tg-qr">
					<a href="#"></a>
				</div>
			</div>
			<!--团购结束-->
			<!--进入清单开始-->
			<div class="inventory clearfix">
				<ul>
					<li>
						<a href="#">
							<img src="./banner/jr1.jpg" alt="">
							<div class="invent-title">超级舒服的20款软绵绵的单品</div>
							<div class="jingru">进入清单&gt;</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/jr2.jpg" alt="">
							<div class="invent-title">秒杀“少女心”的温暖可爱系床品</div>
							<div class="jingru">进入清单&gt;</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/jr3.jpg" alt="">
							<div class="invent-title">做坚果达人，吃各种坚果好货</div>
							<div class="jingru">进入清单&gt;</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./banner/jr4.jpg" alt="">
							<div class="invent-title">小白鞋out!20款新晋运动鞋曝光</div>
							<div class="jingru">进入清单&gt;</div>
						</a>
					</li>
				</ul>
			</div>
			<!--进入清单结束-->
			<!--蘑菇优选开始-->
			<div class="optimum-warp clearfix"data-flindex="0">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/yx1.jpg">
						<div class="opt-title">
							蘑菇优选
						</div>
						<div class="opt-sub-title">11.11 品质精选</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/yx2.jpg">
						<div class="tj-title">
							口碑推荐
						</div>
						<div class="tj-sub-title">双十一必BUY精选</div>
					</a>
				</div>
				<div class="optimum-mid">
					<a href="#" class="optimum-a">
						<img src="./banner/yx3.jpg">
						<div class="tj-title">
							名品制造
						</div>
						<div class="tj-sub-title">MUJI等制造商 19元起</div>
					</a>
					<a href="#"class="optimum-a">
						<img src="./banner/yx4.jpg">
						<div class="tj-title">
							进口好物
						</div>
						<div class="tj-sub-title">国际品牌进口 29元起</div>
					</a>
				</div>
				<div class="optimum-right">
					<a href="#"class="optimum-a1">
						<img src="./banner/yx5.jpg">
						<div class="tj-title">
							买一送一
						</div>
						<div class="tj-sub-title">天然乳胶枕超值特惠</div>
					</a>
					<a href="#"class="optimum-a1">
						<img src="./banner/yx6.jpg">
						<div class="tj-title">
							口碑热卖
						</div>
						<div class="tj-sub-title">双11好货清单</div>
					</a>
					<a href="#"class="optimum-a1">
						<img src="./banner/yx7.jpg">
						<div class="tj-title">
							明星同款
						</div>
						<div class="tj-sub-title">李易峰TVC同款预售</div>
					</a>
					<a href="#"class="optimum-a1">
						<img src="./banner/yx8.jpg">
						<div class="tj-title">
							套装优选
						</div>
						<div class="tj-sub-title">双11专供组合</div>
					</a>
				</div>
			</div>
			<!--蘑菇优选结束-->
			<!--品牌精选开始-->
			<div class="optimum-warp clearfix"data-flindex="1">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/jx1.png">
						<div class="opt-title">
							品牌精选
						</div>
						<div class="opt-sub-title">大牌好货 初秋焕新</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/jx2.png">
						<div class="tj-title">
							女装
						</div>
						<div class="tj-sub-title"style="color:#a4e;">百搭潮流 初秋尝新</div>
					</a>
				</div>
				<div class="optimum-mid jingping-mid">
					<a href="#" class="optimum-a">
						<img src="./banner/jx3.jpg">
						<div class="tj-title">
							美妆
						</div>
						<div class="tj-sub-title"style="color:#a4e;">11.11狂欢 美颜焕新</div>
					</a>
					<a href="#"class="optimum-a">
						<img src="./banner/jx4.jpg">
						<div class="tj-title">
							女鞋
						</div>
						<div class="tj-sub-title"style="color:#a4e;">热门鞋款 初秋赏新</div>
					</a>
				</div>
				<div class="jingping-right">
					<a href="#">
						<img src="./banner/jx5.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx6.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx7.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx8.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx9.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx10.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx11.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx12.jpg">
					</a>
					<a href="#">
						<img src="./banner/jx13.jpg">
					</a>
				</div>
			</div>
			<!--品牌精选结束-->
			<!--潮流女装开始-->
			<div class="optimum-warp clearfix"data-flindex="2">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/cl1.jpg">
						<div class="opt-title">
							潮流女装
						</div>
						<div class="opt-sub-title">11.11冬装抢购</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/cl2.jpg">
						<div class="tj-title">
							上衣
						</div>
						<div class="tj-sub-title"style="color:#f58;">5折美衣特惠疯抢</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/cl3.jpg">
						<div class="tj-title">
							裙子
						</div>
						<div class="tj-sub-title"style="color:#f58;">59元美裙嗨购</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/cl4.jpg">
						<div class="tj-title">
							裤子
						</div>
						<div class="tj-sub-title"style="color:#f58;">心机显瘦必备</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/cl5.jpg">
						<div class="tj-title">
							时尚套装
						</div>
						<div class="tj-sub-title"style="color:#f58;">超值省心搭配</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/cl6.jpg">
						<div class="tj-title">
							内衣
						</div>
						<div class="tj-sub-title" style="color:#f58;">39元轻松升杯</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/cl7.jpg">
						<div class="bottom-title">
							毛呢外套
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/cl8.jpg">
						<div class="bottom-title">
							毛衣
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/cl9.jpg">
						<div class="bottom-title">
							新款棉服
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/cl10.jpg">
						<div class="bottom-title">
							时尚套装
						</div>
					</a>
				</div>
			</div>	
			<!--潮流女装结束-->
			<!--人气美鞋开始-->
			<div class="optimum-warp clearfix"data-flindex="3">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/mx1.jpg">
						<div class="opt-title">
							人气美鞋
						</div>
						<div class="opt-sub-title">新外貌“鞋”会</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/mx2.png">
						<div class="tj-title">
							女鞋抢新
						</div>
						<div class="tj-sub-title"style="color:#f92;">10000双新靴上架</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/mx3.png">
						<div class="tj-title">
							焕新美鞋
						</div>
						<div class="tj-sub-title"style="color:#f92;">切尔西靴回潮</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/mx4.png">
						<div class="tj-title">
							单鞋
						</div>
						<div class="tj-sub-title"style="color:#f92;">明星同款抢鲜</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/mx5.png">
						<div class="tj-title">
							运动鞋
						</div>
						<div class="tj-sub-title"style="color:#f92;">39元起</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/mx6.png">
						<div class="tj-title">
							厚底鞋
						</div>
						<div class="tj-sub-title" style="color:#f92;">秋冬增高利器</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/mx7.png">
						<div class="bottom-title">
							厚底鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/mx8.png">
						<div class="bottom-title">
							休闲鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/mx9.png">
						<div class="bottom-title">
							高跟
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/mx10.png">
						<div class="bottom-title">
							一脚蹬
						</div>
					</a>
				</div>
			</div>
			<!--人气美鞋结束-->
			<!--绝配男友开始-->
			<div class="optimum-warp clearfix"data-flindex="4">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/jp1.jpg">
						<div class="opt-title">
							绝配男友
						</div>
						<div class="opt-sub-title">3折起 全宇宙时髦单品</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/jp2.jpg">
						<div class="tj-title">
							绝配男友
						</div>
						<div class="tj-sub-title"style="color:#57f;">万件新品 尖货集中营</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/jp3.jpg">
						<div class="tj-title">
							上衣
						</div>
						<div class="tj-sub-title"style="color:#57f;">早秋新装GO></div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/jp4.jpg">
						<div class="tj-title">
							裤装
						</div>
						<div class="tj-sub-title"style="color:#57f;">腿长出天际</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/jp5.jpg">
						<div class="tj-title">
							男鞋
						</div>
						<div class="tj-sub-title"style="color:#57f;">“鞋”门秘籍</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/jp6.jpg">
						<div class="tj-title">
							39元起
						</div>
						<div class="tj-sub-title" style="color:#57f;">神级单品 百种优惠</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/jp7.jpg">
						<div class="bottom-title">
							男鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/jp8.jpg">
						<div class="bottom-title">
							贴身私物
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/jp9.jpg">
						<div class="bottom-title">
						连帽服
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/jp10.jpg">
						<div class="bottom-title">
							运动裤
						</div>
					</a>
				</div>
			</div>
			<!--绝配男友结束-->
			<!--箱包美学开始-->
			<div class="optimum-warp clearfix"data-flindex="5">
				<div class="optimum-left"id="xb-left">
					<a href="#" >
						<img src="./banner/xb1.jpg">
						<div class="opt-title">
							箱包美学
						</div>
						<div class="opt-sub-title">秋季新款，3折开抢</div>
						<div class="opt-look">去看看</div>
					</a>
				</div>
				<div class="optimum-mid"id="xb-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/xb2.jpg">
						<div class="tj-title">
							双肩包
						</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/xb3.jpg">
						<div class="tj-title">
							斜挎包
						</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/xb4.jpg">
						<div class="tj-title">
							手提包
						</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/xb5.jpg">
						<div class="tj-title">
							单肩包
						</div>
					</a>
				</div>
				<div class="optimum-mid2">
					<a href="#">
						<img src="./banner/xb6.jpg">
					</a>
				</div>
				<div class="optimum-right cl-right"id="wj">
					<a href="#"id="hanban">
						<img src="./banner/xb7.jpg">
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/xb8.jpg">
						<div class="bottom-title">
						秋款围巾
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/xb10.jpg">
						<div class="bottom-title">
							锁骨链
						</div>
					</a>
				</div>
			</div>
			<!--箱包美学结束-->
			<!--时髦运动开始-->
			<div class="optimum-warp clearfix"data-flindex="6">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/sm1.jpg">
						<div class="opt-title">
							时髦运动
						</div>
						<div class="opt-sub-title">秋季甩膘必杀技</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/sm2.jpg">
						<div class="tj-title">
							品牌精选
						</div>
						<div class="tj-sub-title"style="color:#64f;">国际国内一线大牌</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/sm3.jpg">
						<div class="tj-title">
							运动鞋
						</div>
						<div class="tj-sub-title"style="color:#64f;">品牌直降99</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/sm4.jpg">
						<div class="tj-title">
							运动套装
						</div>
						<div class="tj-sub-title"style="color:#64f;">省钱更省心</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/sm5.jpg">
						<div class="tj-title">
							棉衣/羽绒
						</div>
						<div class="tj-sub-title"style="color:#64f;">暖心让利99元</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/sm6.jpg">
						<div class="tj-title">
							卫衣/外套
						</div>
						<div class="tj-sub-title" style="color:#64f;">趋势都在这里</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/sm7.png">
						<div class="bottom-title">
							帆布鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/sm8.png">
						<div class="bottom-title">
							板鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/sm9.png">
						<div class="bottom-title">
						休闲鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/sm10.png">
						<div class="bottom-title">
							跑鞋
						</div>
					</a>
				</div>
			</div>
			<!--时髦运动结束-->
			<!--护肤彩妆开始-->
			<div class="optimum-warp clearfix"data-flindex="7">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/hf1.png">
						<div class="opt-title">
							护肤彩妆
						</div>
						<div class="opt-sub-title">秋妆必买清单 低至3折</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/hf2.jpg">
						<div class="tj-title">
							护肤彩妆
						</div>
						<div class="tj-sub-title"style="color:#e6e;">品牌特惠低至1折</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/hf3.jpg">
						<div class="tj-title">
							热销面膜
						</div>
						<div class="tj-sub-title"style="color:#e6e;">敷出水嫩润白肌</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/hf4.jpg">
						<div class="tj-title">
							流行彩妆
						</div>
						<div class="tj-sub-title"style="color:#e6e;">打造元气妆容</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/hf5.jpg">
						<div class="tj-title">
							滋润洗护
						</div>
						<div class="tj-sub-title"style="color:#e6e;">秋冬滋润进行时</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/hf6.jpg">
						<div class="tj-title">
							特惠套装
						</div>
						<div class="tj-sub-title" style="color:#e6e;">全套护肤更有效</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/hf7.jpg">
						<div class="bottom-title">
							补水保湿
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/hf8.jpg">
						<div class="bottom-title">
							收缩毛孔
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/hf9.jpg">
						<div class="bottom-title">
						美白淡斑
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/hf10.jpg">
						<div class="bottom-title">
							清洁卸妆
						</div>
					</a>
				</div>
			</div>
			<!--护肤彩妆结束-->
			<!--品质家具开始-->
			<div class="optimum-warp clearfix"data-flindex="8">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/jj1.png">
						<div class="opt-title">
							品质家居
						</div>
						<div class="opt-sub-title">-好生活并不贵-</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/jj2.jpg">
						<div class="tj-title">
							趣味家居
						</div>
						<div class="tj-sub-title"style="color:#4b7;">给家换秋装</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/jj3.jpg">
						<div class="tj-title">
							百货
						</div>
						<div class="tj-sub-title"style="color:#4b7;">收纳新法则</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/jj4.jpg">
						<div class="tj-title">
							家用电器
						</div>
						<div class="tj-sub-title"style="color:#4b7;">高颜值卷发棒</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/jj5.jpg">
						<div class="tj-title">
							手机数码
						</div>
						<div class="tj-sub-title"style="color:#4b7;">V脸自拍秘诀</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/jj6.jpg">
						<div class="tj-title">
							寝室小家
						</div>
						<div class="tj-sub-title" style="color:#4b7;">V脸自拍秘诀</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/jj7.jpg">
						<div class="bottom-title">
							四件套
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/jj8.jpg">
						<div class="bottom-title">
							贴心暖被
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/jj9.jpg">
						<div class="bottom-title">
						棉拖鞋
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/jj10.jpg">
						<div class="bottom-title">
							换季收纳
						</div>
					</a>
				</div>
			</div>
			<!--品质家具结束-->
			<!--辣妈潮宝开始-->
			<div class="optimum-warp clearfix"data-flindex="9">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/lm1.png">
						<div class="opt-title">
							辣妈潮宝
						</div>
						<div class="opt-sub-title">－品质精选，裸价回馈－</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/lm2.png">
						<div class="tj-title">
							童装
						</div>
						<div class="tj-sub-title"style="color:#f4b;">必买好货秋上新</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/lm3.png">
						<div class="tj-title">
							小公主
						</div>
						<div class="tj-sub-title"style="color:#f4b;">秋季美美的</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/lm4.png">
						<div class="tj-title">
							小王子
						</div>
						<div class="tj-sub-title"style="color:#f4b;">帅气时尚酷酷的</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/lm5.png">
						<div class="tj-title">
							时髦孕妈
						</div>
						<div class="tj-sub-title"style="color:#f4b;">女人最美的时刻</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/lm6.png">
						<div class="tj-title">
							舒适童鞋
						</div>
						<div class="tj-sub-title" style="color:#f4b;">帮宝宝走更好的路</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/lm7.png">
						<div class="bottom-title">
							妈咪套装
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/lm8.png">
						<div class="bottom-title">
							外套
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/lm9.png">
						<div class="bottom-title">
						儿童套装
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/lm10.png">
						<div class="bottom-title">
							益智早教
						</div>
					</a>
				</div>
			</div>
			<!--辣妈潮宝结束-->
			<!--食品开始-->
			<div class="optimum-warp clearfix"data-flindex="10">
				<div class="optimum-left">
					<a href="#" >
						<img src="./banner/sp1.jpg">
						<div class="opt-title">
							食品
						</div>
						<div class="opt-sub-title">进口食品9.9元起</div>
						<div class="opt-look">去看看</div>
					</a>
					<a href="#">
						<img src="./banner/sp2.png">
						<div class="tj-title">
							好吃不胖
						</div>
						<div class="tj-sub-title"style="color:#0c8;">1折治愈 假期综合症</div>
					</a>
				</div>
				<div class="optimum-mid cl-mid">
					<a href="#"class="optimum-a2">
						<img src="./banner/sp3.png">
						<div class="tj-title">
							爆款零食
						</div>
						<div class="tj-sub-title"style="color:#0c8;">疯抢10000+</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/sp4.png">
						<div class="tj-title">
							元气茶饮
						</div>
						<div class="tj-sub-title"style="color:#0c8;">下半年瘦10斤</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/sp5.png">
						<div class="tj-title">
							新品闪购
						</div>
						<div class="tj-sub-title"style="color:#0c8;">6元包邮尝新品</div>
					</a>
					<a href="#"class="optimum-a2">
						<img src="./banner/sp6.jpg">
						<div class="tj-title">
							囤零食
						</div>
						<div class="tj-sub-title" style="color:#0c8;">零食礼包开仓！</div>
					</a>
				</div>
				<div class="optimum-right cl-right">
					<a href="#" class="optimum-a3">
						<img src="./banner/sp7.jpg">
						<div class="bottom-title">
							49.9专区
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/sp8.jpg">
						<div class="bottom-title">
							39.9专区
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/sp9.jpg">
						<div class="bottom-title">
						29.9专区
						</div>
					</a>
					<a href="#"class="optimum-a3">
						<img src="./banner/sp10.jpg">
						<div class="bottom-title">
							19.9专区
						</div>
					</a>
				</div>
			</div>
			<!--食品结束-->
			<!--猜你喜欢开始-->
			<div class="guess-wrap clearfix"data-flindex="11">
				<div class="guess">
					<img src="./banner/guess.png" alt="">
				</div>
				<div class="goods-list-mod clearfix"id="goods-list-mod">
					<div class="goods-item"data-index="0">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/1.jpg" alt="">
							<p class="vis-title">韩版甜美淑女风纯色翻领双排扣七分荷叶袖宽松显瘦中长款毛呢外套</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">韩版甜美淑女风纯色翻领双排扣七分荷叶袖宽松显瘦中长款毛呢外套</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥139.3</b>
								<span class="fav-num">
									173
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="1">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/2.jpg" alt="">
							<p class="vis-title">2016夏季新款伴娘团礼服短款姐妹裙伴娘服伴娘裙小礼服毕业晚</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">2016夏季新款伴娘团礼服短款姐妹裙伴娘服伴娘裙小礼服毕业晚</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥98.7</b>
								<span class="fav-num">
									408
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="2">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/3.jpg" alt="">
							<p class="vis-title">红米note手机壳红米note2软硅胶红米1S保护套卡通防摔</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">红米note手机壳红米note2软硅胶红米1S保护套卡通防摔</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
								<img src="./images/xinping.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥11.2</b>
								<span class="fav-num">
									4
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="3">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/4.jpg" alt="">
							<p class="vis-title">2016冬装新款宽松加厚羊羔毛牛仔外套棉衣女</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">2016冬装新款宽松加厚羊羔毛牛仔外套棉衣女</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥98.6</b>
								<span class="fav-num">
									19619
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="4">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/5.gif" alt="">
							<p class="vis-title">2016秋装新款女装韩版宽松长袖英伦中长款风衣外套</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">2016秋装新款女装韩版宽松长袖英伦中长款风衣外套</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
								<img src="./images/pingpai_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥99.4</b>
								<span class="fav-num">
									2855
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="5">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/6.jpg" alt="">
							<p class="vis-title">秋冬新款小款上衣甜美可爱韩版学生装学院风显瘦短版休闲卫衣女装</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">秋冬新款小款上衣甜美可爱韩版学生装学院风显瘦短版休闲卫衣女装</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥69</b>
								<span class="fav-num">
									952
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="6">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/7.jpg" alt="">
							<p class="vis-title">威士忌棕色迷你方形小包 复古定型斜挎包</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">威士忌棕色迷你方形小包 复古定型斜挎包</p>
							<p class="icon-leftbottom">
								<img src="./images/pingpai_60x36.png" alt="">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥52</b>
								<span class="fav-num">
									4706

									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="7">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/8.jpg" alt="">
							<p class="vis-title">秋冬装新款连帽拼色茧型拼接呢料短款外套棉服女</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">秋冬装新款连帽拼色茧型拼接呢料短款外套棉服女</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥126</b>
								<span class="fav-num">
									2479
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="8">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/9.jpg" alt="">
							<p class="vis-title">龙灵家 名媛气质亮闪闪大V露背蓬蓬高腰伴娘礼服连衣裙</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">龙灵家 名媛气质亮闪闪大V露背蓬蓬高腰伴娘礼服连衣裙</p>
							<p class="icon-leftbottom">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥68.6</b>
								<span class="fav-num">
									147
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
					<div class="goods-item"data-index="9">
						<div class="border_top"></div>
	        			<div class="border_right"></div>
	        			<div class="border_bottom"></div>
	        			<div class="border_left"></div>
						<a href="javascript:void(0)" class="goods-img">
							<span class="icon-lefttop">
								<img src="./images/1111.png" alt="">
							</span>
							<img src="./goods-image/10.gif" alt="">
							<p class="vis-title">秋季裙子套装韩版宽松蝙蝠长袖粗线套头毛衣+勾花镂空蕾丝连衣裙</p>
						</a>
						<a href="javascript:void(0)"class="goods-info-box">
							<p class="goods-title">秋季裙子套装韩版宽松蝙蝠长袖粗线套头毛衣+勾花镂空蕾丝连衣裙</p>
							<p class="icon-leftbottom">
								<img src="./images/remai_60x36.png" alt="">
								<img src="./images/liangping_60x36.png" alt="">
							</p>
							<div class="goods-info-dis">
								<b class="price-info">¥59</b>
								<span class="fav-num">
									9642
									<img src="./goods-image/start.png" alt="">
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="more-goods">
					<a href="javascript:void(0)">点击加载更多&gt;&gt;</a>
				</div>
			</div>
			<!--猜你喜欢结束-->
		</div>
	</div>
	<!--主体部分结束-->

	<!--页脚开始-->
	<div class="footer clearfix">
		<div class="footer-wrap">
			<!--左边开始-->
			<div class="footer-info">
				<a href="#">
					<img src="./images/logo.png" alt="">
				</a>
				<div class="footer-info-text">
					<p>
						营业执照注册号：
						<a  href="#" >330106000129004</a>
					</p>
					<p>
						增值电信业务经营许可证：
						<a   href="#">浙B2-20110349</a>
					</p>
					<p style="height: auto">
						网络文化经营许可证：
						<a   href="#">浙网文（2016）0349-219号</a>
					</p>
					<p>
						<a   href="#">安全责任书</a>
					</p>
					<p>
                   	 	<a  href="#" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">
                        	<img src="./images/jinghui_20x20.png" style="float:left;">
                        	<span style="color: #999;">&nbsp;浙公网安备 33010602002329号</span>
                    	</a>
                	</p>
                	<p class="mogujiecom">©2016 Mogujie.com 杭州卷瓜网络有限公司</p>
				</div>
			</div>
			<!--左边结束-->

			<!--中间开始-->
			<div class="footer-link">
				<dl>
					<dt>公司</dt>
					<dd><a href="#">关于我们</a></dd>
					<dd><a href="#">招聘信息</a></dd>
					<dd><a href="#">联系我们</a></dd>
				</dl>
				<dl>
					<dt>消费者</dt>
					<dd><a href="#">消费者服务</a></dd>
					<dd><a href="#">意见反馈</a></dd>
					<dd><a href="#">手机版下载</a></dd>
				</dl>
				<dl>
					<dt>商家</dt>
					<dd><a href="#">商家入驻</a></dd>
					<dd><a href="#">商家后台</a></dd>
					<dd><a href="#">蘑菇商学院</a></dd>
					<dd><a href="#">商家社区 </a></dd>
				</dl>
    		</div>
			<!--中间结束-->

			<!--右边开始-->
			<div class="link-safe">
				<dl>
					<dt>权威认证</dt>
					<dd class="bank">
						<a href="#"></a>
					</dd>
					<dd class="web">
						<a href="#"></a>
					</dd>
				</dl>
			</div>
			<!--右边结束-->
		</div>
		<!--友情链接开始-->
		<div class="friend-link clearfix">
        <ul class="clearfix">
            <li class="">友情链接: </li>
            <li><a href="#">美丽说</a></li>
            <li><a href="#">蘑菇街游戏</a></li>
            <li><a href="#">淘粉吧</a></li>
            <li><a href="#">穿衣搭配</a></li>
            <li><a href="#">秋季女装新款</a></li>
            <li><a href="#">秋季连衣裙长袖</a></li>
            <li><a href="#">秋季孕妇装</a></li>
            <li><a href="#">QQ钱包</a></li>
            <li><a href="#/">时尚品牌网</a></li>
            <li><a href="#">装修</a></li>
            <li><a href="#">背带裤搭配</a></li>
            <li><a href="#">衣联网</a></li>
            <li><a href="#">播视网视频</a></li>
            <li><a href="#">慧聪网</a></li>
            <li><a href="#">衬衫搭配</a></li>
            <li><a href="#">牛仔外套搭配图片</a></li>
            <li><a href="#">冬装时尚搭配</a></li>
            <li><a href="#">针织衫搭配</a></li>
            <li><a href="#">牛仔衣搭配</a></li>
            <li><a href="#">风衣搭配</a></li>
            <li><a href="#">补水面膜排行榜</a></li>
            <li><a href="#">爱蘑菇街</a></li>
        </ul>
    </div>
    <!--友情链接结束-->
	</div>
	<!--页脚结束-->
	<script src="${pageContext.request.contextPath}/js02/index.js"></script>
</body>
</html>