jQuery.fm={
	createPagerData:function(ajaxUrl){
	var pager_data = {
		paging      : true,
		lengthChange: false,
		searching   : false,
		ordering    : false,
		info        : false,
		autoWidth   : false,
		scrollX     : true,
		processing  : true,
		bDestroy    : true,
		iDisplayLength : 50,
		oLanguage: {
			"sLengthMenu": "每页显示 _MENU_ 条记录",
			"sZeroRecords": "抱歉， 没有找到",
			"sInfo": "共 _TOTAL_ 条数据",
			"sInfoEmpty": "没有数据",
			"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
			"oPaginate": {
				"sFirst": "首页",
				"sPrevious": "前一页",
				"sNext": "后一页",
				"sLast": "尾页"
			},
			"sZeroRecords": "没有检索到数据",
			"sProcessing": "读取中..."
		},
		fnServerData:function(sSource, aoData, fnCallback){
			var startRow=false;
			var aoDt={};
			for(var ix in aoData){
				if(aoData[ix].name == "iDisplayStart"){
					startRow = aoData[ix].value;
					if(aoDt.rows){
						break;
					}
				}else if(aoData[ix].name == "iDisplayLength"){
					aoDt.rows = aoData[ix].value;
					if(startRow!==false){
						break;
					}
				}
			}
			if(startRow!=0){
				aoDt.page = (startRow / aoDt.rows)+1;
			}else{
				aoDt.page = 1;
			}
			$.ajax({
		        url: sSource,
		        data: aoDt,
		        type: "POST",
		        async:true,
		        success: function (result) {
		        	var dt = {};
		        	if(result){
		        		if(result.list){
			        		dt.data = result.list;
			        		dt.iTotalRecords = result.total;
			        		dt.iTotalDisplayRecords = result.total;
			        	}else{
			        		dt = result;
			        	}
		        	}
		        	fnCallback(dt);
		        }
		    })
		},
		//是否自带操作按钮，不要的话直接把属性设置为false即可
		controllerBtn:true,
		controllerWidth:80,
		setColumns:function(columns){
			this.columns = columns;
			if(this.controllerBtn){
				var url = window.location.pathname;
				url = url.substring(0, url.lastIndexOf("/") );
				var btnText = "";
				if(this.controllerAddBtnText){
					btnText=this.controllerAddBtnText;
				}
				var dt = {"data":null,"render": function (data, type, row, meta) {
					var frmid = "frm_"+data.id+"_"+meta.settings.nTable.id;
					return "<form id='"+frmid+"' method='post' action='"+url+"/delete'><input name='id' value='"+data.id+"' type='hidden'>"+
					"<a href='"+url+"/get/"+data.id+"' title='编辑'><i class='fa fa-edit'></i></a> "+
					(btnText?btnText.replace("#id",data.id):"") +
					"<button type='button' class='btn-link' style='margin:0;padding:0' title='删除' onclick='bootbox.confirm(\"删除后不可恢复，是否确认？\",function(b){if(b){$(\"#"+frmid+"\").submit();}});'><i class='fa fa-remove text-red'></i></button></form>"}
				};
				if(this.controllerWidth){
					dt.width=this.controllerWidth;
				}
				this.columns.push(dt);
			}
		}
	}
	if(ajaxUrl){
		pager_data.serverSide= true;
		pager_data.sAjaxSource=ajaxUrl;
	}
	//pager_data
	return pager_data;
}
}