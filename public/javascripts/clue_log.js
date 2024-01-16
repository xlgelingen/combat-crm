const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        let title = $('.clue-control');
        title.addClass('active');

        let button = $('#form-button');
        button.on('click', this.addUser);
    },

    addUser: function (e) {
        let name = $('#input-name').val();
        let phone = $('#input-phone').val();
        let password = $('#input-password').val();
        let role = $('#input-role').val();
        console.log(name, phone, password, role);
        if (!name || !phone || !password || !role) {
            alert('缺少必要信息');
            return
        }
        console.log(name, phone, password, role)

        $.ajax({
            url: '/api/user/create',
            data: { name, phone, password, role },
            type: 'POST',
            beforeSend: function() {
                $("#form-button").attr("disabled",true);
            },
            success: function (data) {
                if (data.code === 200) {
                    alert('添加成功！');
                    location.reload();
                } else {
                    console.log(data);
                }
            },
            error: function (err) {
                console.log(err);
            }
        })
    }
}

PAGE.init();