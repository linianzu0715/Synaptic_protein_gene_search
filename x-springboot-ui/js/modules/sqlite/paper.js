$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sqlite/paper/list',
        datatype: "json",
        colModel: [			
			{ label: 'rowid', name: 'rowid', index: 'rowid', width: 50, key: true },
			{ label: 'PMID', name: 'pmid', index: 'PMID', width: 80 }, 			
			{ label: '年份', name: 'year', index: 'Year', width: 80 },
			{ label: '名字', name: 'name', index: 'Name', width: 80 }, 			
			{ label: '描述', name: 'description', index: 'Description', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });



        }
    });
});



var vm = new Vue({
	el:'#app',
	data:{
		showList: true,
		title: null,
        sql :"select rowid,PMID,Year,Name,Description from paper ",
		paper: {}
	},
	methods: {
		query: function () {
            // $("#jqGrid").setGridParam().hideCol("year");
            vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.paper = {};
		},
		update: function (event) {
			var rowid = getSelectedRow();
			if(rowid == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(rowid)
		},
		saveOrUpdate: function (event) {
			var url = vm.paper.rowid == null ? "sqlite/paper/save" : "sqlite/paper/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.paper),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var rowids = getSelectedRows();
			if(rowids == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "sqlite/paper/delete",
                    contentType: "application/json",
				    data: JSON.stringify(rowids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		export111: function (event) {
			$.ajax({
				type: "POST",
				url: baseURL + "sqlite/paper/export",
				contentType: "application/json",
                data: JSON.stringify({'sql': $("#sqlPreview").val()}),
				success: function(r){
					if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		getInfo: function(rowid){
			$.get(baseURL + "sqlite/paper/info/"+rowid, function(r){
                vm.paper = r.paper;
            });
		},
		addSql: function(rowid){

            var columnData = $("#columnData").val();
            var condition = $("#condition").val();
            var matchValue = $("#matchValue").val();

            if (columnData === "0" || condition === "0" || !matchValue) {
                alert('输入有误');
                return;
            }
            if (vm.sql.indexOf("where") != -1) {
                vm.sql = vm.sql + " and " + columnData + " " + condition + " " + matchValue;
            } else {
                vm.sql = vm.sql + " where " + columnData + " " + condition + " " + matchValue;
            }

            $("#sqlPreview").val(vm.sql);

		},
        clearSql: function(rowid){
        	vm.sql ="select rowid,PMID,Year,Name,Description from paper ";
            $("#sqlPreview").val("");
		},
		reload: function (event) {

			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'sql': $("#sqlPreview").val()},
                page:page
            }).trigger("reloadGrid");

		}
	}
});