{% extends './layout.tpl'%}

{% block title %}
  <title>用户登录</title>
{% endblock %}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/login.css">
{% endblock %}

{% block content%}
    <div class="page-body-content">
        <div class="pbc-title">
            MERCEDES-BENZ
        </div>
        <input class="pbc-input" id="input-phone" type="text" maxlength="11" name="mobilePhone" placeholder="请输入您的手机号">
        <input class="pbc-input" id="input-password" type="text" name="password" placeholder="请输入您的密码(不少于8位)">
        <button class="pbc-button" id="pbc-button" type="submit" name="submit">
            现在登陆
        </button>
    </div>
{% endblock %}

{% block js %}
<script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
<script src="/javascripts/login.js"></script>
{% endblock %}