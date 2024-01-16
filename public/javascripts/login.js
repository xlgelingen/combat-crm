const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        let button = $('#pbc-button');
        button.on('click', this.login);
    },

    login: function (e) {
        let phone = $('#input-phone').val();
        let password = $('#input-password').val();

        if(phone.length != 11){
            alert('手机号出错，请输入11位的手机号');
            return;
        }

        if(password.length < 8){
            alert('请输入至少8位的密码');
            return;
        }

        if (!phone || !password) {
            alert('缺少必要信息');
            return
        }

        $.ajax({
            url: '/api/login',
            data: {phone, password},
            type: 'POST',
            beforeSend: function() {
                $("#pbc-button").attr("disabled",true);
            },
            success: function (data) {
                if (data.code === 200) {
                    alert('登录成功！');
                    location.reload();
                } else {
                    alert('登陆失败，没有此用户')
                    console.log(data);
                    location.reload();
                }
            },
            error: function (err) {
                console.log(err);
            }
        })
    }
}

PAGE.init();