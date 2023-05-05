<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script src="https://cdn.bootcss.com/jquery.serializeJSON/2.6.2/jquery.serializejson.js"></script>
    <style type="text/css">
        .tablelist1{border:solid 1px #cbcbcb; width:90%; clear:both;margin: 10px;}
        .tablelist1 td{height:35px;line-height:35px; text-indent:11px; border: solid 1px #3B3B3B;padding-right: 5px;}
        table .td1{
            text-align: right;
            background-color: #F1F1F1;
            font-weight: bold;
        }
        table .td2{
            text-align: center;
            background-color: #F1F1F1;
            font-weight: bold;
        }
        table select{
            width: 100px;
            border: 1px solid #3B3B3B;
            height: 23px;
        }
        table input{
            width: 150px;
            border: 1px solid #3B3B3B;
            height: 23px;
            padding-left: 5px;
            padding-top: 2px;
            padding-bottom: 2px;
        }
    </style>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="/">首页</a></li>
        <li><a href="/user/query">订单管理</a></li>
    </ul>
</div>
<div class="formbody">

    <div class="formtitle">
        <span>新增订单</span>
    </div>
    <div style="border: 0px red solid;">
        <form action="/order/save" method="post" id="myform">
            <table  class="tablelist1" >
                <tr>
                    <td class="td1">业务员:</td>
                    <td>
                        <select name="userId">
                            <c:forEach items="${users }" var="sale">
                                <option value="${sale.userId }">${sale.realName }</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="td1" >客户:</td>
                    <td>
                        <select name="customerId" id="customerId">
                            <c:forEach items="${customers }" var="c">

                                <option value="${c.customerId }" >${c.customerName }</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="td1">到达国家:</td>
                    <td>
                        <!-- 货运区间默认选择客户的常用货运区间 -->
                        <select name="destAreaId" id="destAreaId">
                            <c:forEach items="${countrys }" var="country">
                                <option value="${country.baseId }" >${country.baseName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="td1" >收货地址:</td>
                    <td>
                        <input type="text" name="shippingAddress">
                    </td>
                    <td class="td1" >收货人:</td>
                    <td>
                        <input type="text" name="shippingName">
                    </td>
                    <td class="td1">联系电话: </td>
                    <td>
                        <input type="text" name="shippingPhone">
                    </td>
                </tr>
                <tr>
                    <td class="td1">付款方式:</td>
                    <td>
                        <select name="paymentMethodId">
                            <c:forEach items="${payments }" var="pay">
                                <option value="${pay.baseId }">${pay.baseName }</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="td1">货运方式:</td>
                    <td colspan="3">
                        <select name="transMethodId">
                            <c:forEach items="${freights }" var="freight">
                                <option value="${freight.baseId }">${freight.baseName }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="td1">取件方式:</td>
                    <td>
                        <select name="takeMethodId">
                            <c:forEach items="${fetchs }" var="fetch">
                                <option value="${fetch.baseId }">${fetch.baseName }</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="td1">物流公司:</td>
                    <td>
                        <input type="text" value="xxx" disabled="disabled">
                    </td>
                    <td class="td1">物流单号:</td>
                    <td>
                        <input type="text" value="xxx" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <td class="td1">收件人:</td>
                    <td>
                        <input type="text" value="xxx" disabled="disabled">
                    </td>
                    <td class="td1">收货地址:</td>
                    <td>
                        <input type="text" value="深圳宝安区固戍..." disabled="disabled">
                    </td>
                    <td class="td1">联系电话:</td>
                    <td>
                        <input type="text" value="xxx" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <td class="td1">取件地址:</td>
                    <td>
                        <input type="text" name="takeAddress">
                    </td>
                    <td class="td1" >联系电话:</td>
                    <td>
                        <input type="text" name="takePhone">
                    </td>
                    <td class="td1">取件联系人:</td>
                    <td>
                        <input type="text" name="takeName">
                    </td>
                </tr>
                <tr>
                    <td class="td1">订单备注:</td>
                    <td colspan="5">
                        <input type="text" style="width: 600px;" name="orderDesc">
                    </td>
                </tr>
            </table>
            <table class="tablelist1" id="orderDetailID">
                <tr>
                    <td class="td2">货物名称</td>
                    <td class="td2">数量</td>
                    <td class="td2">单位</td>
                    <td class="td2">单价</td>
                    <td class="td2">总价值(计算关联)</td>
                    <td class="td2">备注</td>
                    <td align="center"><img  src="/images/t01.png" id="mytab1" style="width: 20xpx;height: 20px;"></td>
                </tr>
                <tr class="mytr" >
                    <td align="center"><input type="text" name="orderDetails[][goodsName]"></td>
                    <td align="center"><input type="text" class="goodsNumber" style="width: 50px;" name="orderDetails[][goodsNumber]" onblur="calculateTotalNumber(this)"></td>
                    <td align="center">
                        <select name="orderDetails[][goodsUnit]">
                            <c:forEach items="${units }" var="unit">
                                <option value="${unit.baseId }">${unit.baseName }</option>
                            </c:forEach>

                        </select>
                        <!-- <input type="text" style="width: 50px;" name="orderDetails[][goodsUnit]"> -->
                    </td>
                    <td align="center"><input type="text" class="goodsUnitPrice" style="width: 50px;" name="orderDetails[][goodsUnitPrice]" onblur="calculateTotalPrice(this)"></td>
                    <td align="center">
                        <input type="text" class="goodsTotal1"  style="width: 50px;"  disabled="disabled">
                        <input type="hidden" class="goodsTotal2"   name="orderDetails[][goodsTotal]">
                    </td>
                    <td align="center"><input type="text" name="orderDetails[][goodsRemark]"></td>
                    <td align="center"><img class="mytab2" onclick="removeTr(this)"  src="/images/t03.png" style="width: 20xpx;height: 20px;"></td>
                </tr>
            </table>

            <div style="width: 100%;text-align: center; margin: 20px;" >

                <input type="button" value="提交" onclick="submitForm();"
                       style="width: 200px;height: 40px;font-size: 24px;background-color: #41A8C6;color: #ffffff;">

            </div>
        </form>
    </div>

    <script type="text/javascript">
        var index = 0;
        $(function(){
            $("#mytab1").click(function(){
                var tab = $("#orderDetailID");
                var mytr = $(".mytr").clone().attr("class","mytr"+index);
                index++;
                mytr.find("td").find("input").val("");
                tab.append(mytr);
            });
            // 客户选择改变 同时更新区间为客户默认的区间
            $("#customerId").change(function(){
                // 获取选中的客户编号
                var customerId = $(this).val();
                changeInterval(customerId);
            });
            // 页面加载完成设置 常用区间
            var opt = $("#customerId option").first().get(0);
            changeInterval(opt.value);

        });
        // 单价按钮触发计算总价
        function calculateTotalPrice(ct){
            // 单价
            var price = $(ct).val();
            var tr = $(ct).parent().parent();
            // 数量
            var number = tr.find(".goodsNumber").val();
            // 设置总价
            tr.find(".goodsTotal1").val(price*number);
            tr.find(".goodsTotal2").val(price*number);

        }
        // 数量按钮触发计算总价
        function calculateTotalNumber(ct){
            // 数量
            var number = $(ct).val();
            var tr = $(ct).parent().parent();
            // 单价
            var price = tr.find(".goodsUnitPrice").val();
            // 设置总价
            tr.find(".goodsTotal1").val(price*number);
            tr.find(".goodsTotal2").val(price*number);

        }
        // 删除详情选项
        function removeTr(mytr){
            $(mytr).parent().parent().remove();
        }
        // 默认区间调整
        function changeInterval(customerId){
            // 获取客户对应的baseId
            $.get("/customer/queryBaseIdByCustomerId",{"customerId":customerId},function(baseId){
                // 设置区间的默认选项
                console.log($("#destAreaId"));
                var opts = $("#destAreaId").get(0).options;
                for(var i = 0 ; i < opts.length;i++){
                    var opt = opts[i];
                    if(opt.value == baseId){
                        $(opt).attr("selected","selected");
                    }
                }
            });
        }

        /**
         * 提交表单
         */
        function submitForm(){
            $.ajax({
                type: "POST",
                url: "/order/save",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify($("#myform").serializeJSON()),
                success: function(msg){
                    alert( "---》 " + msg );
                }
            });
        }
    </script>


</div>
<div style="display: none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
            language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>

