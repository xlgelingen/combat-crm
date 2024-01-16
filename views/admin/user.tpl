{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>用户列表</title>
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
                <th>角色</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            {% for user in users %}
            <tr class="table-user">
                <td>{{user.name}}</td>
                <td>{{user.phone}}</td>
                <td>{{user.password}}</td>
                <td>{{user.roleName}}</td>
                <td>{{user.create_time}}</td>
                <td><a class="user-edit" data-id="{{user.id}}" href="/admin/user/{{user.id}}/edit">编辑</a></td>
            </tr>
            {% endfor %}
        </table>
    </div>
{% endblock %} 

{% block js %}
<script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
<script src="/javascripts/user.js"></script>
{% endblock %}

