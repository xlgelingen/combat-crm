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
      <input class="pbc-input" type="text" name="familyName" placeholder="请输入您的姓氏" maxlength="20"
                    minlength="1" data-error="请输入正确的姓名（汉字或字母）" data-limit-error="请输入20位以下的姓名" value="">
      <input class="pbc-input" type="text" maxlength="11" name="mobilePhone" placeholder="请输入您的手机号"
                    data-error="请输入中国大陆手机号码（11位数字）" value="">
      <button class="pbc-button" type="submit" name="submit">
                    即刻预约
      </button>
  </div>
{% endblock %}



