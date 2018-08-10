var Lock = function () {

    return {
        //main function to initiate the module
        init: function () {

             $.backstretch([
		        "http://localhost:8080/hxyc/vendors/metronic4.5.2/pages/media/bg/1.jpg",
    		    "http://localhost:8080/hxyc/vendors/metronic4.5.2/pages/media/bg/2.jpg",
    		    "http://localhost:8080/hxyc/vendors/metronic4.5.2/pages/media/bg/3.jpg",
    		    "http://localhost:8080/hxyc/vendors/metronic4.5.2/pages/media/bg/4.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		      });
        }

    };

}();

jQuery(document).ready(function() {
    Lock.init();
});