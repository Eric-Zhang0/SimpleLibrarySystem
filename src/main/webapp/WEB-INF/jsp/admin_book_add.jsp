<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>書籍情報追加</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .form-group {
            margin-bottom: 0;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/sky.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div style="position: relative;padding-top: 60px; width: 80%;margin-left: 10%">
    <form action="book_add_do.html" method="post" id="addbook">
        <div class="form-group">
            <label for="name">書名</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="書名を入力してください">
        </div>
        <div class="form-group">
            <label for="author">著者</label>
            <input type="text" class="form-control" name="author" id="author" placeholder="著者を入力してください">
        </div>
        <div class="form-group">
            <label for="publish">出版社</label>
            <input type="text" class="form-control" name="publish" id="publish" placeholder="出版社を入力してください">
        </div>
        <div class="form-group">
            <label for="isbn">ISBN</label>
            <input type="text" class="form-control" name="isbn" id="isbn" placeholder="ISBNを入力してください">
        </div>
        <div class="form-group">
            <label for="introduction">概要</label>
            <textarea class="form-control" rows="3" name="introduction" id="introduction"
                      placeholder="概要を入力してください："></textarea>
        </div>
        <div class="form-group">
            <label for="language">言語</label>
            <input type="text" class="form-control" name="language" id="language" placeholder="言語を入力してください">
        </div>
        <div class="form-group">
            <label for="price">価格</label>
            <input type="text" class="form-control" name="price" id="price" placeholder="価格を入力してください">
        </div>
        <div class="form-group">
            <label for="pubstr">出版日</label>
            <input type="date" class="form-control" name="pubstr" id="pubstr" placeholder="出版日を入力してください">
        </div>
        <div class="form-group">
            <label for="classId">分類番号</label>
            <input type="text" class="form-control" name="classId" id="classId" placeholder="分類番号を入力してください">
        </div>
        <div class="form-group">
            <label for="number">数量</label>
            <input type="text" class="form-control" name="number" id="number" placeholder="書籍の数を入力してください">
        </div>

        <input type="submit" value="追加" class="btn btn-success btn-sm" class="text-left">
        <script>
            $("#addbook").submit(function () {
                if ($("#name").val() == '' || $("#author").val() == '' || $("#publish").val() == '' || $("#isbn").val() == '' || $("#introduction").val() == '' || $("#language").val() == '' || $("#price").val() == '' || $("#pubstr").val() == '' || $("#classId").val() == '' || $("#pressmark").val() == '' || $("#number").val() == '') {
                    alert("完全な書籍情報を入力してください！");
                    return false;
                }
            })
        </script>
    </form>
</div>
</body>
</html>
