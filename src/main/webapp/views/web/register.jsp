<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url value="/api-user-dangky" var ="APIurl"></c:url>
<c:url value="/trang-chu" var="url"> </c:url>
<!DOCTYPE html>
<html>
<head>
    <title>Registation Form * Form Tutorial</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <%--hash password--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script></head>
</head>
<body>
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Đăng ký tài khoản</h2>
        </div>

        <div class="panel-body">
            <div class="form-group">
                <label for="username">User Name:</label>
                <input required="true" type="text" class="form-control" id="username"
                       value="${accountRegister.username}" placeholder = "Nhập User" />
                <label style="color: red">${errUserName}</label>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input required="true" type="email" class="form-control" id="email"
                value="${accountRegister.email}">
                <label style="color: red">${errEmail}</label>
                <label></label>
            </div>
            <div class="form-group">
                <label for="phone">Phone number:</label>
                <input required="true" class="form-control" id="phone" min="0" onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57" type="number"
                       value="${accountRegister.phonenumber}">
                <label style="color: red">${errPhone}</label>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input required="true" type="password" class="form-control" id="pwd"
                       value="${accountRegister.password}">
                <label style="color: red">${errPassword}</label>
            </div>
            <div class="form-group">
                <label for="confirmation_pwd">Confirmation Password:</label>
                <input required="true" type="password" class="form-control" id="confirmation_pwd">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address"
                       value="${accountRegister.address}">
                <label style="color: red">${errAddress}</label>
            </div>
            <button type="button" class="btn btn-success" id="btnRegister">Register</button>
            <button class="btn btn-success" onclick="document.location='${pageContext.request.contextPath}/trang-chu?action=home'">Cancel</button>
        </div>
    </div>
</div>
<script>
    $('#btnRegister').click(function (e){
        e.preventDefault();

        //Kiểm tra username
        var username= $('#username').val();
        if (username.trim().length == 0){
            alert("Yêu cầu nhập username !");
            return false;
        }

        ///Điều kiện ràng buộc email
        var emailregex = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        var email= $('#email').val();
        if (! email.match(emailregex)){
            alert("Yêu cầu nhập đúng định dạng email !");
            return false;
        }

        ///Kiểm tra phone
        var phone= $('#phone').val();
        if (phone.trim().length == 0){
            alert("Yêu cầu nhập số điện thoại !");
            return false;
        }

        ///Điều kiện ràng buộc mật khẩu
        var textPassword= $('#pwd').val();
        var passregex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (! textPassword.match(passregex)){
            alert("Yêu cầu nhập mật khẩu tối thiểu tám ký tự, ít nhất một chữ cái viết hoa, một chữ cái viết thường, một số và một ký tự đặc biệt !");
            return false;
        }

        ///Kiểm tra mật khẩu nhập lại
        var confirmation_pwd= $('#confirmation_pwd').val();
        if(! (textPassword.toString().trim() === confirmation_pwd.toString().trim()) ){
                alert("Mật khẩu nhập lại không khớp !");
                return  false;
        }

        ///Mã hóa mật khẩu
        var pwd = CryptoJS.MD5(textPassword).toString();
        var confirmation_pwd=CryptoJS.MD5(confirmation_pwd).toString();

        ///Kiểm tra address
        var address= $('#address').val();
        if (address.trim().length == 0){
            alert("Yêu cầu nhập địa chỉ !");
            return false;
        }

        var data={
            "username":username,
            "email":email,
            "phonenumber":phone,
            "password":pwd,
            "confirmation_pwd":confirmation_pwd,
            "avatar":'000.jpg',
            "address":address
        }
        registerAccount(data)
    });

    function registerAccount(data){
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data:JSON.stringify(data),
            dataType: 'json',

            success: function (result){
                console.log("Success");
                window.location.href = "${url}?action=dangnhap";
            },
            error: function (error){
                console.log("Error");
                window.location.href = "${url}?action=register";
            }
        })
    }
</script>
</body>
</html>
