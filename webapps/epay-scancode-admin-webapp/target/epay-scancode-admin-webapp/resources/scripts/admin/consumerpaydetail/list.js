$(function(){$("#query").click(function(){toPage(1)});toPage(1)});function toPage(a){var b=$("#form").serialize();var c="tablec";refreshData(c);$.ajax({type:"POST",url:"consumerpaydetail/content?pageNo="+a,data:b,success:function(d){$("#"+c).html(d)},error:function(d,f,e){hasError(d,f,e,c)}})}function updateStatus(b){var d=$(b);var c=d.attr("value");var a=d.attr("status");bootbox.setLocale("zh_CN");bootbox.confirm("确定执行该操作吗?",function(e){if(e){$.ajax({type:"POST",url:"consumerpaydetail/updateStatus",data:{id:c,status:a},success:function(f){f=$.parseJSON(f);bootbox.alert(f.values,function(){if(f.executeStatus==0){a=a==3?5:3;d.parent().prev().prev().html(d.text().trim()=="启用"?"平台审核通过":d.text().trim());var g=d.text().trim()=="启用"?'<span class="label label-danger">禁用</span>':'<span class="label label-success">启用</span>';d.attr("status",a);d.html(g)}})}})}})}function del(a){bootbox.setLocale("zh_CN");bootbox.confirm("确定执行该操作吗?",function(b){if(b){$.ajax({type:"POST",url:"consumerpaydetail/del",data:{id:a},success:function(c){c=$.parseJSON(c);bootbox.alert(c.values,function(){if(c.executeStatus==0){window.location.reload()}})}})}})};