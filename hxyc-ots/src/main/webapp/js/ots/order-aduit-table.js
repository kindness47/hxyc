var TableDatatablesScroller = function () {

    var initTable1 = function () {
        var table = $('#orderAduitTable');

        var oTable = table.dataTable({
            "searching": false, // 隐藏收缩框
            "bLengthChange": false,  //去掉每页显示多少条数据方法

            //"sScrollY": 230,
            "scroller": false,
           // "sScrollX": 640,
            "bStateSave": true,

            // 载入数据时，是否显示‘进度’提示
            "bProcessing": true,

            "pageLength": 10,
            "order": [[0, 'asc']],
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0]}// 制定列不参与排序
            ]
        });

        // 复选框选择
        $("#checkboxAll").change(function () {
            var isChecked = $(this).is(":checked");
            if(isChecked){
                $("#depositTable input[type='checkbox']").each(function(){
                   $(this).prop("checked",true);
                });
            } else {
                $("#depositTable input[type='checkbox']").each(function(){
                    $(this).prop("checked",false);
                });
            }
        });
    }



    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }

            initTable1();
        }

    };

}();