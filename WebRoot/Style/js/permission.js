$(function() {
	//提交修改
	$("#btn_submit").click(function() {
		var cks = $(":checkbox");
		var selected="";
		for ( var i = 0; i < cks.length; i++) {
			if ($(cks[i]).prop("checked")==true) {
				if($(cks[i]).val()!="全选"){
					selected+=$(cks[i]).val()+",";
				}
			}
		}
		$("#permission").attr("value",selected);
		//$("form:first").submit();
	});
	//自动收缩
	$(".nav11").click(function(){
		$(this).next().toggle();
		if($(this).next().css("display")=="none"){
			$(this).parent().attr("class","icon-folder-o");
			$(this).attr("class","icon-plus-square-o");
		}else{
			$(this).parent().attr("class","icon-folder-open-o");
			$(this).attr("class","icon-minus-square-o");
		}
		
	});
	$(".nav22").click(function(){
		$(this).next().next().toggle();
		if($(this).next().next().css("display")=="none"){
			$(this).parent().attr("class","icon-folder-o");
			$(this).attr("class","icon-plus-square-o");
		}else{
			$(this).parent().attr("class","icon-folder-open-o");
			$(this).attr("class","icon-minus-square-o");
		}
		
	});
		
	//全选
	$("#allCheck").click(function(){
		//alert("asfd");
		if($(this).prop("checked")==true){
			$(":checkbox").prop("checked",true);
		}else{
			$(":checkbox").prop("checked",false);
		}
	});
	
	//权限菜单级联选择
	$(":checkbox").click(function(){
		var class1=$(this).attr("class").split("-")[0];
		var class2=$(this).attr("class").split("-")[1];
		if(class1=="check2"){
			if($(this).prop("checked")==true){
				$(".check3-"+class2).prop("checked",true);
			}else{
				$(".check3-"+class2).prop("checked",false);
			}
		}else{
			if($(this).prop("checked")==true){
				$(".check2-"+class2).prop("checked",true);
			}else{
				//$(".check3-"+class2).prop("checked",false);
			}
		}
		
	});
});