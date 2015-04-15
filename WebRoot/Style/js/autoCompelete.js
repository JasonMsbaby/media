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
function initAutoComplete3(json) {
    $("#saled").autocomplete(
	    json,
	    {
		minChars : 0,
		dataType : "json",
		matchContains : true,
		formatItem : function(row, i, max) {
		    return "【序号：" + row.sId + "】-【销售编号：" + row.sNo + "】-【商品名称："
			    + row.goName + "】-【商品型号：" + row.goVersion + "】-【客户姓名："
			    + row.gName + "】-【手机号："+row.gPhone+"】-【家庭住址："+row.gAdress+"】";
		},
		formatMatch : function(row, i, max) {
		    return row.sId + row.sNo + row.goName + row.goVersion
			    + row.gName+ row.gPhone+ row.gAdress;
		},
		formatResult : function(row) {
		    return row.sId;
		}
	    });
}
function initAutoComplete4(json) {
    $(".uName").autocomplete(
	    json,
	    {
		minChars : 0,
		dataType : "json",
		matchContains : true,
		formatItem : function(row, i, max) {
		    return "姓名：" + row.uName + "-角色：" + row.rName;
		},
		formatMatch : function(row, i, max) {
		    return row.uName + row.rName;
		},
		formatResult : function(row) {
		    return row.uName;
		}
	    });
}
function initAutoComplete5(json) {
    $("#spareParts").autocomplete(
	    json,
	    {
		minChars : 0,
		dataType : "json",
		matchContains : true,
		formatItem : function(row, i, max) {
		    return "【序号：" + row.sbId + "】-【大类：" + row.sbType+ "】-【名称：" + row.sbName+"】";
		},
		formatMatch : function(row, i, max) {
		    return row.sbId + row.sbType+row.sbName;
		},
		formatResult : function(row) {
		    return row.sbId;
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
    $("#saled").focus(function() {
	var keyword = $(this).val();
	$.post("saled/getSalesJson", {
	    "keyword" : keyword
	}, function(data) {
	    initAutoComplete3(data);
	}, "json");
    });
    $(".uName").focus(function() {
	var keyword = $(this).val();
	$.post("sys/getUserJson", {
	    "keyword" : keyword
	}, function(data) {
	    initAutoComplete4(data);
	}, "json");
    });
    $("#spareParts").focus(function() {
	var keyword = $(this).val();
	$.post("sparePartsBase/getSparePartsJason", {
	    "keyword" : keyword
	}, function(data) {
	    initAutoComplete5(data);
	}, "json");
    });
});