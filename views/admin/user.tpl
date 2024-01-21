{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>用户列表</title>
{% endblock %}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/user.css">
{% endblock %}

{% block page_content %}  
    <div class="content-title">用户管理</div>
    <div class="content-control">
        <a href="/admin/user/create">新增用户 >></a>
    </div>
    <div class="content-table">
        <table class="table-container">
            <tr>
                <th>姓名</th>
                <th>电话</th>
                <th>密码</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            {% for user in users %}
            <tr class="table-user">
                <td>{{user.name}}</td>
                <td>{{user.phone}}</td>
                <td>{{user.password}}</td>
                <td>{{user.create_time}}</td>
                <td><a class="user-edit" data-id="{{user.id}}" href="/admin/user/{{user.id}}/edit">编辑</a></td>
            </tr>
            {% endfor %}
        </table>
        <div class="table-pagination" id="table-pagination">
            <div class="pagination-index" id="pagination-index" data-index="{{pageInfo.index}}" hidden></div>
            <a class="pagination-item" data-index="1" href="?page_index=1&page_size=20">1</a>
            <a class="pagination-item" data-index="2" href="?page_index=2&page_size=20">2</a>
            <a class="pagination-item" data-index="3" href="?page_index=3&page_size=20">3</a>
        </div>
    </div>
{% endblock %} 

{% block js %}
    {{ super() }}
    <script src="/javascripts/user.js"></script>
{% endblock %}

