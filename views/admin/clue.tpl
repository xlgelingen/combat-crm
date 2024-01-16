{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>线索管理</title>
{% endblock %}

{% block page_content %}  
    <div class="content-title">线索管理</div>
    <div class="content-table">
  <table class="table-container">
    <tr>
      <th>姓名</th>
      <th>电话</th>
      <th>来源</th>
      <th>创建时间</th>
      <th>跟踪销售</th>
      <th>状态</th>
      <th>备注</th>
      <th>操作</th>
    </tr>

    {% for clue in clues %}
    <tr class="table-clue">
        <td>{{clue.name}}</td>
        <td>{{clue.phone}}</td>
        <td>{{clue.utm}}</td>
        <td>{{clue.create_time}}</td>
        <td>{{clue.sale_name}}</td>
        <td>{{clue.statusName}}</td>
        <td>{{clue.remark}}</td>
        <td><a class="user-edit" data-id="{{clue.id}}" href="/admin/clue/{{clue.id}}">跟踪</a></td>
    </tr>
    {% endfor %}

  </table>
</div>
{% endblock %} 

{% block js %}
<script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
<script src="/javascripts/clue.js"></script>
{% endblock %}

