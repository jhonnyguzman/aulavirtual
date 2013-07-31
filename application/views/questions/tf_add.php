<div class="quiz-content">
	<p>Introduce tu pregunta, marca la respuesta correcta y haz clic en guardar.</p>
	<p>Pregunta:</p>
	<div class="wysiwyg-editor cancel text-editor-questions text-editor-quiz-<?=$quiz_id?>" id="<?=$quiz_id?>"></div>
	<p class="vf_checks-edit">
		<label>
			<input name="result" type="radio" value="1" />
			<span class="lbl"> Verdadero</span>
		</label>

		<label>
			<input name="result" type="radio" value="0"/>
			<span class="lbl"> Falso</span>
		</label>

	</p>
	<p class="content-btns-bottom content-btns-bottom-questions">
		<button class="btn btn-mini btn-success btnSaveQuestionTypeTF"><i class="icon-ok"></i>Guardar</button>
	</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	//but we want to change a few buttons colors for the third style
	$('.text-editor-quiz-<?=$quiz_id?>').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			null,
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
	}).prev().addClass('wysiwyg-style1');
	
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