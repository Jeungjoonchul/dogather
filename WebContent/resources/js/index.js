
  $(function(){
    $('#fullpage').fullpage({
      //options here
      anchors:['section1','section2','section3'],
      sectionsColor:['rgba(98,26,229,0.85)','rgba(98,26,229,0.7)','rgba(98,26,229,0.6)'],
      navigation:true,
      navigationPosition:'right'
  });
    });
  
    // var now_img;
    // var last_img;

    // window.onload = function(){
    //   setInterval("fn_change()",2000);
    // }
    // function fn_change(){
    //   now_img= $("img").eq(0);
    //   last_img= $("img").eq(-1);

    //   last_img.addClass("z-idx").css("opacity",0).animate({"opacity":1},1000, function(){
    //     $(".m-img_ani").prepend(last_img);
    //     now_img.removeClass("z-idx");
    //   });
    // }

    var img=new Array();
img[0]=new Image(); img[0].src=cp+"/resources/images/1.jpg";
img[1]=new Image(); img[1].src=cp+"/resources/images/2.jpg";
img[2]=new Image(); img[2].src=cp+"/resources/images/3.jpg";
img[3]=new Image(); img[3].src=cp+"/resources/images/4.jpg";
img[4]=new Image(); img[4].src=cp+"/resources/images/5.jpg";
var interval=2000;
var n=0;
var imgs = new Array(cp+"/resources/images/1.jpg",cp+"/resources/images/2.jpg",cp+"/resources/images/3.jpg",cp+"/resources/images/4.jpg",cp+"/resources/images/5.jpg");
function rotate()
{
if(navigator.appName=="Netscape" && document.getElementById)
{
document.getElementById("slide").src=imgs[n];
}
else document.images.slide.src=imgs[n];
(n==(imgs.length-1))?n=0:n++;
setTimeout("rotate()",interval);
}
