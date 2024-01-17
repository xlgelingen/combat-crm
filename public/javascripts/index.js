const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        let button = $('#pbc-button');
        button.on('click', this.addClue);
    },

    addClue: function (e) {
        let name = $('#input-name').val();
        let phone = $('#input-phone').val();
        let utm = PAGE.getQuery('utm')

        if (phone.length != 11) {
            alert('手机号出错，请输入11位的手机号');
            return;
        }

        if (!name || !phone) {
            alert('缺少必要信息');
            return
        }

        $.ajax({
            url: '/api/clue',
            data: { name, phone, utm },
            type: 'POST',
            //在请求发送之前调用的回调函数，在这里，禁用提交按钮，防止用户重复点击
            beforeSend: function () {
                $("#pbc-button").attr("disabled", true);
            },
            success: function (data) {
                if (data.code === 200) {
                    alert('预约成功！');
                    location.reload();
                } else {
                    console.log(data);
                }
            },
            error: function (err) {
                console.log(err);
            },
            // 无论请求成功或失败，都会在请求完成后调用的回调函数,在这里，重新启用提交按钮
            complete: function () {
                $("#pbc-button").attr("disabled", false);
            }
        })
    },

    getQuery: function (params) {
        var data = location.search.match(new RegExp('[\?\&]' + params + '=([^\&]+)', 'i'));
        if (!data || data.length < 1) {
            return '';
        }
        return data[1];
    }
}

PAGE.init();