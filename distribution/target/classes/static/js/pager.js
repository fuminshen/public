var WEB_PAGER_PROPERTY;
var JQGRID_RESIZE_ITEM=new Array();;

function getSelect(){
	var rowData=null;
	if(WEB_PAGER_PROPERTY.grid_selector){
		var rowId=$(WEB_PAGER_PROPERTY.grid_selector).jqGrid('getGridParam','selrow');
		if(rowId){
			rowData = $(WEB_PAGER_PROPERTY.grid_selector).jqGrid('getRowData',rowId);
		}
	}
	return rowData;
}
function styleCheckbox(table) {
	
	$(table).find('input:checkbox').addClass('ace')
	.wrap('<label />')
	.after('<span class="lbl align-top" />');

	if(!$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		.find('input.cbox[type=checkbox]').hasClass('ace')){
		$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		.find('input.cbox[type=checkbox]').addClass('ace')
		.wrap('<label />').after('<span class="lbl align-top" />');
	}
}

//数据图标更新
function updateActionIcons(table) {
	
	var replacement = 
	{
		'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
		'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
		'ui-icon-disk' : 'ace-icon fa fa-check green',
		'ui-icon-cancel' : 'ace-icon fa fa-times red'
	};
	$(table).find('.ui-pg-div span.ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
	
}

//分页控件图标自定义
function updatePagerIcons(table) {
	var replacement = 
	{
		'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
		'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
		'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
		'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
	};
	$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}


function enableTooltips(table) {
	$('.navtable .ui-pg-button').tooltip({container:'body'});
	$(table).find('.ui-pg-div').tooltip({container:'body'});
}
$.fn.extend({
	grid:function(pagerData){
		if (typeof(pagerData)=="undefined"){
			alert("未设置分页参数");
			return false;
		} else{
			pagerData=pagerData;
		}
		if(typeof(pagerData.baseUrl)=='undefined'){
			var str=pagerData.url?pagerData.url:window.location.pathname;
			str=str.substring(0,str.lastIndexOf("/"));
			pagerData.baseUrl=str;
		}
		var grid_selector = pagerData.grid_selector;
		var pager_selector = pagerData.pager_selector;
		var sreach_btn = pagerData.sreach_btn;
		var parent_column = $(grid_selector).closest('[class*="col-"]');
		var frm;
		if(pagerData.sreach_frm){
			frm = pagerData.sreach_frm
			$(frm).submit(function(){return false;});
		}else{
			frm = "form";
		}
		if(!pagerData.modal){
			if( !pagerData.not_action_btn ){
				pagerData.header.push(' ');
				pagerData.data.push({name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
					formatter:'actions', 
					formatoptions:{ 
						keys:true,
						delOptions:{recreateForm: true},
						editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:function (e) {
								var id=$(this).jqGrid('getGridParam','selrow');
								location.href=pagerData.baseUrl+"/get/"+id;
								e.preventDefault();
								e.stopPropagation();
								return false;
							}
						}
					}
				});
			}
		}
		//resize to fit page size
		addResizeJqGrid(grid_selector);
		
		var url = (pagerData.url?pagerData.url:(pagerData.baseUrl+'/list'));
		jQuery(grid_selector).jqGrid({
			jsonReader : {
				root:"list",
				page: "pageNum",
				total: "pages",
				records: "total",
				cell: "invrow"
			},  
			url : url,
			datatype: "json",
			height: pagerData.height?pagerData.height:500,
			colNames:pagerData.header,
			colModel:pagerData.data, 
		
			viewrecords : true,
			rowNum:pagerData.pageSize?pagerData.pageSize:50,
			rowList:[10,20,50],
			pager : pager_selector,
			altRows: true,
			
			multiselect: (false === pagerData.checkbox)?false : true,
		    multiboxonly: true,
			editurl: pagerData.baseUrl+"/delete",//nothing is saved
			
			pagerpos:"left",
		
			autowidth: true,
			loadComplete : function() {
				var table = this;
				setTimeout(function(){
					updateActionIcons(table);
					updatePagerIcons(table);
					enableTooltips(table);
				}, 0);
			}
		});
		
		//点击搜索按钮的方法
		$(sreach_btn).click(function(){
			var map={};
		    $(frm+" input,"+frm+" select").each(function(){
		        var value= $.trim($(this).val());
		        if(value!=""){
			        var name= $(this).attr('name');
			        if($(this).attr('like')==1){
			        	map[name]="%"+value+"%";
			        }else{
			        	map[name]=value;
			        }
		        }
		    });
		    var d={};d.map=JSON.stringify(map);
		    var postData = $(grid_selector).jqGrid("getGridParam", "postData");
		    $.each(postData, function (k, v) {
		        delete postData[k];
		    });
		    $(grid_selector).jqGrid('setGridParam',{ 
		    	postData:d,
		        page:1 ,
		        url : pagerData.baseUrl+'/list'
		    }).trigger("reloadGrid"); //重新载入 
		    
		});
	}
});
function addResizeJqGrid(grid){
	JQGRID_RESIZE_ITEM.push(grid);
}
function jqGridOnResize(){
	for(var i=0;i<JQGRID_RESIZE_ITEM.length;i++){
		var grid_selector = JQGRID_RESIZE_ITEM[i];
		var parent_column_width=$(grid_selector).closest('[class*="col-"]').width();
		if(parent_column_width<992){
			if(parent_column_width>$( grid_selector ).closest(".ui-jqgrid").width()){
				$(grid_selector).jqGrid( 'setGridWidth', parent_column_width );
			}else{
				$( grid_selector ).closest(".ui-jqgrid").css({ 'width' : parent_column_width+'px' });
				$( grid_selector ).closest(".ui-jqgrid").css({ 'overflow-x' : 'auto' });
			}
		}else{
			$(grid_selector).jqGrid( 'setGridWidth', parent_column_width );
			$( grid_selector ).closest(".ui-jqgrid").css({ 'overflow-x' : 'hidden' });
		}
	}
	
}
function jqGridOnResizeNav(){
	if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
		setTimeout(function() {
			jqGridOnResize()
		}, 20);
	}
}
$(window).load
(function() {
	if (typeof(pagerData)=="undefined"){
		alert("未设置分页参数");
		return false;
	} else{
		WEB_PAGER_PROPERTY=pagerData;
	}
	if(typeof(WEB_PAGER_PROPERTY.baseUrl)=='undefined'){
		var str=WEB_PAGER_PROPERTY.url?WEB_PAGER_PROPERTY.url:window.location.pathname;
		str=str.substring(0,str.lastIndexOf("/"));
		WEB_PAGER_PROPERTY.baseUrl=str;
	}
	var grid_selector = WEB_PAGER_PROPERTY.grid_selector;
	var pager_selector = WEB_PAGER_PROPERTY.pager_selector;
	var sreach_btn = WEB_PAGER_PROPERTY.sreach_btn;
	var parent_column = $(grid_selector).closest('[class*="col-"]');
	var frm;
	if(WEB_PAGER_PROPERTY.sreach_frm){
		frm = WEB_PAGER_PROPERTY.sreach_frm
		$(frm).submit(function(){return false;});
	}else{
		frm = "form";
	}
	if(!WEB_PAGER_PROPERTY.modal){
		if( !WEB_PAGER_PROPERTY.not_action_btn ){
			WEB_PAGER_PROPERTY.header.push(' ');
			WEB_PAGER_PROPERTY.data.push({name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
				formatter:'actions', 
				formatoptions:{ 
					keys:true,
					delOptions:{recreateForm: true},
					editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:function (e) {
							var id=$(this).jqGrid('getGridParam','selrow');
							location.href=WEB_PAGER_PROPERTY.baseUrl+"/get/"+id;
							e.preventDefault();
							e.stopPropagation();
							return false;
						}
					}
				}
			});
		}
	}
	addResizeJqGrid(grid_selector);
	//resize to fit page size
	$(window).on('resize.jqGrid', function () {
		jqGridOnResize();
	})
	
	//resize on sidebar collapse/expand
	$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
		jqGridOnResizeNav();
	})
	var url = (WEB_PAGER_PROPERTY.url?WEB_PAGER_PROPERTY.url:(WEB_PAGER_PROPERTY.baseUrl+'/list'));
	jQuery(grid_selector).jqGrid({
		jsonReader : {
			root:"list",
			page: "pageNum",
			total: "pages",
			records: "total",
			cell: "invrow"
		},  
		url : url,
		datatype: "json",
		height: WEB_PAGER_PROPERTY.height?WEB_PAGER_PROPERTY.height:500,
		//height:'auto',
		colNames:WEB_PAGER_PROPERTY.header,
		colModel:WEB_PAGER_PROPERTY.data, 
	
		viewrecords : true,
		rowNum:WEB_PAGER_PROPERTY.pageSize?WEB_PAGER_PROPERTY.pageSize:50,
		rowList:[10,20,50],
		pager : pager_selector,
		altRows: true,
		
		multiselect: (false === WEB_PAGER_PROPERTY.checkbox)?false : true,
	    multiboxonly: true,
		editurl: WEB_PAGER_PROPERTY.baseUrl+"/delete",//nothing is saved
		
		//收缩适应和滚动条
		//shrinkToFit:false,   
		//autoScroll: true, 
		pagerpos:"left",
		//viewrecords:false,
	
		//autowidth: true,
		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				updateActionIcons(table);
				updatePagerIcons(table);
				enableTooltips(table);
			}, 0);
		}
	});
	
	//点击搜索按钮的方法
	$(sreach_btn).click(function(){
		var map={};
	    $(frm+" input,"+frm+" select").each(function(){
	        var value= $.trim($(this).val());
	        if(value!=""){
		        var name= $(this).attr('name');
		        if($(this).attr('like')==1){
		        	map[name]="%"+value+"%";
		        }else{
		        	map[name]=value;
		        }
	        }
	    });
	    var d={};d.map=JSON.stringify(map);
	    var postData = $(grid_selector).jqGrid("getGridParam", "postData");
	    $.each(postData, function (k, v) {
	        delete postData[k];
	    });
	    $(grid_selector).jqGrid('setGridParam',{ 
	    	postData:d,
	        page:1 ,
	        url : WEB_PAGER_PROPERTY.baseUrl+'/list'
	    }).trigger("reloadGrid"); //重新载入 
	    
	});
	$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
	
	$(document).one('ajaxloadstart.page', function(e) {
		$.jgrid.gridDestroy(grid_selector);
		$('.ui-jqdialog').remove();
	});
	
});