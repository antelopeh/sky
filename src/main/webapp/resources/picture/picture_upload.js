
$(function() {
    FormDropzone.init();
    $("#previous-button").bind("click",function () {
        var index_ = 0;
        $(".dz-preview.dz-image-preview").each(function(index){
            var alt = $(this).find(".dz-filename").find("span").html();
            if($("#imgInModalID").attr("alt")==alt){
                index_ = index - 1;
                return;
            }
        });
        if(index_ != -1){
            $(".dz-preview.dz-image-preview").eq(index_).find(".fancybox")[0].click();
        }
    });

    $("#next-button").bind("click",function () {
        var index_ = 0;
        $(".dz-preview.dz-image-preview").each(function(index){
            var alt = $(this).find(".dz-filename").find("span").html();
            if($("#imgInModalID").attr("alt")==alt){
                index_ = index + 1;
                return;
            }
        });
        if(index_ != ($(".dz-preview.dz-image-preview").length + 1)){
            $(".dz-preview.dz-image-preview").eq(index_).find(".fancybox")[0].click();
        }
    });
});



var FormDropzone = function () {

    return {
        //main function to initiate the module
        init: function () {

            Dropzone.options.myDropzone = {
                init: function() {
                    this.on("addedfile", function(file) {
                        /*// Create the remove button
                        var removeButton = Dropzone.createElement("<button class='btn btn-block' style='margin-left:0;'>删除文件</button>");

                        // Capture the Dropzone instance as closure.
                        var _this = this;

                        // Listen to the click event
                        removeButton.addEventListener("click", function(e) {
                            // Make sure the button click doesn't submit the form:
                            e.preventDefault();
                            e.stopPropagation();

                            // Remove the file preview.
                            _this.removeFile(file);
                            // If you want to the delete the file on the server as well,
                            // you can do the AJAX request here.
                        });

                        // Add the button to the file preview element.
                        file.previewElement.appendChild(removeButton);*/
                    });
                }
            }
        }
    };
}();
