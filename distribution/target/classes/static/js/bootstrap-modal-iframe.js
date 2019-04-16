/**
 * 基于jquery和bootstrap的iframe弹出窗口
 * 必须传入2个参数，和1个可选参数
 * 参数1=新窗口的url地址
 * 参数2=弹窗的标题文字（可选）
 * 参数3=处理返回值的函数，function(data)（可选）
 * 
 * 属性this.result选中的数据json格式
 * 
 * 调用方法$(object).showModal(arg1,arg2,arg3);
 */


$.fn.extend({
	showModal:function(url,title,setFunction){
		var SHOW_MODAL_TEXT='<div id="MODAL_WINDOW_ID'+$(this).attr("id")+'" class="modal" tabindex="-1" role="dialog">\
		    <div class="modal-dialog" style="width:'+(parseInt(document.body.clientWidth)>900?"900px":"100%")+'">\
		        <div class="modal-content">\
		        	<div class="modal-header">\
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>\
		                <h4 class="modal-title">'+(title?title:'请选择')+'</h4>\
		            </div>\
		            <iframe id="MODAL_IRAME_ID'+$(this).attr("id")+'" width="100%" frameborder="0" height="'+(parseInt($(window).height())>690?'690px':(parseInt($(window).height())-150)+'px')+'" style="margin:0;padding:0;max-height:690px"></iframe>\
		        	<div class="modal-footer">\
					<button class="btn btn-sm" data-dismiss="modal">\
						<i class="ace-icon fa fa-times"></i>\
						取消\
					</button>\
					<button id="MODAL_SELECT_BTN_ID'+$(this).attr("id")+'" class="btn btn-sm btn-primary">\
						<i class="ace-icon fa fa-check"></i>\
						选定\
					</button>\
				</div>\
		        </div>\
		    </div>\
		</div>';
		var $t=this;
	    $("body").append($(SHOW_MODAL_TEXT));
	    
		$(this).click(function(){
	        var frameSrc = url;
	        $('#MODAL_WINDOW_ID'+$($t).attr("id")).on('shown.bs.modal',function(){$("#MODAL_IRAME_ID"+$($t).attr("id")).attr("src", frameSrc);});
	        $('#MODAL_WINDOW_ID'+$($t).attr("id")).modal({show: true, backdrop: 'static' });
	    });
	    $("#MODAL_SELECT_BTN_ID"+$(this).attr("id")).click(function(){
	        var data=$("#MODAL_IRAME_ID"+$($t).attr("id"))[0].contentWindow.getSelect();
	        if(!data){
	        	if(bootbox){
	        		bootbox.alert("未选择任何数据");
	        	}else{
	        		alert("未选择任何数据");
	        	}
	        	return false;
	        }
	        if(typeof $t.set === "function"){
	        	$t.set(data);
	        }
	        else if(typeof setFunction === "function"){
	        	setFunction(data);
	        }
	        $('#MODAL_WINDOW_ID'+$($t).attr("id")).modal("hide");
	        $t.result=data;
	    });
	    return this;
	}
});