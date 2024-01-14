{% extends '../layout.tpl'%}

{% block css %}
  {{ super() }}
  <link rel="stylesheet" href="/stylesheets/admin_layout.css">
{% endblock %}

{% block page_header %}
    <div class="header-right">
        <div class="header-right-username">林夕</div>
        <div class="header-right-logout">退出</div>
    </div>
{% endblock %}

{% block content%}
    <div class="page-aside">
        <nav class="page-nav">
            <ul>
                <li>
                    <a class="page-nav-item" href="/admin/user">用户管理</a>
                </li>
                <li>
                    <a class="page-nav-item" href="/admin/clue">线索管理</a>
                </li>
            </ul>
        </nav>
    </div>
    
    <div class="page-content">
          {% block page_content %}  
          {% endblock %}        
    </div>
{% endblock %}

