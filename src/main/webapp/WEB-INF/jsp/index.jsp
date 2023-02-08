<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>図書館ホームページ</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/js.cookie.js"></script>
    <style>
        #login{
           height: 50%;
            width: 28%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            display: block;
            position: center;
        }

        .form-group {
            margin-bottom: 0;
        }
        * {
            padding:0;
            margin:0;
        }
    </style>
</head>
<body background="img/timg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<c:if test="${!empty error}">
    <script>
            alert("${error}");
            window.location.href="login.html";
</script>
</c:if>
<h2 style="text-align: center; color: white; font-family: '游ゴシック'; font-size: 500%">図　書　館</h2>

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">ログインして下さい</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="id">アカウント</label>
            <input type="text" class="form-control" id="id" placeholder="アカウントを入力して下さい">
        </div>
        <div class="form-group">
            <label for="passwd">パスワード</label>
            <input type="password" class="form-control" id="passwd" placeholder="パスワードを入力して下さい">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">パスワードを覚える
            </label>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton"  class="btn btn-primary  btn-block">ログイン
        </button>
    </div>
</div>
    <script>
        $("#id").keyup(
            function () {
                if(isNaN($("#id").val())){
                    $("#info").text("tips:アカウントは数字のみ");
                }
                else {
                    $("#info").text("");
                }
            }
        )
        // ログイン情報を覚える
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }
        // ログイン情報の記憶をチェックすると、ページにアクセスした後、ログイン情報が自動的に反映
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#id').val(loginStatus.username);
                    $('#passwd').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 设置登录信息
        setLoginStatus();
        $("#loginButton").click(function () {
            var id =$("#id").val();
            var passwd=$("#passwd").val();
            var remember=$("#remember").prop('checked');
            if (id == '') {
                $("#info").text("アカウントは空ではない");
            }
            else if( passwd ==''){
                $("#info").text("パスワードは空ではない");
            }
            else if(isNaN( id )){
                $("#info").text("アカウントは数字のみ");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "api/loginCheck",
                    data: {
                        id:id ,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.stateCode.trim() === "0") {
                            $("#info").text("アカウントあるいはパスワードが無効！");
                        } else if (data.stateCode.trim() === "1") {
                            $("#info").text("ログイン成功！遷移中…");
                            window.location.href="admin_main.html";
                        } else if (data.stateCode.trim() === "2") {
                            if(remember){
                                rememberLogin(id,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            $("#info").text("ログイン成功！遷移中…");
                            window.location.href="reader_main.html";

                        }
                    }
                });
            }
        })

    </script>
</div>

</body>
</html>
