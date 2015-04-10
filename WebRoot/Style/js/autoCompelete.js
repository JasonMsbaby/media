/**
 * 自动补全
 */
function initAutoComplete1(json) {
    $("#goods").autocomplete(
	    json,
	    {
		minChars : 0,
		dataType : "json",
		matchContains : true,
		formatItem : function(row, i, max) {
		    return "【序号：" + row.goId + "】-【编号：" + row.goNo + "】-【类型："
			    + row.goType + "】-【名称：" + row.goName + "】-【型号："
			    + row.goVersion + "】";
		},
		formatMatch : function(row, i, max) {
		    return row.goId + row.goNo + row.goType + row.goName
			    + row.goVersion;
		},
		formatResult : function(row) {
		    return row.goId;
		}
	    });
}
function initAutoComplete2(json) {
    $("#guest").autocomplete(
	    json,
	    {
		minChars : 0,
		dataType : "json",
		matchContains : true,
		formatItem : function(row, i, max) {
		    return "【序号：" + row.gId + "】-【编号：" + row.gNo + "】-【性别："
			    + row.gSex + "】-【姓名：" + row.gName + "】-【手机号："
			    + row.gPhone + "】";
		},
		formatMatch : function(row, i, max) {
		    return row.gId + row.gNo + row.gSex + row.gName
			    + row.gPhone;
		},
		formatResult : function(row) {
		    return row.gId;
		}
	    });
}

$(document).ready(function() {
    $("#goods").focus(function() {
	var keyword = $(this).val();
	$.post("goods/getGoodsJson", {
	    "keyword" : keyword
	}, function(data) {
	    initAutoComplete1(data);
	}, "json");
    });
    $("#guest").focus(function() {
	var keyword = $(this).val();
	$.post("guest/getGuestJson", {
	    "keyword" : keyword
	}, function(data) {
	    initAutoComplete2(data);
	}, "json");
    });
});