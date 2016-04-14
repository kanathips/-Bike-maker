<%-- 
    Document   : register.jsp
    Created on : Apr 14, 2016, 4:55:44 PM
    Author     : kanathip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function checkPasswordMatch() {
                var password = document.getElementsByName('password')[0].value;
                var rePassword = document.getElementsByName('rePassword')[0].value;
                if (password !== rePassword) {
                    alert("รหัสผ่านไม่เหมือนกัน กรุณากรอกใหม่อีกครั้ง");
                }
            }
            function checkEmailMatch() {
                var email = document.getElementsByName('email')[0].value;
                var reEmail = document.getElementsByName('reEmail')[0].value;
                if (email !== reEmail) {
                    alert("รหัสผ่านไม่เหมือนกัน กรุณากรอกใหม่อีกครั้ง");
                }
            }
        </script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ลงทะเบียน</title>
    </head>
    <body>
        <h1>ลงทะเบียน</h1>
        <form action="RegisServlet" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td>ชื่อผู้ใช้งาน</td>
                        <td><input name="username" required="true" placeholder="ชื่อผู้ใช้งาน"/></td>
                    </tr>
                    <tr>
                        <td>รหัสผ่าน </td>
                        <td><input name="password" id="password"type="password" required="true" placeholder="รหัสผ่าน"/></td>
                    </tr>
                    <tr>
                        <td>ยืนยันรหัสผ่าน</td>
                        <td><input name="rePassword" id="rePassword" type="password" required="true" placeholder="ยืนยันรหัสผ่าน" onblur="checkPasswordMatch()"/></td>
                    </tr>
                    <tr>
                        <td>ชื่อ</td>
                        <td> <input name="fName" required="true" placeholder="ชื่อ"/></td>
                    </tr>
                    <tr>
                        <td>นามสกุล</td>
                        <td> <input name="lName" required="true" placeholder="นามสกุล"/></td>
                    </tr>
                    <tr>
                        <td>อีเมลล์</td>
                        <td><input name="email" type="email" placeholder="อีเมลล์"/></td>
                    </tr>
                    <tr>
                        <td>ยืนยันอีเมลล์</td>
                        <td><input name="reEmail" type="email" placeholder="ยืนยันอีเมลล์" onblur="checkEmailMatch()"/></td>
                    </tr>
                    <tr>
                        <td>เบอร์โทรศัทพ์</td>
                        <td><input name="tel" type="tel" pattern="[0-9]" placeholder="เบอร์โทรศัพท์"/></td>
                    </tr>
                    <tr>
                        <td>รหัสประจำตัวประชาชน</td>
                        <td><input name="ssd" placeholder="รหัสประจำตัวประชาชน" pattern="[0-9]{13}" title="รหัสประจำตัวประชาชนไม่ถูกต้อง กรุณากรอกใหม่"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit"/>
        </form>
    </body>
</html>
