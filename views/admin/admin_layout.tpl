{% extends '../layout.tpl'%}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/admin_layout.css">
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
                <li>
                    <a class="page-nav-item user-control" href="/admin/user">用户管理</a>
                </li>
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
