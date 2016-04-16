<%-- 
    Document   : forgetpassword
    Created on : Apr 16, 2016, 5:56:35 PM
    Author     : kanathip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>เรียกคืนรหัสผ่าน</h1>
        <form action="ForgetPasswordServlet" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td>อีเมลล์</td>
                        <td><input name="email" type="email" placeholder="อีเมลล์" required="true"/></td>
                    </tr>
                    <tr>
                        <td>ชื่อผู้ใช้งาน</td>
                        <td><input name="username"  placeholder="ชื่อผู้ใช้งาน" required="true"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit"/>
            <input type="reset"/>
        </form>
    </body>
</html>
