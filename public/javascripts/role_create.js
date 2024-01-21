const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        let title = $('.role-control');
        title.addClass('active');

        let button = $('#form-button');
        button.on('click', this.addRole);
    },

    addRole: function (e) {
        let name = $('#input-name').val();
        let slug = $('#input-slug').val();
        let describe = $('#input-describe').val();
        let permissionsOrigin = $('.permission-item');
        console.log(permissionsOrigin)
        let permissionsEle = permissionsOrigin.filter(function () {
            return this.checked;
        }).toArray();
        console.log(permissionsEle)
        let permissions = permissionsEle.map(item => {
            return item.value;
        });
        // let permissionsEle = permissionsOrigin.filter(function () {
        //     return this.checked;
        // });
        // console.log(permissionsEle)
        // let permissions = permissionsEle.map(function () {
        //     return this.value;
        // }).toArray();

        if (!name || !slug || !describe || !permissions) {
            alert('缺少必要信息');
            return
        }
        console.log(name, slug, describe, permissions)

        $.ajax({
            url: '/api/role/create',
            data: { name, slug, describe, permissions:JSON.stringify(permissions) },
            type: 'POST',
            beforeSend: function () {
                $("#form-button").attr("disabled", true);
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
            },
            complete: function () {
                $("#form-button").attr("disabled", false);
            }
        })
    }
}

PAGE.init();