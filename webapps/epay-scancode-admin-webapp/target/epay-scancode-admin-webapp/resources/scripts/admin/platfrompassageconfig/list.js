$(function(){Metronic.init();Layout.init();QuickSidebar.init();Demo.init();$(".date-picker").datepicker({rtl:Metronic.isRTL(),orientation:"left",autoclose:true});$("#query").click(function(){var a=$("#form").serialize();$.ajax({type:"POST",url:"platfrompassageconfig/content",data:a,success:function(b){$("#tablec").html(b)}})});$("#cancle").click(function(){$(".form-horizontal input").val("");$(".form-horizontal select").val("")});toPage(1)});function del(a){bootbox.setLocale("zh_CN");bootbox.confirm("确定执行该操作吗?",function(b){if(b){$.ajax({type:"POST",url:"platfrompassageconfig/del",data:{id:a},success:function(c){c=$.parseJSON(c);bootbox.alert(c.message,function(){if(c.status==1){window.location.reload()}})}})}})}function toPage(a){var b=$("#form").serialize();var c="tablec";$.ajax({type:"POST",url:"platfrompassageconfig/content?pageNo="+a,data:b,success:function(d){$("#"+c).html(d)}})};