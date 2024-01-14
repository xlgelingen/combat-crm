<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {% block title %}
    {% endblock %}

    {% block css %}
    <link rel="stylesheet" href="/stylesheets/style.css">
    <link rel="stylesheet" href="/stylesheets/reset.css">
    {% endblock %}
</head>
<body>
    <div class="page-wrapper">
        <div class="page-header">
            <a class="header-logo-container" href="https://www.mercedes-benz.com.cn/homepage.html">
                <img class="header-logo" src="/images/header.png">
            </a>
            {% block page_header %}
            {% endblock %}
        </div>

        <div class="page-body">
            {% block content %}
            {% endblock %}
        </div>

        <div class="page-footer">
            <div class="footer-links">
                <ul class="footer-links-container container-group1">
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/privacy-policy.html" class="link"><span
                                >隐私条款</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/User-Agreement.html" class="link"><span
                                >用户协议</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/complaint-hotline.html" class="link"><span
                                >投诉电话</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/site-map.html" class="link"><span
                                >网站地图</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/legal-notices.html" class="link"><span
                                >法律声明</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/environmental-protection-information.html"
                           class="link"><span >环保信息查询</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.mercedes-benz.com.cn/supplier-information.html" class="link"><span
                                >供应商信息</span></a></li>
                    <li class="footer-links-item fli-group1"><a 
                            href="https://www.denza.com/" class="link"><span >腾势官网</span></a></li>
                </ul>
                <ul class="footer-links-container container-group2">
                    <li class="footer-links-item"><a 
                            href="https://www.mercedes-benz.com.cn/business-license.html" class="link"><span
                                >©梅赛德斯-奔驰版权所有</span></a></li>
                    <li class="footer-links-item"><a 
                            href="https://beian.miit.gov.cn/#/Integrated/index" target="_blank" class="link"><span
                                >京ICP备09046804号-2</span></a></li>
                    <li class="footer-links-item"><a 
                            href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502035702"
                            target="_blank" class="link"><span >京公网安备 11010502035702号 </span></a></li>
                </ul>
            </div>

            <div class="footer-social">
                <ul class="footer-social-container">
                    <li class="footer-social-item">
                        <img src="/images/footer-logo/bc-logo.png" class="fsi-image">
                        <span class="fsi-label">官方在线展厅</span>
                    </li>
                    <li class="footer-social-item">
                        <img src="/images/footer-logo/bc-logo.png" class="fsi-image">
                        <span class="fsi-label">官方应用</span>
                    </li>
                    <li class="footer-social-item">
                        <img src="/images/footer-logo/weixin.png" class="fsi-image">
                        <span class="fsi-label">官方微信</span>
                    </li>
                    <li class="footer-social-item">
                        <img src="/images/footer-logo/tianmao.png" class="fsi-image">
                        <span class="fsi-label">天猫官方旗舰店</span>
                    </li>
                    <li class="footer-social-item">
                        <img src="/images/footer-logo/weibo.png" class="fsi-image">
                        <span class="fsi-label">微博</span>
                    </li>
                    <li class="footer-social-item">
                        <img src="/images/footer-logo/douyin.png" class="fsi-image">
                        <span class="fsi-label">抖音</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    {% block js %}
    {% endblock %}
</body>
</html>
