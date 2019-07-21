<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/7
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!--不以/开始的相对路径，找资源以单前资源为基准-->
<!--以/开始的相对路径，找资源以服务器路径为基准-->
<!--引入jQuery-->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<!--引入样式-->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<html>
<head>
    <title>员工列表</title>
</head>
<body>
<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <td>操作</td>
                    </tr>
                </thead>
               <tbody>
                    <tr>

                    </tr>
               </tbody>


            </table>
        </div>
    </div>
    <!--显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!--分页条信息-->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
    <script type="text/javascript">
        //1.页面加载以后，直接发送ajax请求，要到分页数据
        $(function () {
            $.ajax({
                url:"${APP_PATH}/emps",//地址
                data:"pn=1",//数据
                type:"GET",//请求类型
                success:function (result) {//请求成功的回调函数
                    //console.log(result);
                    //1.解析json数据，显示员工数据
                    build_emp_table(result);
                    //2.解析并显示分页信息
                    build_page_info(result);
                    //3.解析分页条数据
                    build_page_nav(result);
                }
            });
        });
        function build_emp_table(result) {
            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index, item) {
                var empIdTd = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);
                var gender = $("<td></td>").append(item.gender == "M" ? "男" : "女");
                var email = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                $("<tr></tr>").append(empIdTd).append(empName).append(gender).append(email).append(deptNameTd).appendTo("#emps_table tbody");
            })
        }
        //解析显示分页信息
        function build_page_info(result) {
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"页，总"+result.extend.pageInfo.total+"条记录")
        }
        //解析显示分页条
        function build_page_nav(result) {
            var ul = $("<ul></ul>").andClass("pagination");
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            ul.append(firstPageLi).append(prePageLi);
            //1,2,3遍历ul中添加页码显示
            $.each(result.extend.pageInfo.navigatepageNums,function(index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                ul.append(numLi);
            });
            //添加下一页和末页的提示
            ul.append(nextPageLi).append(lastPageLi);
            //把ul添加到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");

        }
    </script>
</body>
</html>
