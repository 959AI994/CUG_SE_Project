
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/editor/kindeditor.js"></script>

    <script type="text/javascript">
        KE.show({
            id : 'content7',
            cssPath : './index.css'
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width : 345
            });
            $(".select2").uedSelect({
                width : 167
            });
            $(".select3").uedSelect({
                width : 100
            });
        });
    </script>
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

    <div class="formtitle"><span>基本信息</span></div>
    <form action="/customer/saveOrUpdate" method="post">
        <ul class="forminfo">
            <input type="hidden" name="customerId" value="${customer.customerId}">
            <li><label>客户名称</label><input name="customerName" type="text" class="dfinput" value="${customer.customerName}" /><i></i></li>
            <li><label>客户电话</label><input name="mobilePhone" type="text" class="dfinput"  value="${customer.mobilePhone}" /><i></i></li>
            <li><label>电子邮箱</label><input name="email" type="text" class="dfinput"   value="${customer.email}"/><i></i></li>
            <li><label>通讯地址</label><input name="address" type="text" class="dfinput"  value="${customer.address}" /><i></i></li>
            <li><label>身份证号码</label><input name="idCard" type="text" class="dfinput" value="${customer.idCard}"  /><i></i></li>
            <li>
                <label>业务员</label>
                <div class="vocation">
                    <!-- 和添加区分开 -->
                    <c:if test="${empty customer}" >
                        <select class="select1" name="userId">

                            <c:forEach items="${users}" var="p">
                                <option value="${p.userId}" >${p.realName}</option>
                            </c:forEach>
                        </select>
                    </c:if>
                    <c:if test="${not empty customer}" >
                        <select class="select1" name="userId">
                            <!-- 更新 -->
                            <shiro:hasAnyRoles name="业务员,操作员">
                                <option value="${customer.userId}" >
                                    <shiro:principal property="realName"></shiro:principal>
                                </option>
                            </shiro:hasAnyRoles>
                            <shiro:hasAnyRoles name="管理员">
                                <c:forEach items="${users}" var="p">
                                    <option value="${p.userId}" ${p.userId eq customer.userId?'selected':''}>${p.realName}</option>
                                </c:forEach>
                            </shiro:hasAnyRoles>
                        </select>
                    </c:if>
                </div>
            </li>

            <li>
                <label>常用区间</label>
                <div class="vocation">

                    <select class="select1" name="baseId">

                        <c:forEach items="${intervals}" var="p">
                            <option value="${p.baseId}" ${p.baseId eq customer.baseId?'selected':''}>
                                    ${p.baseName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </li>
                <li>
                    <label>备注</label>
                    <textarea class="textinput" name="remark">${customer.remark}</textarea>
                </li>

            <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
        </ul>
    </form>


</div>


<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
