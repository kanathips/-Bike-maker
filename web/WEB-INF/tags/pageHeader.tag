<%-- 
    Document   : pageHeader
    Created on : Apr 15, 2016, 12:30:11 AM
    Author     : kanathip
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="role"%>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="/IMS">IMS</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${role == 'staff'}">
                        <li class="active"><a href="#">พนักงาน</a></li>
                    </ul>
                </c:when>
                <c:when test="${role == 'admin'}">
                    <li><a href="/IMS/admin">ผู้ดูแลระบบ</a></li>
                    <li><a href="/IMS/admin/setting.jsp">ตั้งค่าระบบ</a></li>
                    <li><a href="/IMS/admin/sendemail.jsp">ส่งอีเมลล์</a></li>
                    </ul>
                </c:when>
                <c:when test="${role == 'lecturer'}">
                    <li><a href="#">อาจารย์</a></li>
                    </ul>                                
                </c:when>
            </c:choose>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${role != '' && role != null}">
                        <li>
                            <a href="/IMS/Logout">
                                <span class="glyphicon glyphicon-log-out "/> 
                                Logout
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-log-in "/> 
                                Login
                            </a>
                            <div class="dropdown-menu" style="padding:17px;">
                                <form class="form" id="formLogin" action="Login" method="POST"> 
                                    <input name="username" placeholder="username" type="text"> 
                                    <input name="password" placeholder="password" type="password">
                                    <br>
                                    <br>
                                    <button type="submit">Login</button>
                                </form>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>