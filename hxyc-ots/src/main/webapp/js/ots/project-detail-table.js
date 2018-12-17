var TableDatatablesScroller = function () {

    var initTable1 = function () {
        var table = $('#projectDetailTable');

        var oTable = table.dataTable({
            "searching": false, // 隐藏收缩框
            "bLengthChange": false,  //去掉每页显示多少条数据方法
            //"sScrollY": 230,
            "scroller": true,
            "sScrollX": 2234,
            "bStateSave": true,

            // 载入数据时，是否显示‘进度’提示
            "bProcessing": true,

            "pageLength": 10,
            "order": [[13, 'desc']],
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                //{"orderable":false,"aTargets":[0]}// 制定列不参与排序
            ]
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

$(function(){
    TableDatatablesScroller.init();
});