<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".click").click(function(){
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function(){
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function(){
                $(".tip").fadeOut(100);
            });

        });
    </script>


</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">数据表</a></li>
        <li><a href="#">基础数据</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li ><a href="/basic/baseDispatch">
                    <span>
                        <img src="/images/t01.png" />
                    </span>添加
                </a>
            </li>
            <li class="click"><span><img src="/images/t02.png" /></span>修改</li>
            <li><span><img src="/images/t03.png" /></span>删除</li>
            <li><span><img src="/images/t04.png" /></span>统计</li>
        </ul>


        <ul class="toolbar1">
            <li><span><img src="/images/t05.png" /></span>设置</li>
        </ul>

    </div>


    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked"/></th>
            <th>编号<i class="sort"><img src="/images/px.gif" /></i></th>
            <th>数据名称</th>
            <th>数据描述</th>
            <th>父数据编号</th>

            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="data">
            <c:if test="${data.parentId eq null}" >
                <!-- 每循环一次取出来的是一份大类数据 -->
                <tr>
                    <td><input name="" type="checkbox" value="" /></td>
                    <td>${data.baseId}</td>
                    <td>${data.baseName}</td>
                    <td>${data.baseDesc}</td>
                    <td>${data.parentId}</td>
                    <td><a href="/basic/baseDispatch?id=${data.baseId}" class="tablelink">更新</a>
                        <a href="javascript:void(0)" onclick="deleteRole(${role.roleId})" class="tablelink"> 删除</a></td>
                </tr>
                <!-- 根据大类的编号查询出对应的小类数据 -->
                <c:forEach items="${list}" var="small" >
                    <c:if test="${data.baseId eq small.parentId}" >
                        <tr>
                            <td ><input name="" type="checkbox" value="" /></td>
                            <td style="padding-left: 40px;">${small.baseId}</td>
                            <td style="padding-left: 40px;">${small.baseName}</td>
                            <td>${small.baseDesc}</td>
                            <td>${small.parentId}</td>
                            <td><a href="/basic/baseDispatch?id=${small.baseId}" class="tablelink">更新</a>
                                <a href="javascript:void(0)" onclick="deleteRole(${role.roleId})" class="tablelink"> 删除</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:forEach>

        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="/images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>

    </div>




</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');

    function deleteRole(id){
        if(window.confirm("是否确定要删除该记录呢?")){
            window.location.href = "/role/deleteById?id="+id;
        }

    }
</script>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
