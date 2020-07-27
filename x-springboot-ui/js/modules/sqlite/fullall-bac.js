$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sqlite/fullall/list',
        datatype: "json",
        colModel: [
			// { label: 'geneid', name: 'geneid', index: 'GeneID', width: 50, key: true },
			{ label: '', name: 'compartment', index: 'Compartment', width: 80 },
			{ label: '', name: 'humanentrez', index: 'HumanEntrez', width: 80 },
			{ label: '', name: 'humanname', index: 'HumanName', width: 80 },
			{ label: '', name: 'mouseentrez', index: 'MouseEntrez', width: 80 },
			{ label: '', name: 'mousename', index: 'MouseName', width: 80 },
			{ label: '', name: 'ratentrez', index: 'RatEntrez', width: 80 },
			{ label: '', name: 'ratname', index: 'RatName', width: 80 },
			{ label: '', name: 'pmid', index: 'PMID', width: 80 },
			{ label: '', name: 'year', index: 'Year', width: 80 },
			{ label: '', name: 'paper', index: 'Paper', width: 80 },
			{ label: '', name: 'brainRegion', index: 'Brain_Region', width: 80 },
			{ label: '', name: 'disease', index: 'Disease', width: 80 },
			{ label: '', name: 'species', index: 'Species', width: 80 },
			{ label: '', name: 'method', index: 'Method', width: 80 }
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
            $("#sqlPreview").val(vm.sql);
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
        allColumn :"GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method",
        initSql :"SELECT GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method FROM FullAll ",
        conditionSql :"select geneid,compartment,humanentrez,humanname,mouseentrez,mousename,ratentrez,ratname,pmid,year,paper,brain_region,disease,species,method from fullall ",
        sql :"SELECT GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method FROM FullAll ",
		fullall: {}
	},
	methods: {
		query: function () {
            this.addSql();
            // vm.sql = vm.initSql;
            var colList = ["compartment", "humanentrez", "humanname", "mouseentrez", "mousename", "ratentrez", "ratname", "pmid", "year", "paper", "brainRegion", "disease", "species", "method"];
            // colList.remove("compartment");
            console.log(colList);

            $('input[class="hideColumn"]:checked').each(function(){//遍历每一个名字为hideColumn的复选框，其中选中的执行函数

                var columnStr = $(this).val().toLowerCase();
                console.log(columnStr);
                if (columnStr === "brain_region") {

                   var bindex =  colList.indexOf("brainRegion");
                    colList.splice(bindex, 1);
                    $("#jqGrid").setGridParam().hideCol("brainRegion");
                } else {
                    var cindex =  colList.indexOf(columnStr);
                    colList.splice(cindex, 1);

                    $("#jqGrid").setGridParam().hideCol($(this).val().toLowerCase());
                }

                vm.sql = vm.sql.replace(("," + $(this).val()), "");
            });

            console.log(colList);

            for (var i = 0; i < colList.length; i++) {

                $("#jqGrid").setGridParam().showCol(colList[i]);
            }


            $("#sqlPreview").val(vm.sql);
            vm.reload();
            $("#sqlPreview").val(vm.sql);
        },
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.fullall = {};
		},
		update: function (event) {
			var geneid = getSelectedRow();
			if(geneid == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";

            vm.getInfo(geneid)
		},
		saveOrUpdate: function (event) {
			var url = vm.fullall.geneid == null ? "sqlite/fullall/save" : "sqlite/fullall/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.fullall),
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
			var geneids = getSelectedRows();
			if(geneids == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "sqlite/fullall/delete",
                    contentType: "application/json",
				    data: JSON.stringify(geneids),
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
        addSql: function () {

            $("#sqlPreview").val();

            var sqlColumn = $("#sqlInput").val();
            // console.log(sqlColumn);

            vm.sql = vm.initSql;


            $('input[class="hideColumn"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数
                // chk_value.push($(this).val());//将选中的值添加到数组chk_value中
                console.log($(this).val());
                vm.sql = vm.sql.replace(("," + $(this).val()), "");
            });

            if (!sqlColumn) {
                $("#sqlPreview").val(vm.sql);
                return;
            }

            var sqlColumnList = sqlColumn.split(";");
            console.log(sqlColumnList);

            console.log("size = " + sqlColumnList.length);
            for (var i = 0; i < sqlColumnList.length; i++) {

                var item = sqlColumnList[i];

                console.log(item.indexOf(":"));

                var subNum = item.indexOf(":");


                if (vm.conditionSql.indexOf(item.substring(0, subNum).toLowerCase()) === -1) {
                    alert("字段名填写错误");
                    return;
                }

                if (i == 0) {
                    vm.sql += " where " + item.substring(0, subNum) + " = " + item.substring(subNum + 1, item.length);
                } else {
                    vm.sql += " and " + item.substring(0, subNum) + " = " + item.substring(subNum + 1, item.length);
                }

                console.log(vm.sql);

                $("#sqlPreview").val(vm.sql);
            }
        },
        exportCsv: function(event) {
            $.ajax({
                type: "POST",
                url: baseURL + "sqlite/fullall/export",
                contentType: "application/json",
                data: JSON.stringify({}),
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
        genPpi:function () {
            location.href = "modules/sqlite/plugin-snapshot-test.html";
        },
		getInfo: function(geneid){
			$.get(baseURL + "sqlite/fullall/info/"+geneid, function(r){
                vm.fullall = r.fullall;
            });
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