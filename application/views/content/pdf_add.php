<div class="row myTabContentPDF">
	<div class="span8">
		<!-- The global progress bar -->
		<div id="progress" class="progress progress-success progress-striped progress-upload-pdf">
		    <div class="bar"></div>
		    <small>Utiliza archivos pdfs que no sean mayores de 1.0 GiB.</small>
		</div>
		<div class="pdf_file_name">
			<small></small>
		</div>
		<div>
			Consejo: PDF is FormaNube's preferred delivery type. At least 60% of your course content 
			should be high resolution video (720p or HD) with excellent audio and lighting. Upload your pdf directly to FormNube for best quality viewing 
			and to make full use of learning tools! Widescreen 16:9 ratio is preferred but 4:3 accepted. Average video length is between 2-15 minutes..
		</div>
	</div>
	<div class="span3 btns_upload_pdf">
		<span class="btn btn-small btn-success fileinput-button">
		    <i class="icon-plus icon-white"></i>
		    <span>Agregar Archivo...</span>
		    <input id="fileupload" name="userfile" type="file" >
		</span>
		<button type="btn" class="btn btn-small btn-error abortUploadPdf">Cancelar</button>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var url = "<?=site_url('contents/pdf_create')?>";
    $('.myTabContentPDF .btns_upload_pdf .fileinput-button #fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: true,
        acceptFileTypes: /(\.|\/)(pdf)$/i,
        maxFileSize: 5000000, // 5 MB
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
			$('.abortUploadPdf',btns_upload).show();
	        $('.abortUploadPdf',btns_upload).click(function (e) {
	            if(typeof jqXHR != 'undefined') {
	                jqXHR.abort();
	                span.show();
	                $(this).hide();
	                $('.span8 .progress-upload-pdf .bar',row).css('width','0%');
	                $('.span8 .progress-upload-pdf .bar',row).text('');
	            }
	            else {
	                span.show();
	                $(this).hide();
	                $('.span8 .progress-upload-pdf .bar',row).css('width','0%');
	                $('.span8 .progress-upload-pdf .bar',row).text('');
	            }
	        });
	        $(".span8 .pdf_file_name small",row).html("<strong>Archivo Seleccionado: </strong>" + data.files[0].name);
        },
        done: function (e, data) {
            /*$.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });*/
            var my_content_pdf = $(this).parent().parent().parent();
            var cList = my_content_pdf.parent().parent().parent().parent().parent();
            var span = $(this).parent();
            if(data.result.message_status == 'success'){
                $('.abortUploadPdf',my_content_pdf).hide();
                gritterAdd("Mensaje", data.result.message_html, data.result.message_status);
                builtContentViewPDF(cList,data.result.content_pdf);
            }else{
                $(this).parent().show();
                $('.abortUploadPdf',my_content_pdf).hide();
                gritterAdd("Mensaje", data.result.message_html, data.result.message_status);
                
            }

        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            var row = $(this).parent().parent().parent();
            $('.span8 .progress-upload-pdf .bar',row).css(
                'width',
                progress + '%'
            );
            $('span8 .progress-upload-pdf .bar',row).text(progress + " %");
        },
        progress: function (e, data) {
            console.log(data.bitrate);
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});

function builtContentViewPDF(cList,content_pdf){
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
        .attr("src","<?=site_url()?>assets/img/pdf_medium.png")
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
    var btnEditContentPreviewPDF = $("<a/>")
        .attr("href","#")
        .attr("data-url","")
        .attr("data-id",content_pdf.id)
        .attr("class","btnEditContentPreviewPDF")
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