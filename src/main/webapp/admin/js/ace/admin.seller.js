jQuery.adminSeller = {
		sellerDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.sellerDataTable == null) {
				this.sellerDataTable = $('#dt_seller_view').dataTable({
					"sDom" : "<'row-fluid'<'span6'l>r>t<'row-fluid'<'span6'i><'span6'p>>",
					"sPaginationType" : "bootstrap",
					"oLanguage" : {
						"sLengthMenu" : "每页显示 _MENU_ 条记录",
						"sZeroRecords" : "抱歉， 暂时没有记录",
						"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
						"sSearch" : "",
						"sInfoEmpty" : "没有数据",
						"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
						"oPaginate" : {
							"sFirst" : "首页",
							"sPrevious" : "前一页",
							"sNext" : "后一页",
							"sLast" : "尾页"
						}
					},
					"bAutoWidth" : false,
					"iDisplayLength" : 10,
					"aLengthMenu" : [ 5, 10, 25, 50],
					"bServerSide" : true,
					"sServerMethod" : "POST",
					"bProcessing" : true,
					"bSort" : false,
					"sAjaxSource" : $.ace.getContextPath() + "/admin/seller/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#seller_name").val();
						if (!!name) {
							aoData.push({
								"name" : "name",
								"value" : name
							});
						}
						$.ajax({
							"dataType" : 'json',
							"type" : "POST",
							"url" : sSource,
							"data" : aoData,
							"success" : function(data){
								fnCallback(data.resultMap);
							}
						});
					},
					"aoColumns" : [ {
						"mDataProp" : "id"
					} ,{
						"mDataProp" : "name"
					}, {
						"mDataProp" : "addr"
					}, {
						"mDataProp" : "tel"
					}, {
						"mDataProp" : "userName"
					}, {
						"mDataProp" : "detail"
					}, {
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [6],
							'fnRender' : function(oObj, sVal) {
								return "<button class=\"btn2 btn-info\" onclick=\"$.adminSeller.showEdit("+oObj.aData.id+")\"><i class=\"icon-pencil\"></i>修改</button>"+
								 "  <button class=\"btn2 btn-info\" onclick=\"$.adminSeller.deleteSeller("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 删除</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.sellerDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.sellerDataTable.fnDraw(oSettings);
			}

		},
		deleteSeller :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/seller/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminSeller.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminSeller.toSave=true;
			$("#user_modal_header_label").text("新增分类");
			$("#seller_modal").modal('show');
		},
		save : function (){
			if($.adminSeller.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/seller/save",
	    			data:{
	    				"seller.name":$("#name").val(),
	    				"seller.addr":$("#addr").val(),
	    				"seller.tel":$("#tel").val(),
	    				"seller.userName":$("#userName").val(),
	    				"seller.detail":$("#detail").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminSeller.initSearchDataTable();
	    					$("#seller_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/seller/update",
	    			data:{
	    				"seller.id":$("#sellerId").val(),
	    				"seller.name":$("#name").val(),
	    				"seller.addr":$("#addr").val(),
	    				"seller.tel":$("#tel").val(),
	    				"seller.userName":$("#userName").val(),
	    				"seller.detail":$("#detail").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminSeller.initSearchDataTable();
	    					$("#seller_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#sellerId").val(id);
			$.adminSeller.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/seller/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改分类");
    					$("#seller_modal").modal('show');
    					$("#name").val(json.resultMap.seller.name);
    					$("#addr").val(json.resultMap.seller.addr);
    					$("#tel").val(json.resultMap.seller.tel);
    					$("#userName").val(json.resultMap.seller.userName);
    					$("#detail").val(json.resultMap.seller.detail);
    				
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};