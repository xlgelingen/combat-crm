{% extends "./admin_layout.tpl" %}

{% block title %}
  <title>线索管理</title>
{% endblock %}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/clue_log.css">
{% endblock %}

{% block page_content %}  

    <div class="content-title">线索跟踪</div>

    <div class="content-control">
      <a href="/admin/clue">返回线索列表 >></a>
    </div>

    <div class="content-mainer">
        <div class="form-section">
          <div class="form-item">
            <span class="form-text">客户名称：周秀娜</span>
          </div>
          <div class="form-item">
            <span class="form-text">联系电话：1351231232</span>
          </div>
          <div class="form-item">
            <span class="form-text">线索来源：baidu_search</span>
          </div>
          <div class="form-item">
            <span class="form-text">创建时间：2019-4-1</span>
          </div>
          <div class="form-item">
            <span class="form-text">线索状态：意向强烈</span>
          </div>
          <div class="form-item">
            <span class="form-text">用户状态：</span>
            <select class="form-input">
              <option value="0">请选择线索状态</option>
              <option value="1">没有意向</option>
              <option value="2">意向一般</option>
              <option value="3">意向强烈</option>
              <option value="4">完成销售</option>
              <option value="5">取消销售</option>
            </select>
          </div>
          <div class="form-item">
            <span class="form-text">当前分配的销售：</span>
            <input type="text" class="form-input" placeholder="姓名"/>
          </div>
          <div class="form-item">
            <p class="form-text">备注：</p>
            <textarea class="form-textarea" placeholder="备注信息"></textarea>
          </div>
          <div class="form-item">
            <button class="form-button">保存</button>
          </div>
        </div>

        <div class="log-section">
          <ul class="log-list">
            <li class="log-item">
              <p class="log-data">2024.01.14</p>
              <p class="log-content">第一次打电话过去，用户立刻挂掉，再接再厉</p>
            </li>
            <li class="log-item">
              <p class="log-data">2024.01.14</p>
              <p class="log-content">第一次打电话过去，用户立刻挂掉，再接再厉</p>
            </li>
          </ul>

          <div class="log-form">
            <div class="form-item">
              <p class="form-text">添加记录：</p>
              <textarea class="form-textarea" placeholder="请输入本次跟踪的记录 ～"></textarea>
            </div>
            <div class="form-item">
              <button class="form-button">添加</button>
            </div>
          </div>
        </div>
    </div>
{% endblock %} 

