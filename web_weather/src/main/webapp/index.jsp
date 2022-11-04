<%@ page import="javax.xml.rpc.ServiceException" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>天气预报系统</title>
    <script>
        function cal(){
            <jsp:useBean id="conn" class="com.example.Service"></jsp:useBean>
            <%
                String str = request.getParameter("ad");
                String str1 = "";
                String[] res = {};
                if(str!=null)
                {
                    str1 = new String(str.getBytes("iso-8859-1"), "utf-8");
                    try {
                        res = com.example.Service.getCityWeather(str1);
                    } catch (ServiceException e) {
                        throw new RuntimeException(e);
                    }
                }
                String ans = "";
                for(String line : res){
                    if(!line.contains(".gif")){
                        ans += line;
                        ans+="<br>";
                    }
                }
            %>
        }
    </script>
</head>
<body>

<div align="center" style="position:relative;top:10px">
    <h1>天气预报系统</h1><p></p>
</div>

<div align="center" style="position:relative;top:10px">
    <p>请输入需要查询的城市</p>
</div>

<form action="index.jsp" method="post">
    <div align="center" style="position:relative;top:10px">
        <input type="text" name="ad"/><br/><p></p>
    </div>
    <div align="center" style="position:relative;top:10px">
        <button type="submit" onclick="cal()">查询</button><p></p>
    </div>
</form>
<div align="center" style="position:relative;top:10px">
    <p>查询结果如下：</p>
    <p><%=ans%></p>
</div>
</body>
</html>