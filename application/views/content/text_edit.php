<div class="box-title">
	<span>Editar Texto</span>
	<div>
		<a href="#" class="btnBoxRemove" title="Cerrar"><i class="icon-remove"></i></a>
	</div>
</div>
<?php if($message_status == "success"): ?>
	<div class="span12 box">
		<div class="wysiwyg-editor text-editor-<?=$content_text->lesson_id?>" id="<?=$content_text->id?>" data-lessonid="<?=$content_text->lesson_id?>">
			<?=html_entity_decode($content_text->text_html)?>
		</div>
		<p class="content-btns-bottom">
			<button class="btn btn-small btn-success btnSaveEditContentTypeText"><i class="icon-ok"></i>Guardar</button>
			<button class="btn btn-small btn-danger btnCancelEditContentTypeText" ><i class="icon-remove"></i>Cancelar</button>
		</p>
	</div>
<?php endif; ?>
<script type="text/javascript">
$(document).ready(function(){
	//but we want to change a few buttons colors for the third style
	$('.text-editor-<?=$content_text->lesson_id?>').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		speech_button : false, //don't show the speech input button on Chrome
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');
	
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}
});
</script>