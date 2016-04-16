<%-- 
    Document   : register.jsp
    Created on : Apr 14, 2016, 4:55:44 PM
    Author     : kanathip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
              integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" 
              integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" 
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
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
                        <td><input name="email" type="email" placeholder="อีเมลล์" required="true"/></td>
                    </tr>
                    <tr>
                        <td>ยืนยันอีเมลล์</td>
                        <td><input name="reEmail" type="email" placeholder="ยืนยันอีเมลล์" onblur="checkEmailMatch()" required="true"/></td>
                    </tr>
                    <tr>
                        <td>เบอร์โทรศัทพ์</td>
                        <td><input name="tel" type="tel" pattern="[0-9]" placeholder="เบอร์โทรศัพท์" required="true"/></td>
                    </tr>
                    <tr>
                        <td>รหัสประจำตัวประชาชน</td>
                        <td><input name="ssd" placeholder="รหัสประจำตัวประชาชน" pattern="[0-9]{13}" title="รหัสประจำตัวประชาชนไม่ถูกต้อง กรุณากรอกใหม่" required="true"/></td>
                    </tr>
                    <tr>
                        <td>ที่อยู่</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>บ้านเลขที่</td>
                        <td><input name="house_no" placeholder="บ้านเลขที่" title="กรุณาใส่บ้านเลขที่" required="true"/></td>
                    </tr>
                    <tr>
                        <td>ถนน</td>
                        <td><input name="street" placeholder="ถนน" title="กรุณาใส่ถนน" required="true"/></td>
                    </tr>
                    <tr>
                        <td>ตำบล / แขวง</td>
                        <td><input name="subDistrict" placeholder="ตำบล / แขวง" title="กรุณาใส่ตำบล / แขวง"required="true"/></td>
                    </tr>
                    <tr>
                        <td>อำเภอ / เขต</td>
                        <td><input name="district" placeholder="ตำบล / แขวง" title="กรุณาใส่อำเภอ / เขต"required="true"/></td>
                    </tr>
                    <tr>
                        <td>จังหวัด</td>
                        <td><input name="province" placeholder="จังหวัด" title="กรุณาใส่จังหวัด" required="true"/></td>
                    </tr>
                    <tr>
                        <td>รหัสไปรษณีย์</td>
                        <td><input name="zipcode" placeholder="รหัสไปรษณีย์" title="กรุณาใส่รหัสไปรษณีย์" required="true"/></td>
                    </tr>
                    <tr>
                        <td>ประเทศ</td>
                        <td><input name="country" placeholder="ประเทศ" title="กรุณาใส่ประเทศ" required="true"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit"/>
        </form>
    </body>
</html>
