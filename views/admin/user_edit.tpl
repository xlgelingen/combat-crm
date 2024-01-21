{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>编辑用户</title>
{% endblock %}

{% block page_content %}  
    <div class="content-title">编辑用户</div>
    <div class="content-control">
      <a href="/admin/user?page_index=1&page_size=20">返回用户列表 >></a>
    </div>
    <div class="content-form">
      <div class="form-item">
        <input type="text" class="form-input" id="input-name" value="{{user.name}}" placeholder="姓名"/>
      </div>
      <div class="form-item">
        <input type="text" class="form-input" id="input-phone" value="{{user.phone}}" placeholder="电话"/>
      </div>
      <div class="form-item">
        <input type="text" class="form-input" id="input-password" value="{{user.password}}" placeholder="密码(不少于8位)"/>
      </div>
      <div class="form-item">
        <select class="form-input" id="input-role">
          <option value="0" disabled selected>请选择角色</option>
          <option value="1">管理员</option>
          <option value="2">销售</option>
        </select>
      </div>
      <div class="form-item">
        <button class="form-button" id="form-button" data-id="{{user.id}}">保存</button>
      </div>
    </div>   
{% endblock %} 

{% block js %}
    {{ super() }}
    <script src="/javascripts/user_edit.js"></script>
{% endblock %}

