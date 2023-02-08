<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default" role="navigation" style="background-color:#fff">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand " href="reader_main.html"><p class="text-primary" style="font-family: 游ゴシック; font-size: 200%; ">My図書館</p></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="active">
                    <a href="reader_books.html">
                        書籍検索
                    </a>
                </li>
                <li>
                    <a href="reader_info.html" >
                        個人情報
                    </a>
                </li>
                <li >
                    <a href="mylend.html" >
                        My貸出・返却
                    </a>
                </li>
                <li >
                    <a href="reader_repasswd.html" >
                        パスワード編集
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="reader_info.html">${readercard.name}, ログイン済み</a></li>
                <li><a href="login.html">ページを抜ける</a></li>
            </ul>
        </div>
    </div>
</nav>
