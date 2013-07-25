<div class="row ">
	<ul id="myTabVideo" class="nav nav-tabs myTabVideo">
      <li class="active"><a href="#uploadVideo-<?=$lesson_id?>" >Subir Video</a></li>
      <li><a href="#importYoutube-<?=$lesson_id?>" >Importar de Youtube</a></li>
    </ul>
    <div id="myTabContentVideo" class="tab-content myTabContentVideo">
      <div class="tab-pane fade in active  uploadVideo" id="uploadVideo-<?=$lesson_id?>">
      		<div class="row">
	        	<div class="span8">
					<!-- The global progress bar -->
					<div id="progress" class="progress progress-success progress-striped progress-upload-video">
					    <div class="bar"></div>
					    <small>Utiliza archivos .mp4, .mov, o .wmv que no sean mayores de 1.0 GiB.</small>
					</div>
					<div class="video_file_name">
						<small></small>
					</div>
					<div>
						Consejo: Video is FormaNube's preferred delivery type. At least 60% of your course content 
						should be high resolution video (720p or HD) with excellent audio and lighting. Upload your video directly to Udemy for best quality viewing 
						and to make full use of learning tools! Widescreen 16:9 ratio is preferred but 4:3 accepted. Average video length is between 2-15 minutes..
					</div>
				</div>
				<div class="span3 btns_upload">
					<span class="btn btn-small btn-success fileinput-button">
					    <i class="icon-plus icon-white"></i>
					    <span>Agregar Archivo...</span>
					    <input id="fileupload" name="userfile" type="file" >
					</span>
					<button type="btn" class="btn btn-small btn-error abortUploadVideo">Cancelar</button>
				</div>
			</div>
      </div>
      <div class="tab-pane fade importYoutube" id="importYoutube-<?=$lesson_id?>">
      	<form class="form-search">
        	<input type="text" name="videoyoutube" placeholder="Coloque la URL del video aqui" class="input-xxlarge search-query videoyoutube">
        	<button type="btn" class="btn btn-small btn-success btn-add-youtube-video">Añadir</button>
        	<button type="btn" class="btn btn-small btn-info btn-video-preview"><i class="icon-eye-open icon-white"></i> Visualizar</button>
            
        </form>

      </div>
    </div>
</div>
<!-- Modal -->
<div id="video-preview-modal" class="modal hide fade video-preview-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>


<!-- The container for the uploaded files -->
<div id="files" class="files"></div>

<script type="text/javascript">
$(function () {
    'use strict';
    
    $('.myTabVideo a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    var url = "<?=site_url('contents/video_create')?>";
    $('.myTabContentVideo .uploadVideo .row .btns_upload span #fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: true,
        loadVideoFileTypes: /^video\/(avi|mov|mp4)$/,
        maxFileSize: 20000000, // 200 MB
        replaceFileInput: false,
        limitMultiFileUploads: 1,
        formData: {lesson_id: <?=$lesson_id?>},
        add: function(e, data) {
            var span = $(this).parent();
            var row = span.parent().parent();
            var btns_upload = span.parent();
        	//data.context = $(".myTabContentVideo .uploadVideo .row .btns_upload .fileinput-button");
        	//data.context.hide();
            span.hide();
        	//$('.start').click(function (e) {
	        var jqXHR = data.submit();
	        //});
			$('.abortUploadVideo',btns_upload).show();
	        $('.abortUploadVideo',btns_upload).click(function (e) {
	            if(typeof jqXHR != 'undefined') {
	                jqXHR.abort();
	                span.show();
	                $(this).hide();
	                $('.span8 .progress-upload-video .bar',row).css('width','0%');
	                $('.span8 .progress-upload-video .bar',row).text('');
	            }
	            else {
	                span.show();
	                $(this).hide();
	                $('.span8 .progress-upload-video .bar',row).css('width','0%');
	                $('.span8 .progress-upload-video .bar',row).text('');
	            }
	        });
	        $(".span8 .video_file_name small",row).html("<strong>Archivo Seleccionado: </strong>" + data.files[0].name);
        },
        done: function (e, data) {
            /*$.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });*/
            var my_tab_content_video = $(this).parent().parent().parent().parent();
            var cList = my_tab_content_video.parent().parent().parent().parent().parent();
            var span = $(this).parent();
            if(data.result.message_status == 'success'){
                $('.abortUploadVideo',my_tab_content_video).hide();
                gritterAdd("Mensaje", data.result.message_html, data.result.message_status);
                builtContentViewVideo(cList,data.result.content_video);
            }else{
                $(this).parent().show();
                $('.abortUploadVideo',my_tab_content_video).hide();
                gritterAdd("Mensaje", data.result.message_html, data.result.message_status);
                
            }

        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            var row = $(this).parent().parent().parent();
            $('.span8 .progress-upload-video .bar',row).css(
                'width',
                progress + '%'
            );
            $('.span8 .progress-upload-video .bar',row).text(progress + " %");
        },
        progress: function (e, data) {
            console.log(data.bitrate);
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');

    //show video preview
    $(".importYoutube .form-search .btn-video-preview").click(function(){
        var form_search = $(this).parent();
        var url = "<?=site_url()?>contents/video_preview/"
        var video_url = $(".videoyoutube",form_search).val();
        loadVideoPreview(url,$("#video-preview-modal"), video_url);
        return false;
    });

    
    $(".importYoutube .form-search .btn-add-youtube-video").click(function(){
        var obj = $(this);
        if(isProcessing){
            return;
        }
        isProcessing = true;

        var cList = $(this).parent().parent().parent().parent().parent().parent().parent();
        var form_search = $(this).parent();
        var lesson_id = cList.data('id');
        var video_url = $(".videoyoutube",form_search);
        $.ajax({
                url: "<?=site_url('contents/video_create_url')?>",
                type: "POST",
                data: {'video_url': video_url.val(), type: 'youtube', 'lesson_id': lesson_id},
                dataType: "json",
                beforeSend: function() {
                    runSpin(obj);
                },
                success: function(data){
                    isProcessing = false;
                    if(data.message_status == 'success'){
                        builtContentViewVideo(cList,data.content_video);
                        gritterAdd("Mensaje", data.message_html, data.message_status);
                    }else{
                        gritterAdd("Mensaje", data.message_html, data.message_status);
                    }
                },
                error: function(data){
                    isProcessing = false;
                    console.log(data);
                },
                complete: function() {
                    removeSpin(obj);
                }
        });
        return false;
    });

});

function builtContentViewVideo(cList,content_video){
    var box_content = $(".box-content",cList);
    box_content.empty();
    var btns_right = $(".title-lesson .btns-right", cList);
    btns_right.empty();

    var lesson_bull_down = $("<i/>")
        .attr("class","icon-download icon-white lesson-bull-down lesson-bull-down-hidden") 
        .appendTo(btns_right);

    var box = $("<div/>")
        .attr("class","span12 box")
        .appendTo(box_content);
    var single_item = $("<div/>")
        .attr("class","span12 single-item")
        .appendTo(box);
    var span6 = $("<div/>")
        .attr("class","span6")
        .appendTo(single_item);
    var img = $("<img/>")
        .attr("src","<?=site_url()?>assets/img/video_medium.png")
        .attr("class","img-circle")
        .appendTo(span6);
    var p = $("<p/>")
        .appendTo(span6);
    var strong = $("<strong/>")
        .text("Video")
        .appendTo(p);
    var br1 = $("<br>")
        .appendTo(p);
    var btnEditContent = $("<a/>")
        .attr("href","#")
        .attr("class","btnEditContent")
        .text("Editar")
        .appendTo(p);
    var br2 = $("<br>")
        .appendTo(p);
    var btnEditContentPreviewVideo = $("<a/>")
        .attr("href","#")
        .attr("data-url",content_video.url)
        .attr("class","btnEditContentPreviewVideo")
        .text("Visualizar")
        .appendTo(p);
    var more = $("<div/>")
        .attr("class","span12 more")
        .appendTo(single_item);
    var a1 = $("<a/>")
        .attr("class","btn btn-success btn-small btnAddDescriptionContent")
        .text("Agregar Descripción")
        .appendTo(more);
    var a2 = $("<a/>")
        .attr("class","btn btn-success btn-small btnAddExtraMaterialContent")
        .text("Agregar Material Extra")
        .appendTo(more);

}
</script>
