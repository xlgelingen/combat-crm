{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>新增用户</title>
{% endblock %}

{% block page_content %}  
    <div class="content-title">新增用户</div>
    <div class="content-control">
      <a href="/admin/user">返回用户列表 >></a>
    </div>
    <div class="content-form">
      <div class="form-item">
        <input type="text" class="form-input" id="input-name" placeholder="姓名"/>
      </div>
      <div class="form-item">
        <input type="text" class="form-input" id="input-phone" maxlength="11" placeholder="电话"/>
      </div>
      <div class="form-item">
        <input type="text" class="form-input" id="input-password" minlength="8" placeholder="密码(不少于8位)"/>
      </div>
      <div class="form-item">
        <select class="form-input" id="input-role">
          <option value="0" disabled selected>请选择角色</option>
          <option value="1">管理员</option>
          <option value="2">销售</option>
        </select>
      </div>
      <div class="form-item">
        <button class="form-button" id="form-button">新增</button>
      </div>

    </div>
    
{% endblock %} 

{% block js %}
<script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
<script src="/javascripts/user_create.js"></script>
{% endblock %}

