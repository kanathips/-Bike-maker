<%-- 
    Document   : askquestion
    Created on : Apr 15, 2016, 10:55:27 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ติดต่อสอบถาม</h1><br>
        <form action="/Bike-Maker/AskQuestionServlet" method="post"/>
        <table border="0">
            <tbody>
                <tr>
                    <td>ชื่อ</td>
                    <td><input name="name"/></td>
                </tr>
                <tr>
                    <td>อีเมลล์</td>
                    <td><input name="email" type="email"/></td>
                </tr>
                <tr>
                    <td>หัวข้อ</td>
                    <td><input name="topic" /></td>
                </tr>
                <tr>
                    <td>คำถาม</td>
                    <td><textarea name="question" rows="10" cols="90">
                        </textarea> </td>
                </tr>
            </tbody>
        </table>
        <input type="submit" value="ส่งคำถาม"/>
        <input type="reset" value="ล้างข้อมูล"/>
    </form>
</body>
</html>
