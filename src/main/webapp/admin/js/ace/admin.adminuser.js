jQuery.adminAdminuser = {
		adminuserDataTable:null,
		toSave:false,
		initSearchDataTable : function() {
			if (this.adminuserDataTable == null) {
				this.adminuserDataTable = $('#dt_adminuser_view').dataTable({
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
					"sAjaxSource" : $.ace.getContextPath() + "/admin/adminuser/list",
					"fnDrawCallback" : function(oSettings) {
						$('[rel="popover"],[data-rel="popover"]').popover();
					},
					"fnServerData" : function(sSource, aoData, fnCallback) {
						var name = $("#adminuser_name").val();
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
						"mDataProp" : "password"
					}, {
						"mDataProp" : "remark"
					}, {
						"mDataProp" : "role1"
					}, {
						"mDataProp" : "role2"
					}, {
						"mDataProp" : "role3"
					}, {
						"mDataProp" : "role4"
					}, {
						"mDataProp" : "role5"
					}, {
						"mDataProp" : ""
					}],
					"aoColumnDefs" : [
						{
							'aTargets' : [4],
							'fnRender' : function(oObj, sVal) {
								if(sVal=='yes')
									return "<span class='label label-info'>"+sVal+"</span>";
								else
									return "<span class='label label-important'>"+sVal+"</span>";
							}
						},
						{
							'aTargets' : [5],
							'fnRender' : function(oObj, sVal) {
								if(sVal=='yes')
									return "<span class='label label-info'>"+sVal+"</span>";
								else
									return "<span class='label label-important'>"+sVal+"</span>";
							}
						},
						{
							'aTargets' : [6],
							'fnRender' : function(oObj, sVal) {
								if(sVal=='yes')
									return "<span class='label label-info'>"+sVal+"</span>";
								else
									return "<span class='label label-important'>"+sVal+"</span>";
							}
						},
						{
							'aTargets' : [7],
							'fnRender' : function(oObj, sVal) {
								if(sVal=='yes')
									return "<span class='label label-info'>"+sVal+"</span>";
								else
									return "<span class='label label-important'>"+sVal+"</span>";
							}
						},
						{
							'aTargets' : [8],
							'fnRender' : function(oObj, sVal) {
								if(sVal=='yes')
									return "<span class='label label-info'>"+sVal+"</span>";
								else
									return "<span class='label label-important'>"+sVal+"</span>";
							}
						},
						{
							'aTargets' : [9],
							'fnRender' : function(oObj, sVal) {
								return "<button class=\"btn2 btn-info\" onclick=\"$.adminAdminuser.showEdit("+oObj.aData.id+")\"><i class=\"icon-pencil\"></i>修改</button>"+
								 "  <button class=\"btn2 btn-info\" onclick=\"$.adminAdminuser.deleteAdminuser("+oObj.aData.id+")\"><i class=\"icon-trash\"></i> 删除</button>";
							}
						},
					 {
						'aTargets' : [ '_all' ],
						'bSortable' : false,
						'sClass' : 'center'
					}]

				});
			} else {
				var oSettings = this.adminuserDataTable.fnSettings();
				oSettings._iDisplayStart = 0;
				this.adminuserDataTable.fnDraw(oSettings);
			}

		},
		deleteAdminuser :function(id){
			bootbox.confirm( "是否确认删除？", function (result) {
	            if(result){
	            	$.ajax({
	        			type : "get",
	        			url : $.ace.getContextPath() + "/admin/adminuser/delete?id="+id,
	        			dataType : "json",
	        			success : function(json) {
	        				if(json.resultMap.state=='success'){
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	        					$.adminAdminuser.initSearchDataTable();
	        				}else{
	        					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	        				}
	        			}
	        		});
	            }
	        });
		},
		showaddModal: function(id){
			$.adminAdminuser.toSave=true;
			$("#user_modal_header_label").text("新增分类");
			$("#adminuser_modal").modal('show');
		},
		save : function (){
			alert(  document.getElementById("role1").checked);
			alert($("#role1"));
			if($.adminAdminuser.toSave){
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/adminuser/save",
	    			data:{
	    				"adminuser.name":$("#name").val(),
	    				"adminuser.password":$("#password").val(),
	    				"adminuser.role1":$("#role1").is(":checked")?"yes":"no",
	    				"adminuser.role2":$("#role2").is(":checked")?"yes":"no",
	    				"adminuser.role3":$("#role3").is(":checked")?"yes":"no",
	    				"adminuser.role4":$("#role4").is(":checked")?"yes":"no",
	    				"adminuser.role5":$("#role5").is(":checked")?"yes":"no",
	    				"adminuser.remark":$("#remark").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminAdminuser.initSearchDataTable();
	    					$("#adminuser_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}else{
				$.ajax({
	    			type : "post",
	    			url : $.ace.getContextPath() + "/admin/adminuser/update",
	    			data:{
	    				"adminuser.id":$("#adminuserId").val(),
	    				"adminuser.name":$("#name").val(),
	    				"adminuserSub.remark":$("#remark").val()
	    			},
	    			dataType : "json",
	    			success : function(json) {
	    				if(json.resultMap.state=='success'){
	    					$("#user_edit_modal").modal('hide');
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"success","timeout":"2000"});
	    					$.adminAdminuser.initSearchDataTable();
	    					$("#adminuser_modal").modal('hide');
	    				}else{
	    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
	    				}
	    			}
	    		});
			}
		},
		showEdit: function (id){
			$("#adminuserId").val(id);
			$.adminAdminuser.toSave=false;
			$.ajax({
    			type : "get",
    			url : $.ace.getContextPath() + "/admin/adminuser/get?id="+id,
    			dataType : "json",
    			success : function(json) {
    				if(json.resultMap.state=='success'){
    					$("#user_modal_header_label").text("修改权限");
    					$("#adminuser_modal").modal('show');
    					$("#name").val(json.resultMap.adminuser.name);
    					$("#password").val(json.resultMap.adminuser.password);
    					json.resultMap.adminuser.role1=='yes'?$("#role1").prop("checked",true):$("#role1").prop("checked",false);
    					json.resultMap.adminuser.role2=='yes'?$("#role2").prop("checked",true):$("#role2").prop("checked",false);
    					json.resultMap.adminuser.role3=='yes'?$("#role3").prop("checked",true):$("#role3").prop("checked",false);
    					json.resultMap.adminuser.role4=='yes'?$("#role4").prop("checked",true):$("#role4").prop("checked",false);
    					json.resultMap.adminuser.role5=='yes'?$("#role5").prop("checked",true):$("#role5").prop("checked",false);
    					$("#remark").val(json.resultMap.adminuser.remark);
    				}else{
    					noty({"text":""+ json.resultMap.msg +"","layout":"top","type":"warning"});
    				}
    			}
    		});
		}
};