{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>角色列表</title>
{% endblock %}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/role.css">
{% endblock %}

{% block page_content %}  
    <div class="content-title">角色管理</div>
    <div class="content-control">
        <a href="/admin/role/create">新增角色 >></a>
    </div>
    <div class="content-table">
        <table class="table-container">
            <tr>
                <th>名称</th>
                <th>展示名称</th>
                <th>描述</th>
                <th>创建时间</th>
                <th colspan="2">操作</th>
            </tr>
            {% for role in roles %}
            <tr class="table-role">
                <td>{{role.slug}}</td>
                <td>{{role.name}}</td>
                <td>{{role.describe}}</td>
                <td>{{role.create_time}}</td>
                <td><a class="role-edit" data-id="{{role.id}}" href="/admin/role/{{role.id}}/edit?permission={{role.permissions}}">编辑</a></td>
                <td><span class='role-del'  data-id="{{role.id}}">删除</span></td>
            </tr>
            {% endfor %}
        </table>
    </div>
{% endblock %} 

{% block js %}
    {{ super() }}
    <script src="/javascripts/role.js"></script>
{% endblock %}

