<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="/js/jquery.js" ></script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">表单</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>用户操作</span></div>
    <form action="/user/saveOrUpdate" method="post">
        <ul class="forminfo">
            <input name="user.userId" type="hidden" class="dfinput" id="userId" value="${user.userId}"/>
            <li><label>账号</label>
                <c:if test="${user.userId eq null}">
                    <input name="user.userName"  type="text" class="dfinput" id="username" value="${user.userName}"/>
                </c:if>

                <c:if test="${user.userId ne null}">
                    <label>${user.userName}</label>
                </c:if>
                <i id="userNameI">
                </i>
            </li>
            <c:if test="${user.userId eq null}" >
                <li><label>密码</label><input name="user.password" type="text" class="dfinput" value="${user.password}"  /><i></i></li>
            </c:if>

            <li><label>姓名</label><input name="user.realName" type="text" class="dfinput"  value="${user.realName}"/><i></i></li>
            <li><label>邮箱</label><input name="user.email" type="text" class="dfinput"  value="${user.email}"/><i></i></li>
            <li><label>电话</label><input name="user.phone" type="text" class="dfinput"  value="${user.phone}"/><i></i></li>
            <li><label>角色</label>
                <div style="height: 32px;line-height: 32px;">
                <!--
                    外层循环 取出所有的角色信息
                 -->

                <c:forEach items="${roles}" var="role">
                    <!-- 声明一个变量记录是否勾选 -->
                    <c:set var="flag" value="false"></c:set>
                    <!-- 内层循环判断 外层循环的角色是否在当前用户具有的角色中 -->
                    <c:forEach items="${ownerRoleIds}"  var="owner">
                        <c:if test="${role.roleId eq owner}">

                            <c:set value="true" var="flag" ></c:set>
                        </c:if>

                    </c:forEach>

                    <input type="checkbox" value="${role.roleId}" ${flag eq true ?'checked':''}
                           name="roleIds">${role.roleName}
                    &nbsp;&nbsp;
                    <c:set var="flag" value="false"></c:set>
                </c:forEach>
                <i></i>
                </div>
            </li>

            <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
        </ul>
    </form>

    <script >
        $(function(){
            $("#username").blur(function(){
                var userId = $("#userId").val();
                if(userId == null){
                    // 获取输入框的内容
                    var obj = $(this).val();
                    // 客户端校验
                    if(obj != null && obj.length >= 3 && obj.length <= 10){
                        // 表示这个账号满足了基本的规则，然后去数据库中判断是否存在相同的数据
                        $.get("/user/checkUserName",{userName:obj},function(msg){
                            if(msg == "1"){
                                // 表示可以使用
                                $("#userNameI").html("<span style='color:green'> 账号可用 </span>")
                            }else{
                                // 表示重复
                                $("#userNameI").html("<span style='color:red'> 账号存在，请重新输入 </span>")
                            }
                        });
                    }else{
                        alert("账号的长度是3~10位!");
                    }
                }

            });
        });
    </script>

</div>


<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
