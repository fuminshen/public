<link rel="stylesheet" href="${request.contextPath}/assets/css/colorbox.min.css" />
<link rel="stylesheet" href="${request.contextPath}/assets/css/dropzone.min.css" />

<div class="page-header">
	<h1>
		合同上传
		
	</h1>
</div>

<form id="ct_frm" action="${request.contextPath}/contract/add" method="post" class="form-horizontal">
<input name="orderId" type="hidden" value="#{(vo.orderId)!}">
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right">合同名：</label>
	<div class="col-sm-9">
		<input name="name" class="form-control" placeholder="销售合同/托管合同/等">
	</div>
</div>
<div class="clearfix form-actions">
	<div class="col-md-offset-3 col-md-9">
		<button class="btn btn-info" type="submit" onclick="return submitContract()">
			<i class="ace-icon fa fa-angle-right bigger-110"></i>
			下一步
		</button>

		&nbsp; &nbsp; &nbsp;
		<button class="btn" type="button" onclick="self.location=document.referrer;">
			<i class="ace-icon fa fa-undo bigger-110"></i>
			返回
		</button>
	</div>
</div>
</form>

<input name="id" type="hidden" id="id">
<div id="img_div" style="display:none">
<form action="${request.contextPath}/contract/upload" class="dropzone well" id="dropzone" style="padding:0;">
		<div class="fallback">
			<input name="file" type="file" multiple="" />
		</div>
		<div class="dropzone-previews hide">
		</div>
</form>

<ul id="showImg" class="ace-thumbnails clearfix ">
</ul>

<button class="btn" type="button" onclick="self.location=document.referrer;">
	<i class="ace-icon fa fa-check bigger-110"></i>
	完成
</button>
</div>

<script src="${request.contextPath}/assets/js/dropzone.min.js"></script>

<script src="${request.contextPath}/assets/js/jquery.colorbox.min.js"></script>
<script>
var $overflow = '';
var colorbox_params = {
		rel: 'colorbox',
		reposition:true,
		scalePhotos:true,
		scrolling:false,
		previous:'<i class="ace-icon fa fa-arrow-left"></i>',
		next:'<i class="ace-icon fa fa-arrow-right"></i>',
		close:'&times;',
		current:'{current} of {total}',
		maxWidth:'100%',
		maxHeight:'100%',
		onOpen:function(){
			$overflow = document.body.style.overflow;
			document.body.style.overflow = 'hidden';
		},
		onClosed:function(){
			document.body.style.overflow = $overflow;
		},
		onComplete:function(){
			$.colorbox.resize();
		}
	};
jQuery(function($){
			
			try {
			  Dropzone.autoDiscover = false;
			
			  var myDropzone = new Dropzone('#dropzone', {
			  	url:"${request.contextPath}/contract/upload",
			    //previewTemplate: '',
				thumbnailHeight: 120,
			    thumbnailWidth: 120,
			    maxFilesize: 0.5,
			    //clickable:"#uploadBtn",
			    
			    previewsContainer:'.dropzone-previews',
				
				addRemoveLinks : true,
				dictRemoveFile: '',
				
				dictDefaultMessage :
				'<div ><i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i></div><span style="font-size:16px;line-height:16px;">点击或拖放合同图片到此</span>'
			,
				
			    thumbnail: function(file, dataUrl) {
			      return false;
			    },
			    success:function(arg1,arg2){
			    	var data = eval("("+arg1.xhr.response+")");
			    	var url="${request.contextPath}/upload/contract/"+data.msg;
			    	var id=$("#id").val();
			    	var ajaxData={};
			    	ajaxData.contractId=id;
			    	ajaxData.path=url;
			    	
			    	$.ajax({
				    //几个参数需要注意一下
				        type: "POST",//方法类型
				        dataType: "html",//预期服务器返回的数据类型
				        async:false,
				        url: "${request.contextPath}/contract/image/add",//url
				        data: ajaxData,
				        success: function (result) {
				            result=eval("("+result+")");
				            if (result.state == 'success') {
					            var html='<li>\
									<a href="'+url+'" data-rel="colorbox">\
										<img src="'+url+'" width="150" height="150" />\
									</a>\
									<div class="tools tools-bottom in">\
										<a href="#" url="'+url+'" imgid="'+result.id+'" onclick="d_f(this)">\
											<i class="ace-icon fa fa-times red"></i>\
										</a>\
									</div>\
								</li>';
						    	$("#showImg").append(html);
						    	$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
				            }
				        },
				        error : function(e) {
				        	//console.log(e);
				        	var msg=eval("("+e+")");
				            bootbox.alert(msg.msg);
				        }
				    });
			    }
			  });
			
			
			  //simulating upload progress
			  var minSteps = 6,
			      maxSteps = 60,
			      timeBetweenSteps = 100,
			      bytesPerStep = 100000;
			
			   //remove dropzone instance when leaving this page in ajax mode
			   $(document).one('ajaxloadstart.page', function(e) {
					try {
						myDropzone.destroy();
					} catch(e) {}
			   });
			
			} catch(e) {
			  alert('Dropzone.js does not support older browsers!');
			}
			
			});


jQuery(function($) {

	$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
	//$("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>");//let's add a custom loading icon
	
	
	/*$(document).one('ajaxloadstart.page', function(e) {
		$('#colorbox, #cboxOverlay').remove();
   });*/
})
function d_f(obj){
	var deldt={};
	deldt.id=$(obj).attr("imgid");
	$.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "html",//预期服务器返回的数据类型
        async:false,
        url: "${request.contextPath}/contract/image/delete",//url
        data: deldt,
        success: function (result) {
            result=eval("("+result+")");
            if (result.state == 'success') {
            	var data={};
				data.path=$(obj).attr("url");
				$.post("/f/d",data,function(text){
					if($.trim(text)=="success"){
						$(obj).parent().parent().remove();
					}
				});
            }
        },
        error : function(e) {
        	var msg=eval("("+e+")");
            bootbox.alert(msg.msg);
        }
    });
	
}
function submitContract(){
	$.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "html",//预期服务器返回的数据类型
        url: $('#ct_frm').attr("action"),//url
        data: $('#ct_frm').serialize(),
        success: function (result) {
            result=eval("("+result+")");
            if (result.state == 'success') {
            	$("#id").val(result.id);
                $("#ct_frm").hide();
				$("#img_div").show();
            }
            ;
        },
        error : function(e) {
        	var msg=eval("("+e+")");
            alert(msg.msg);
            bootbox.alert(msg.msg);
        }
    });
	
	return false;
}
</script>
