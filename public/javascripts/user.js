const PAGE = {
    init: function () {
        this.bind();
    },
    bind: function () {
        this.addActive();
    },

    addActive: function () {
        let title = $('.user-control');
        title.addClass('active');

        let pageList = [];
        pageList=$('.pagination-item');
        console.log(pageList)
        let pageIndex = $('#pagination-index').data('index')

        pageList.each(function(){
            if($(this).data('index') == pageIndex){
                $(this).addClass('active');
                $(this).attr('href', 'javascript:void(0)');
            }
        })
    }
}

PAGE.init();