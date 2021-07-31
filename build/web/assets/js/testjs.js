/*
 * bootstrap-tagsinput v0.8.0
 * 
 */

$(document).ready(function(){
 var totalrows = $(".divControl").length;
 var pageSize=5;
 var noOfPage = totalrows/pageSize;
 noOfPage = Math.ceil(noOfPage);
 for(var i=1;i<=noOfPage;i++)
  {
   $("#divPages").append('<div class="page">'+i+'</div>'); 
  }
  var totalPagenum = $("div.page").length;
  if(totalPagenum >3)
  {
   $("div.page").hide();
   for(var n=1;n<=3;n++)
   {
    $("div.page:nth-child("+n+")").show();
   }
  }
  $("div.divControl").hide();
 for(var j=1;j<=pageSize;j++)
  {
    $("div.divControl:nth-child("+j+")").show();
  }
  displayevent();
   $("div.next").click(function(){
   if($("div.selected:last").nextAll('div.page').length > 3)
  {
       $("div.selected").last().nextAll(':lt(3)').show();
       $("div.selected").hide();
       displayevent();
       //lastposevent();
       $("div.prev").show();
       $("div.next").show();
   }
   else{
    $("div.selected").last().nextAll().show();
    $("div.selected").hide();
    displayevent();
    $("div.next").hide();
    $("div.prev").show();
   }
  });
  $("div.prev").click(function(){
  if($("div.selected:first").prevAll('div.page').length > 3)
  {
       $("div.selected").first().prevAll(':lt(3)').show();
       $("div.selected").hide();
       $("div.prev").show();
       $("div.next").show();
       displayevent();
  }
  else{
  $("div.selected").first().prevAll().show();
       $("div.selected").hide();
       $("div.prev").hide();
       $("div.next").show();
       displayevent();
       }
  });
 $("div.page").click(function(){
  var currentPage = $(this).text();
      $("div.divControl").hide();
  for(var k=(currentPage*2)-1;k<=(currentPage*2);k++)
  {
    $("div.divControl:nth-child("+k+")").show();
  }  
  });
});
function displayevent()
{
  $("div.page").each(function(){
   if( $(this).css('display') === 'block') {
	$(this).addClass('selected');
  }
  else{
  $(this).removeClass('selected');
  }
  });
}