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
        {% if userInfo.role == 1%}
            <div class="form-section">
                <div class="form-item">
                  <span class="form-text">客户名称：{{clue.name}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">联系电话：{{clue.phone}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">线索来源：{{clue.utm}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">创建时间：{{clue.create_time}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">当前分配的销售：</span>
                  <input type="text" class="form-input" id="input-sale" placeholder="姓名" value="{{clue.sale_name}}"/>
                </div>
                <div class="form-item">
                  <span class="form-text">用户状态：</span>
                  <select class="form-input" id="input-status">
                    <option value="0" disabled selected>请选择线索状态</option>
                    <option value="1">没有意向</option>
                    <option value="2">意向一般</option>
                    <option value="3">意向强烈</option>
                    <option value="4">完成销售</option>
                    <option value="5">取消销售</option>
                  </select>
                </div>
                <div class="form-item">
                  <p class="form-text">备注：</p>
                  <textarea class="form-textarea" id="input-remark" placeholder="备注信息" >{{clue.remark}}</textarea>
                </div>
                <div class="form-item">
                  <button class="form-button" id="save-button" data-id="{{clue.id}}">保存</button>
                </div>
            </div>
        {% endif %}
        
        {% if userInfo.role == 2%}
            <div class="form-section">
                <div class="form-item">
                  <span class="form-text">客户名称：{{clue.name}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">联系电话：{{clue.phone}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">线索来源：{{clue.utm}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">创建时间：{{clue.create_time}}</span>
                </div>
                <div class="form-item">
                  <span class="form-text">
                      当前分配的销售：
                      <span id="clue-sale_name">{{clue.sale_name}}</span>
                  </span>
                </div>
                <div class="form-item">
                  <span class="form-text">用户状态：</span>
                  <select class="form-input" id="input-status">
                    <option value="0" disabled selected>请选择线索状态</option>
                    <option value="1">没有意向</option>
                    <option value="2">意向一般</option>
                    <option value="3">意向强烈</option>
                    <option value="4">完成销售</option>
                    <option value="5">取消销售</option>
                  </select>
                </div>
                <div class="form-item">
                  <p class="form-text">备注：</p>
                  <textarea class="form-textarea" id="input-remark" placeholder="备注信息" >{{clue.remark}}</textarea>
                </div>
                <div class="form-item">
                  <button class="form-button" id="save-button" data-id="{{clue.id}}">保存</button>
                </div>
            </div>
        {% endif %}

        <div class="log-section">
            <ul class="log-list">
            {% for log in clueLogs %}
              <li class="log-item">
                <p class="log-data">{{log.create_time}}</p>
                <p class="log-content">{{log.content}}</p>
              </li>
            {% endfor %}
            </ul>

            <div class="log-form">
              <div class="form-item">
                <p class="form-text">添加记录：</p>
                <textarea class="form-textarea" id="input-log" placeholder="请输入本次跟踪的记录 ～"></textarea>
              </div>
              <div class="form-item">
                <button class="form-button" id="add-button" data-id="{{clue.id}}">添加</button>
              </div>
            </div>
        </div>
    </div>
{% endblock %} 

{% block js %}
    {{ super() }}
    <script src="/javascripts/clue_log.js"></script>
{% endblock %}

