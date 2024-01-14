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
                <th>角色</th>
                <th>创建时间</th>
                <th>操作</th>
                </trs>
            <tr>
                <td>赵倩</td>
                <td>13511111111</td>
                <td>管理员</td>
                <td>2024.01.14</td>
                <td><a class="user-edit" href="/admin/user/1/edit">编辑</a></td>
            </tr>
            <tr>
                <td>孙立</td>
                <td>13522222222</td>
                <td>管理员</td>
                <td>2024.01.14</td>
                <td><a class="user-edit" href="/admin/user/2/edit">编辑</a></td>
            </tr>
            <tr>
                <td>季梦梦</td>
                <td>13533333333</td>
                <td>销售</td>
                <td>2024.01.14</td>
                <td><a class="user-edit" href="/admin/user/3/edit">编辑</a></td>
            </tr>
            <tr>
                <td>王晨晨</td>
                <td>13533333333</td>
                <td>销售</td>
                <td>2024.01.14</td>
                <td><a class="user-edit" href="/admin/user/3/edit">编辑</a></td>
            </tr>
        </table>
    </div>
{% endblock %} 

