const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        let title = $('.clue-control');
        title.addClass('active');

        let saveButton = $('#save-button');
        saveButton.on('click', this.editClueLog);

        let addButton = $('#add-button');
        addButton.on('click', this.addClueLog);
    },

    editClueLog: function (e) {
        let id = $(e.target).data("id");
        let sale_name = $('#input-sale').val() || $('#clue-sale_name').text();
        let status = $('#input-status').val();
        let remark = $('#input-remark').val();
        
        if (!sale_name || !status || !remark) {
            alert('缺少必要信息');
            return
        }

        $.ajax({
            url: '/api/clue_log',
            data: { id, sale_name, status, remark},
            type: 'PUT',
            beforeSend: function() {
                $("#save-button").attr("disabled",true);
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
                $("#save-button").attr("disabled", false);
            }
        })
    },

    addClueLog: function (e) {
        let content = $('#input-log').val();
        let cule_id = $(e.target).data("id");
        if (!content || !cule_id) {
            alert('缺少必要信息');
            return
        }

        $.ajax({
            url: '/api/clue_log',
            data: { content, cule_id },
            type: 'POST',
            beforeSend: function() {
                $("#add-button").attr("disabled",true);
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
                $("#add-button").attr("disabled", false);
            }
        })
    }
}

PAGE.init();