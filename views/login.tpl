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
        <input class="pbc-input" type="text" maxlength="11" name="mobilePhone" placeholder="请输入您的手机号"
            data-error="请输入中国大陆手机号码（11位数字）" value="">
        <input class="pbc-input" type="text" name="password" placeholder="请输入您的密码" data-error="请输入正确的密码（不能为空）" value="">
        <button class="pbc-button" type="submit" name="submit">
            现在登陆
        </button>
    </div>
{% endblock %}