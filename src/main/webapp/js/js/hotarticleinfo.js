$(function(){
    var $cur = 1;//初始化显示的版面
    var $i = 4;//每版显示数
    var $len = $('.showbox>ul>li').length;//计算列表总长度(个数)
    var $pages = Math.ceil($len / $i);//计算展示版面数量
    var $w = $('.ibox').width();//取得展示区外围宽度
    var $showbox = $('.showbox');
    // var $num = $('span.num li')
    var $pre = $('span.pre')
    var $next = $('span.next');
    var $autoFun;
    //@Mr.Think***调用自动滚动
    autoSlide();
    //@Mr.Think***向前滚动
    $pre.click(function(){
        if (!$showbox.is(':animated')) {  //判断展示区是否动画
            if ($cur == 1) {   //在第一个版面时,再向前滚动到最后一个版面
                $showbox.animate({
                    left: '-=' + $w * ($pages - 1)
                }, 500); //改变left值,切换显示版面,500(ms)为滚动时间,下同
                $cur = $pages; //初始化版面为最后一个版面
            }
            else {
                $showbox.animate({
                    left: '+=' + $w
                }, 500); //改变left值,切换显示版面
                $cur--; //版面累减
            }
       
        }
    });
    //向后滚动
    $next.click(function(){
        if (!$showbox.is(':animated')) { //判断展示区是否动画
            if ($cur == $pages) {  //在最后一个版面时,再向后滚动到第一个版面
                $showbox.animate({
                    left: 0
                }, 500); //改变left值,切换显示版面,500(ms)为滚动时间,下同
                $cur = 1; //初始化版面为第一个版面
            }
            else {
                $showbox.animate({
                    left: '-=' + $w
                }, 500);//改变left值,切换显示版面
                $cur++; //版面数累加
            }
        }
    });
    function autoSlide(){
        $next.trigger('click');
    }
});