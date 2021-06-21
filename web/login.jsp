<!DOCTYPE html>
<html lang="en">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<head>
    <meta charset="UTF-8">
    <title>login</title>

    <link rel="stylesheet" href="static/css/style.css">

</head>

<body>

<div id="clouds">
    <div class="cloud x1"></div>
    <!-- Time for multiple clouds to dance around -->
    <div class="cloud x2"></div>
    <div class="cloud x3"></div>
    <div class="cloud x4"></div>
    <div class="cloud x5"></div>
</div>

<div class="container">


    <div id="login">

        <form action="<%=path%>/user/login" method="post">

            <fieldset class="clearfix">

                <p><span class="fontawesome-user"></span><input type="text" value="Username" name="username"
                                                                onBlur="if(this.value == '') this.value = 'Username'"
                                                                onFocus="if(this.value == 'Username') this.value = ''"
                                                                required></p>
                <!-- JS because of IE support; better: placeholder="Username" -->
                <p><span class="fontawesome-lock"></span><input type="password" value="Password" name="password"
                                                                onBlur="if(this.value == '') this.value = 'Password'"
                                                                onFocus="if(this.value == 'Password') this.value = ''"
                                                                required></p>
                <!-- JS because of IE support; better: placeholder="Password" -->
                <p><input type="submit" value="Sign In"></p>

            </fieldset>

        </form>

        <!--        <p>Not a member? <a href="#" class="blue">Sign up now</a><span class="fontawesome-arrow-right"></span></p>-->

    </div> <!-- end login -->

</div>


</body>

</html>
