const PAGE ={
    init: function(){
        this.bind();
    },
    bind: function(){
       let title = $('.user-control');
       title.addClass('active');
    },
}

PAGE.init();