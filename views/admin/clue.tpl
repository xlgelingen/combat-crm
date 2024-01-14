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
      <th>操作</th>
    </trs>
    <tr>
      <td>顾一</td>
      <td>13511111111</td>
      <td>baidu_search</td>
      <td>2024.01.14</td>
      <td>季梦</td>
      <td>意向强烈</td>
      <td><a class="user-edit" href="/admin/clue/1">跟踪</a></td>
    </tr>
    <tr>
      <td>赵二</td>
      <td>13522222222</td>
      <td>baidu_search</td>
      <td>2024.01.14</td>
      <td>季梦梦</td>
      <td>意向强烈</td>
      <td><a class="user-edit" href="/admin/clue/1">跟踪</a></td>
    </tr>
    <tr>
      <td>苏三</td>
      <td>13533333333</td>
      <td>baidu_search</td>
      <td>2024.01.14</td>
      <td>王晨晨</td>
      <td>意向强烈</td>
      <td><a class="user-edit" href="/admin/clue/1">跟踪</a></td>
    </tr>
  </table>
</div>
{% endblock %} 

