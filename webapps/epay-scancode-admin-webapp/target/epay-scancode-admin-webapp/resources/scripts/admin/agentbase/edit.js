$(function(){Metronic.init();Layout.init();QuickSidebar.init();Demo.init();$(".date-picker").datepicker({rtl:Metronic.isRTL(),orientation:"left",autoclose:true});$("#cancle").click(function(){history.go(-1)});g();k();$("#agentLevel").change(function(){$("#form").find("#agentNo").val("");$("#-error").remove();g()});function g(){var i=$("#parentNo option")[0];$("#parentNo option").remove();$("#parentNo").append(i);var o=$("#agentLevel").val();var n=$("#channelNo").val();var p=$("#id").val();if(o>1){$.ajax({url:"checkAgentLevel",data:{agentLevel:o,channelNo:n},type:"POST",async:false,success:function(s){s=$.parseJSON(s);if(s.executeStatus=="0"){if(p==""){$("#form").find("#parentNo").attr("disabled",false)}else{$("#form").find("#parentNo").attr("disabled",true)}var r=s.resultList[0];var q=$("#parentNo");$.each(r,function(t,v){var u=$("<option value='"+t+"'>"+t+"+"+v+"</option>");q.append(u)})}else{$("#agentLevel").parent().parent().append('<label id="'+name+'-error" class="error" for="'+name+'">代理商级别没有相对应的上级机构!</label>')}}})}else{if(o==1){if(p==""){$("#form").find("#parentNo").attr("disabled",false)}else{$("#form").find("#parentNo").attr("disabled",true)}var j=$("#channelNo").find("option:selected").attr("channelName");var n=$("#form").find("#channelNo").val();var i=$("#parentNo");var m=$("<option value='"+n+'\' selected="selected" >'+n+"+"+j+"</option>");i.append(m);if(p==""){$.ajax({url:"hasPreCode",data:{agentLevel:o,parentNo:n},type:"POST",async:false,success:function(r){r=$.parseJSON(r);if(r.executeStatus=="0"){var q=r.result;$("#form").find("#agentNo").val(q)}}})}}}}function k(){var i=$("#parentNoVal").val();$('#parentNo option[value="'+i+'"]').attr("selected","selected")}$("#channelNo").change(function(){$("#-error").remove();var i=$("#parentNo option")[0];$("#parentNo option").remove();$("#parentNo").append(i);$("#form").find("#agentLevel").val("");var j=$("#channelNo").val();if(j!=""){$("#form").find("#agentLevel").attr("disabled",false)}else{$("#form").find("#agentLevel").attr("disabled",true)}});$("#parentNo").change(function(){var j=$("#parentNo option:selected").val();var i=$("#agentLevel option:selected").val();$.ajax({url:"hasPreCode",data:{agentLevel:i,parentNo:j},type:"POST",async:false,success:function(n){n=$.parseJSON(n);if(n.executeStatus=="0"){var m=n.result;$("#form").find("#agentNo").val(m)}}})});$.validator.addMethod("isMobile",function(n,j){var m=n.length;var i=/^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;return this.optional(j)||(m==11&&i.test(n))},"请正确填写您的手机号码");$.validator.addMethod("isLegalCard",function(m,j){var i=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;return this.optional(j)||(i.test(m))},"身份证格式错误");$.validator.addMethod("isEnglish",function(m,j){var i=/^[A-Za-z ]+$/;return this.optional(j)||(i.test(m))},"只能输入英文字母");$.validator.addMethod("isIllegalString",function(m,j){var i=/[@#\$%\^&\*]+/g;return this.optional(j)||(!i.test(m))},"不能使用非法字符");$.validator.addMethod("isBlank",function(j,i){return $.trim(j)!=""},"不能为空");$.validator.addMethod("isPhone",function(n,j){var m=n.length;var i=/(^\d{3,4}-?\d{3,4}-?\d{3,4}$)|(^1[34578]{1}[0-9]{9}$)/;return this.optional(j)||(i.test(n))},"请正确填写您的手机号码");$("#form").validate({event:"submit",rules:{channelNo:{required:true,maxlength:25},agentLevel:{required:true,maxlength:25},parentNo:{required:true,maxlength:25},agentNo:{required:true,maxlength:25},agentName:{required:true,maxlength:25,isIllegalString:true,isBlank:true},agentPreCode:{required:true,maxlength:5,isEnglish:true,isIllegalString:true,isBlank:true},agentType:{required:true,maxlength:25},name:{required:true,maxlength:25,isIllegalString:true,isBlank:true},mobile:{required:true,maxlength:13,isPhone:true,isIllegalString:true,isBlank:true}},messages:{channelNo:{required:"请选择【渠道名称】",maxlength:"长度不能超过25"},agentLevel:{required:"请选择【代理商级别】",maxlength:"长度不能超过25"},parentNo:{required:"请输入【上级机构】",maxlength:"长度不能超过25"},agentNo:{required:"请输入【代理商编号】",maxlength:"长度不能超过25"},agentName:{required:"请输入【代理商名称】",maxlength:"长度不能超过25"},agentPreCode:{required:"请输入【编码抬头】",maxlength:"长度不能超过5"},agentType:{required:"请输入【代理商类型：0 个人、1 机构】",maxlength:"长度不能超过25"},name:{required:"请输入【联系人姓名】",maxlength:"长度不能超过25"},mobile:{required:"请输入【联系人手机号码】",maxlength:"长度不能超过13"}},submitHandler:function(o){var i=0;var n="";if(i==0){$("#save").attr("disabled","disabled");var m=$("#baseUrl").text().trim();var j=$("#form").serialize();$.ajax({url:m+"/adminManage/agentbase/save",data:j,type:"POST",success:function(p){p=$.parseJSON(p);bootbox.alert(p.values,function(){if(p.executeStatus=="0"){location.href=m+p.url}})}})}else{bootbox.alert(n,function(){})}return false},errorPlacement:function(i,j){i.appendTo(j.parent().parent())}});var l=$("select.form-control");for(var f=0;f<l.size();f++){var h=$(l[f]);var a=h.attr("id");var c=$("."+a).val();var b=h.find("option");for(var e=0;e<b.size();e++){var d=$(b[e]).val();if(d==c){$(b[e]).attr("selected","selected")}else{$(b[e]).removeClass("selected")}}}});