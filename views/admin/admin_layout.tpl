{% extends '../layout.tpl'%}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/admin_layout.css">
  <link rel="stylesheet" href="/stylesheets/icon-font/iconfont.css">
{% endblock %}

{% block page_header %}
    <div class="header-right">
        <div class="header-right-username">{{userInfo.name}}</div>
        <a class="header-right-logout" id="logout-button" href="/logout">退出</a>
    </div>
{% endblock %}

{% block content%}
    <div class="page-aside">
        <nav class="page-nav">
            <ul>
                {% if userInfo.role == 1%}
                <li>
                    <div class="right-control-box">
                        <div class="page-nav-item right-control" id='right-control'>
                            权限管理
                            <span class='iconfont icon-xiangxiajiantou1' id='iconfont'></span>
                        </div>
                        <div class="sub-control-box" id='sub-control-box'>
                            <a class="page-nav-item user-control sub-control" href="/admin/user?page_index=1&page_size=20">用户管理</a>
                            <a class="page-nav-item role-control sub-control" href="/admin/role">角色管理</a>
                        </div>
                        
                    </div>
                    <div>
                    
                </li>
                {% endif %}
                
                <li>
                    <a class="page-nav-item clue-control" href="/admin/clue">线索管理</a>
                </li>
            </ul>
        </nav>
    </div>
    
    <div class="page-content">
          {% block page_content %}  
          {% endblock %}        
    </div>
{% endblock %}

{% block js %}
<script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
<script src="/javascripts/admin_layout.js"></script>
{% endblock %}
