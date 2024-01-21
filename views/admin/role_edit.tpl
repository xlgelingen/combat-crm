{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>编辑角色</title>
{% endblock %}

{% block page_content %}  
    <div class="content-title" id='content-title'>编辑角色</div>
    <div class="content-control">
      <a href="/admin/role">返回角色列表 >></a>
    </div>
    <div class="content-form">
      <div class="form-item">
        <input type="text" class="form-input" id="input-name" value="{{role.name}}" placeholder="名称"/>
      </div>
      <div class="form-item">
        <input type="text" class="form-input" id="input-slug" value="{{role.slug}}" placeholder="展示名称"/>
      </div>
      <div class="form-item">
        <textarea class="form-textarea role-describe" id="input-describe" placeholder="请输入描述～">{{role.describe}}</textarea>
      </div>
      <div class="form-item">
        <input type="text" id="role-permissions" data-id='{{role.id}}' value='{{role.permissions}}' hidden>
      {% for permission in permissions %}
        <input type="checkbox" class='permission-item' id="checkbox{{permission.id}}" name="checkbox" value="{{permission.id}}">
        <label for="checkbox{{permission.id}}">{{permission.name}}</label>
      {% endfor %}
      </div>
      <div class="form-item">
        <button class="form-button" id="form-button" data-id="{{role.id}}">保存</button>
      </div>
    </div>   
{% endblock %} 

{% block js %}
    {{ super() }}
    <script src="/javascripts/role_edit.js"></script>
{% endblock %}

