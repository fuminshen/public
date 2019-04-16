<link rel="stylesheet" href="${request.contextPath}/assets/css/jquery-ui.custom.min.css" />
<script src="${request.contextPath}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${request.contextPath}/assets/js/jquery.ui.touch-punch.min.js"></script>

	<div class="form-inline table-header" style="background:#fff;color:#393939">
		<div>
			<div style="float:left">
			返额比率：
			<input value="8" id="fdbl" style="border:0;color:red;width:30px;outline:none;text-align:right"><span style="color:red">%</span>
			</div>
			<div id="slider-eq" class="ui-slider-orange" style="width:400px;float:left;margin:15px"></div>
		</div>
		<div class="clearfix"></div>
		<div>
			设置日期：
			<label><input name="dt" type="radio" value="0"><span class="lbl">预订日期</span></label>
			<label><input name="dt" type="radio" value="1" checked><span class="lbl">当前日期</span></label>
		</div>
	</div>
<form class="form-horizontal" action="${request.contextPath}/pay/add/l" method="post">
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th width="80">类目
				</th>
				<th width="180">日期
				</th>
				<th>金额
				</th>
			</tr>
		</thead>
		<tbody>
			<#list pays as pay>
			<tr>
				<td>
					${pay_index+1}季度
					<input name="orders[${pay_index}]" type="hidden" value="${pay_index+1}">
					<input name="orderId[${pay_index}]" type="hidden" value="#{order.id}">
					<input name="clientId[${pay_index}]" type="hidden" value="#{client.id}">
				</td>
				<td>
					<div class="input-group">
						<input type="text" class="form-control date-picker" name="dueTime[${pay_index}]" value="${pay.dueTime?string('yyyy-MM-dd')}" data-date-format="yyyy-mm-dd"/>
						<span class="input-group-addon">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</td>
				<td>
					<input name="money[${pay_index}]" class="form-control" required value="#{pay.money}">
				</td>
			</tr>
			</#list>
			<tfoot>
				<tr>
					<td colspan="3" style="text-align:left;line-height:22px;">
						<div>订单号：${order.number}</div>
						<div>客　户：${client.username}</div>
						<div>预订日：<span id="order-addtime">${order.addTime?string('yyyy-MM-dd')}</span></div>
						<div>总金价：￥<span id="order-money"">#{order.money}</span></div>
						<div>总返额：￥<span id="sum-money" class="text-danger"></span></div>
						<div class="hr"></div>
						<span class="text-danger">注：所有金额将自动四舍五入至1位小数，即人民币单位角</span>
					</td>
				</tr>
			</tfoot>
		</tbody>
	</table>
	
	<div class="clearfix form-actions">
		<button type="submit" class="btn btn-primary btn-round">
		<i class='ace-icon fa fa-check'></i>
		确认
		</button>
	</div>
</form>

<script>
$(function(){
	$("input[name^=money]").change(function(){
		$(this).val(  parseFloat($(this).val()).toFixed(1) );
		changeMoney()
	});
	changeMoney();
	
	var sliderObj=$( "#slider-eq" ).slider({
			value: $("#fdbl").val(),
			range: "min",
			min: 1,
			max: 20,
			reversed: true,
			slide: function( event, ui ) {
		        $( "#fdbl" ).val( ui.value );
		        changePoint();
		    }
		});
	$("#fdbl").change(function() {
		if( isNaN(this.value) ){
			this.value=this.defaultValue;
			bootbox.alert("非法的数值！");
		}
		sliderObj.slider( "value", this.value );
		changePoint();
    });
	$("input[name='dt']").click(function(){
		changeTime(this.value);
	});
	$("form").submit(function(){
		var json = getjson();
		$.ajax({
            url: $(this).attr("action"),
            type: "Post",
            headers: {
		        'Accept': 'application/json',
		        'Content-Type': 'application/json'
		    },
            data: json,
            dataType: 'html',
            success: function (obj) {
            	console.log(obj);
            	obj = eval( "("+obj+")" );
            	if(obj.state == 'success' ){
            		location.href="${request.contextPath}/order/get/#{order.id}";
            	}else{
            		bootbox.alert(obj.msg);
            	}
            },
            error:function(obj){
            	console.log(obj);
            	obj = eval( "("+obj+")" );
            	bootbox.alert(obj.msg);
            }
        });
        return false;
	});
});
function changeMoney(){
	var moneys = $("input[name^=money]");
	var sum=0;
	for(var i=0;i<moneys.length;i++){
		sum+=parseFloat(moneys.eq(i).val());
	}
	$("#sum-money").text(sum.toFixed(1));
}
function changePoint(){
	var bl=parseFloat($("#fdbl").val() )/100;
	var om=parseFloat($("#order-money").text() );
	var m=(bl * om / 4).toFixed(1);
	$("input[name^=money]").val(m);
	changeMoney();
}
function changeTime(val){
	var date;
	if(val==0){
		date = new Date($("#order-addtime").text().replace(/-/g,"/")+" 00:00:00");
	}else{
		date = new Date();
	}
	var tr = $("tbody").children();
	for(var i=0;i<tr.length;i++){
		date.setMonth(date.getMonth() +3);
		tr.eq(i).children().eq(1).children().children().eq(0).val(dateFtt("yyyy-MM-dd",date));
	}
}

function dateFtt(fmt,date)   
{ //author: meizz   
  var o = {   
    "M+" : date.getMonth()+1,                 //月份   
    "d+" : date.getDate(),                    //日   
    "h+" : date.getHours(),                   //小时   
    "m+" : date.getMinutes(),                 //分   
    "s+" : date.getSeconds(),                 //秒   
    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
    "S"  : date.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 

function getjson() {
        var list = new Array();;
        var tr = $("tbody").children();
		for(var i=0;i<tr.length;i++){
			var o = {};
	        o['orders']=$("input[name='orders\["+i+"\]']").val();
	        o['orderId']=$("input[name='orderId\["+i+"\]']").val();
	        o['clientId']=$("input[name='clientId\["+i+"\]']").val();
	        o['dueTime']=$("input[name='dueTime\["+i+"\]']").val();
	        o['money']=$("input[name='money\["+i+"\]']").val();
	        list.push(o);
	    }
	    return JSON.stringify(list);
}
</script>