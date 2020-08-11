$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sqlite/fullall/list',
        datatype: "json",
        colModel: [
            // { label: 'geneid', name: 'geneid', index: 'GeneID', width: 50, key: true },
            {label: '', name: 'compartment', index: 'Compartment', width: 80},
            {label: '', name: 'humanentrez', index: 'HumanEntrez', width: 80},
            {label: '', name: 'humanname', index: 'HumanName', width: 80},
            {label: '', name: 'mouseentrez', index: 'MouseEntrez', width: 80},
            {label: '', name: 'mousename', index: 'MouseName', width: 80},
            {label: '', name: 'ratentrez', index: 'RatEntrez', width: 80},
            {label: '', name: 'ratname', index: 'RatName', width: 80},
            {label: '', name: 'pmid', index: 'PMID', width: 80},
            {label: '', name: 'year', index: 'Year', width: 80},
            {label: '', name: 'paper', index: 'Paper', width: 80},
            {label: '', name: 'brainRegion', index: 'Brain_Region', width: 80},
            {label: '', name: 'disease', index: 'Disease', width: 80},
            {label: '', name: 'species', index: 'Species', width: 80},
            {label: '', name: 'method', index: 'Method', width: 80}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50, 100, 500, 1000],
        rownumbers: true,
        rownumWidth: 50,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            $("#sqlPreview").val(vm.sql);

            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
    $(".layui-form-checkbox").click(function () {
        var className = "layui-form-checked";
        if ($(this).hasClass(className))
            $(this).removeClass(className);
        else
            $(this).addClass(className);
    });

});

var vm = new Vue({
    el: '#app',
    data: {
        showColStr: "",
        showList: true,
        title: null,
        initSql: "SELECT GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method FROM FullAll ",
        sql: "SELECT GeneID,Compartment,HumanEntrez,HumanName,MouseEntrez,MouseName,RatEntrez,RatName,PMID,Year,Paper,Brain_Region,Disease,Species,Method FROM FullAll ",
        fullall: {}
    },
    methods: {
        query: function () {
            if ($("#sqlInput").val())
                this.addSql();
            else
                vm.sql = $("#sqlPreview").val();

            var temp = "";
            $('.layui-form-checkbox').each(function () {//遍历每一个名字为hideColumn的复选框，其中选中的执行函数
                vm.showColStr = "";
                var tempCol = $(this).text();
                var columnStr = $(this).text().toLowerCase();

                if (columnStr.indexOf("_") !== -1) {
                    var cloumnTemp = "";
                    var j = -2;
                    for (var i = 0; i < columnStr.length; i++) {
                        var ch = columnStr.charAt(i);
                        if (ch === "_") {
                            j = i;
                        } else {
                            if (i === (j + 1))
                                cloumnTemp += (ch.toUpperCase());
                            else
                                cloumnTemp += ch;
                        }
                    }
                    columnStr = cloumnTemp;
                }

                if (!$(this).hasClass("layui-form-checked")) {
                    $("#jqGrid").setGridParam().hideCol(columnStr);
                    vm.sql = vm.sql.replace(("," + tempCol), "");
                } else {
                    $("#jqGrid").setGridParam().showCol(columnStr);
                    temp += tempCol + ",";
                }
            });

            if (temp.length > 0)
                temp = "," + temp.substring(0, temp.length - 1);

            vm.showColStr = temp;
            vm.reload();
            $("#sqlPreview").val(vm.sql);

            $("#jqGrid").trigger("reloadGrid");//刷新
            $("#jqGrid").setGridWidth($(window).width()); //设置宽度
        },
        addSql: function () {
            console.log("addSql");
            $("#sqlPreview").val();
            var sqlColumn = $("#sqlInput").val().replace(/：/g, ":").replace(/；/g, ";").replace(/ /g,'');
            vm.sql = vm.initSql;
            if (!sqlColumn) {
                $("#sqlPreview").val(vm.sql);
                return;
            }

            var sqlColumnList = sqlColumn.split(";");
            for (var i = 0; i < sqlColumnList.length; i++) {
                var item = sqlColumnList[i];
                var subNum = item.indexOf(":");
                if (!item) {
                    continue;
                }

                if (vm.initSql.toLowerCase().indexOf(item.substring(0, subNum).toLowerCase()) === -1) {
                    layer.alert("字段名填写错误");
                    return;
                }
                var orColumn = item.substring(subNum + 1, item.length).split(",");
                // console.log(orColumn);
                var orTemp = "";

                var columnName = item.substring(0, subNum);

                for (var j = 0; j < orColumn.length; j++) {
                    if (j === orColumn.length - 1)
                        orTemp += columnName + " = '" + orColumn[j] + "' ";
                    else
                        orTemp += columnName + " = '" + orColumn[j] + "' or ";
                }

                // vm.sql += (i === 0?" where ":" and ") + columnName + " = " + "'" + orTemp + "'";
                vm.sql += (i === 0 ? " where " : " and ") + orTemp;
                $("#sqlPreview").val(vm.sql);
            }
        },
        // exportCsv: function (event) {
        //     $.ajax({
        //         type: "POST",
        //         url: baseURL + "sqlite/fullall/export",
        //         // contentType: "application/json",
        //         // contentType: "application/csv;charset=UTF-8",
        //         contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        //         data: JSON.stringify({}),
        //         success: function (r) {
        //             if (r.code === 0) {
        //                 alert(r.msg, function (index) {
        //                     vm.reload();
        //                 });
        //             } else {
        //                 alert(r.msg);
        //             }
        //         }
        //     });
        // },

        exportCsv: function (event) {
            location.href = baseURL + "sqlite/fullall/export" ;

            // var url = "sqlite/fullall/export";
            // window.open(url);
        },

        genPpi: function () {
            location.href = "modules/sqlite/plugin-snapshot.html";
        },
        reload: function (event) {
            vm.showList = true;
            var sqlWhere = "";
            var allSql = $("#sqlPreview").val();
            var index = allSql.indexOf("where");

            if (index !== -1) {
                sqlWhere = allSql.substring(index, allSql.length);
            }

            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                mtype: "POST",//post请求需要加
                postData: {'sqlWhere': sqlWhere, 'showCol': "" + vm.showColStr},
                page: page
            }).trigger("reloadGrid");
        }
    }
});