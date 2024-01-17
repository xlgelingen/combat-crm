{% extends './layout.tpl'%}

{% block title %}
  <title>预约试驾</title>
{% endblock %}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/index.css">
{% endblock %}

{% block content %}
  <div class="page-body-title">
      <div class="pbt-header">预约试驾</div>
      <div class="pbt-ft">欢迎在线预约试驾。</div>
  </div>
  <div class="page-body-content">
      <input class="pbc-input" id="input-name" type="text" name="familyName" placeholder="请输入您的姓氏">
      <input class="pbc-input" id="input-phone" type="text" maxlength="11" name="mobilePhone" placeholder="请输入您的手机号">
      <button class="pbc-button" id="pbc-button" type="submit" name="submit">即刻预约</button>
  </div>
{% endblock %}

{% block js %}
<script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
<script src="/javascripts/index.js"></script>
{% endblock %}



