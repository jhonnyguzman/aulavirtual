<div class="row ">
	<ul id="myTabVideo" class="nav nav-tabs">
      <li class="active"><a href="#uploadVideo" data-toggle="tab">Subir Video</a></li>
      <li><a href="#importYoutube" data-toggle="tab">Importar de Youtube</a></li>
    </ul>
    <div id="myTabContentVideo" class="tab-content">
      <div class="tab-pane fade in active" id="uploadVideo">
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
      <div class="tab-pane fade" id="importYoutube">
      	<form class="form-search">
        	<input type="text" name="videoyoutube" placeholder="Coloque la URL del video aqui" class="input-xxlarge search-query">
        	<button type="btn" class="btn btn-small btn-success">Añadir</button>
        	<button type="btn" class="btn btn-small btn-info"><i class="icon-eye-open icon-white"></i> Visualizar</button>
        </form>

        <div id='my-video'></div>

      </div>
    </div>
</div>

<script src="<?=site_url()?>assets/js/jplayer/jwplayer.js"></script>
<script src="<?=site_url()?>assets/js/jplayer/jwplayer.html5.js"></script>

<!-- The container for the uploaded files -->
<div id="files" class="files"></div>

<script type="text/javascript">
$(function () {
    'use strict';
    var url = "<?=site_url('contents/video_create')?>";

    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: true,
        loadVideoFileTypes: /^video\/(avi|mov|mp4)$/,
        maxFileSize: 5000000, // 5 MB
        replaceFileInput: false,
        limitMultiFileUploads: 1,
        add: function(e, data) {
        	data.context = $(".btns_upload .fileinput-button");
        	data.context.hide('');
        	//$('.start').click(function (e) {
	        var jqXHR = data.submit();
	        //});
			$('.abortUploadVideo').show();
	        $('.abortUploadVideo').click(function (e) {
	            if(typeof jqXHR != 'undefined') {
	                jqXHR.abort();
	                data.context.show();
	                $(this).hide();
	                $('#progress .bar').css('width','0%');
	                $('#progress .bar').text('');
	            }
	            else {
	                data.context.show();
	                $(this).hide();
	                $('#progress .bar').css('width','0%');
	                $('#progress .bar').text('');
	            }
	        });
	        $(".video_file_name small").html("<strong>Archivo Seleccionado: </strong>" + data.files[0].name);
        },
        done: function (e, data) {
            /*$.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });*/
            $('.abortUploadVideo').hide();
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            );
            $('#progress .bar').text(progress + " %");
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');


    jwplayer('my-video').setup({
        file: '<?=site_url()?>assets/js/jplayer/echo-hereweare.mp4',
        primary: "flash",
        width: '640',
        height: '360'
    });
	


});
</script>