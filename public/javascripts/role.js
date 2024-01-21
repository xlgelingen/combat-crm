const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        this.addActive();

        let del = $('.role-del');
        del.on('click', this.delete);
    },

    addActive: function () {
        let title = $('.role-control');
        title.addClass('active');
    },

    delete: function(e){
        let id = $(e.target).data('id');

        $.ajax({
            url: '/api/role/del',
            data: { id},
            type: 'DELETE',
            success: function (data) {
                if (data.code === 200) {
                    alert('删除成功！');
                    location.reload();
                } else {
                    console.log(data);
                }
            },
            error: function (err) {
                console.log(err);
            },
        })
    }
}

PAGE.init();