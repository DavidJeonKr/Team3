$(function(){


    //"transform" : "scale(1.2)"


    let imgWidth = $(".slide li").width();

  
    let roll = setInterval(next, 600)

    function next(){
    $(".slide").delay(3000).animate({marginLeft: -imgWidth}, 600, "swing", function(){
        $(".slide>li:first").appendTo(".slide");
        $(".slide").css({marginLeft: 0});
    });
   };



    $(".minititle").on({
        mouseenter: function(){
            $(this).children("a").children("img").css("transform", "scale(1.1)");
        },
        mouseleave: function(){
            $(this).children("a").children("img").css("transform", "scale(1)");
        }
    });

    
    setInterval(function(){
        let liHeight = $(".noticeBox ul li").height();
        console.log(liHeight);
        
        $(".noticeBox ul").animate({ "marginTop": -liHeight }, 1000, "swing", function(){
            $(".noticeBox ul li").eq(0).appendTo(".noticeBox ul");
            $(this).css("marginTop", 0);
        })
    }, 3000);

});