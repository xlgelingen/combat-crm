{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>新增角色</title>
{% endblock %}

{% block page_content %}  
    <div class="content-title">新增角色</div>
    <div class="content-control">
      <a href="/admin/role">返回角色列表 >></a>
    </div>
    <div class="content-form">
      <div class="form-item">
        <input type="text" class="form-input" id="input-name" placeholder="名称"/>
      </div>
      <div class="form-item">
        <input type="text" class="form-input" id="input-slug" placeholder="展示名称"/>
      </div>
      <div class="form-item">
        <textarea class="form-textarea role-describe" id="input-describe" placeholder="请输入描述～"></textarea>
      </div>
      <div class="form-item permission-box">
      {% for permission in permissions %}
        <input type="checkbox" class='permission-item' id="checkbox{{permission.id}}" name="checkbox" value="{{permission.id}}">
        <label for="checkbox{{permission.id}}">{{permission.name}}</label>
      {% endfor %}
      </div>
      <div class="form-item">
        <button class="form-button" id="form-button">新增</button>
      </div>

    </div>
    
{% endblock %} 

{% block js %}
    {{ super() }}
    <script src="/javascripts/role_create.js"></script>
{% endblock %}

