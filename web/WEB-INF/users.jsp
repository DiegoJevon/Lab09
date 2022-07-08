<%-- 
    Document   : users
    Created on : Jul 07, 2022, 7:22:26 PM
    Author     : Diego Maia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Control</title>
    </head>
    <body style="margin: 15px ; background-color: #121010; color: white; font-family: system-ui">
        <div id="container" style="display:flex" >
            <div id="add_user" style="max-width: 20%; padding: 15px 20px; border: #720EB5; border-style: groove; border-radius: 5px">
                <h2 style='margin:0 auto; text-align: center; margin-bottom: 5px'>Add User</h2>
                <form action="users" method="post">
                    <input type="email" name="email" placeholder="Email" required style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <label>Active: </label><input type="checkbox" name="active" value="">
                    <input type="text" name="fname" placeholder="First Name" required style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <input type="text" name="lname" placeholder="Last Name" required style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <input type="password" name="password" placeholder="Password" required style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <select name="role" style="width: 103%; border-radius: 30px; background-color: white; color: #4B4251">
                        <c:forEach items="${roles}" var="role">
                            <option>${role.roleName}</option>
                        </c:forEach>
                        </select><br>
                    <input type="submit" name="add" value="Save" style="width: 103%; background-color: #720EB5; color:white; border-style: outset; border-radius: 10px;">
                    <input type="hidden" name="action" value="add">
                </form>
            </div>
            <div id="manage_users" style="max-width: 70% ; padding: 15px 10px;">
                <h2 style='margin:0 auto; text-align: center; margin-bottom: 5px'>Manage Users</h2>
                <table style="width:850px; box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 ); text-align: center">
                    <tr style="background-color: #2A242F">
                        <td><b>Email</b></td>
                        <td><b>Active</b></td>
                        <td><b>First Name</b></td>
                        <td><b>Last Name</b></td>
                        <td><b>Role</b></td>
                        <td><b>Edit</b></td>
                        <td><b>Delete</b></td>
                    </tr>
                    <c:forEach items="${users}" var="user">
                        <tr style="background-color: #403D41">
                            <td>${user.email}</td>
                            <td>
                             <c:choose>
                                <c:when test="${user.active}">
                                    <input type='checkbox' value="${user.active}" checked>
                                </c:when>
                                <c:otherwise>
                                    <input type='checkbox' value="${user.active}" >
                                </c:otherwise>
                            </c:choose></td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <c:forEach items="${roles}" var="role">
                                <c:if test="${role == user.role}">
                                    <td>${role.roleName}</td>
                                </c:if>
                            </c:forEach>                            
                            <td style="background-color: #863BB9"><a href="users?action=edit&email=${user.email}" style="color: #121010">Edit</a></td>

                            <td style="background-color: #863BB9"><a href="users?action=delete&delete_email=${user.email}" style="color: #121010">Delete</a></td>                            
                        </tr>                        
                    </c:forEach>                   
                </table>                          
            </div>
            <div id="edit_user" style="max-width: 20% ; padding: 15px 20px; ; border: #720EB5; border-style: groove; border-radius: 5px">
                <h2 style='margin:0 auto; text-align: center; margin-bottom: 5px'>Edit User</h2>
                <form action="users" method="post">
                    <input type="email" name="edit_email" value="${edit_email}" readonly style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <label>Active: </label>
                    <c:choose>
                        <c:when test="${edit_active}">
                            <input type='checkbox' name='edit_active' value="${edit_active}" checked>
                        </c:when>
                        <c:otherwise>
                            <input type='checkbox' name='edit_active' value="${edit_active}" >
                        </c:otherwise>
                    </c:choose>
                    <input type="text" name="edit_fname" required value="${edit_fname}" style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <input type="text" name="edit_lname" required value="${edit_lname}" style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <input type="password" name="edit_password" required placeholder="New Password" value="${edit_password}" style="width: 100%; border-radius: 5px; background-color: #464545; color: white">
                    <select name="edit_role" required style="width: 103%; border-radius: 30px; background-color: white; color: #4B4251">
                        <c:forEach items="${roles}" var="role">
                             <c:choose>
                                <c:when test="${role.roleName == edit_role}">
                                    <option selected>${role.roleName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option>${role.roleName}</option>
                                </c:otherwise>
                             </c:choose>
                        </c:forEach>
                    </select><br>
                    <input type="submit" name="update" value="Save" style="width: 103%; background-color: #720EB5; color:white; border-style: outset; border-radius: 10px;">
                    <input type="hidden" name="action" value="update">
                    </form>
                <form action="users" method="post">
                    <input type="submit" name="cancel" value="Cancel" style="width: 103%; background-color: darkgrey; color:black; border-style: outset; border-radius: 10px;">
                    <input type="hidden" name="action" value="cancel">
                </form>
            </div>
        </div>
    </body>
</html>
