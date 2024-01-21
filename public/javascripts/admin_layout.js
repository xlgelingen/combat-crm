const LAY = {
    data:{
        wraplist:false
    },

    init: function () {
        this.bind();
    },
    bind: function () {
        let control = $('#right-control');
        control.on('click', this.listOprate)
    },
    listOprate: function(){
        let sub = $('#sub-control-box');
        let arrow = $('#iconfont');
        let wraplist = !LAY.data.wraplist;
        if (wraplist) {
            sub.css('display', 'none');
            arrow.attr('class','iconfont icon-xiangshangjiantou');
        }
        else {
            sub.css('display', 'block');
            arrow.attr('class','iconfont icon-xiangxiajiantou1');
        }
        LAY.data.wraplist=wraplist;
    }
}

LAY.init();

