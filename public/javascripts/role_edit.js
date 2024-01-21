const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        let title = $('.role-control');
        title.addClass('active');

        this.index();

        let button = $('#form-button');
        button.on('click', this.editUser);
    },

    index:function(){
        let rolePermissionsEle = $('#role-permissions');
        let rolePermissions = rolePermissionsEle.val();
        console.log('rolePermissions:',rolePermissions)

        let permissionsOrigin = $('.permission-item').toArray();
        console.log('permissionsOrigin:',permissionsOrigin)

        let permissionsEle = permissionsOrigin.filter(function (item) {
            var value = item.value;
            console.log('value:',value)
            return rolePermissions.includes(value);
        });
        console.log('permissionsEle:',permissionsEle)

        permissionsEle.forEach(item => {
            item.checked = true;
        });
    },

    editUser: function (e) {
        let id = $(e.target).data("id");
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
            var value = Number(item.value);
            return value;
        });

        if (!name || !slug || !describe || !permissions) {
            alert('缺少必要信息');
            return
        }
        console.log(name, slug, describe, permissions)

        $.ajax({
            url: '/api/role/edit',
            data: { id, name, slug, describe, permissions:JSON.stringify(permissions)  },
            type: 'PUT',
            beforeSend: function () {
                $("#form-button").attr("disabled", true);
            },
            success: function (data) {
                if (data.code === 200) {
                    alert('修改成功！');
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