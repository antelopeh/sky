<style>
    .label-danger {
        background-color: #F3565D;
    }
    .label {
        text-shadow: none !important;
        font-size: 13px;
        font-weight: 300;
        padding: 3px 6px 3px 6px;
        color: #fff;
        font-family: "Open Sans", sans-serif;
    }


</style>
<div class="input-form-left" style="width:73%;float: left;">
    <div class="row" style="margin-top:20px;">
        <div class="col-md-12">
            <p>
						<span class="label label-danger"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
						注意：</font></font></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                &nbsp; 此插件仅适用于最新的Chrome，Firefox，Safari，Opera和Internet Explorer 10。
            </font></font></p>
            <form action="${rc.contextPath}/picture/pictureUpload" class="dropzone dz-clickable" id="my-dropzone" style="margin-top:10px;">
                <div class="dz-default dz-message"><span>Drop files here to upload</span></div></form>


            <div id="showImage_Form" class="modal fade bs-example-modal-lg text-center" id="imgModal"tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
                <button type="button" id="previous-button" aria-label="Previous" style="background:transparent;"><svg width="44" height="60"><polyline points="30 10 10 30 30 50" stroke="rgba(255,255,255,0.5)" stroke-width="4" stroke-linecap="butt" fill="none" stroke-linejoin="round"></polyline></svg></button>
                <div  class="modal-dialog modal-lg" style="display: inline-block; width: auto;height: auto;margin-left:50px;margin-right:50px;">
                    <div class="modal-content">
                        <img height='500px' width='800px' id="imgInModalID" src="" >
                    </div>
                </div>
                <button type="button" id="next-button" aria-label="Next" style="background:transparent;"><svg width="44" height="60"><polyline points="14 10 34 30 14 50" stroke="rgba(255,255,255,0.5)" stroke-width="4" stroke-linecap="butt" fill="none" stroke-linejoin="round"></polyline></svg></button>
            </div>

        </div>

    </div>
</div>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/jquery/jquery-migrate.min.js"></script>
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/plugins/dropzone/css/dropzone.css" />
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/dropzone/dropzone.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/bootstrap-viewer/dist/bootstrap.viewer.min.js"></script>

