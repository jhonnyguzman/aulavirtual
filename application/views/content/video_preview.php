<div class="modal-body modal-preview-video">
	<div id='video_preview' class="video_preview"></div>
</div>
<div class="modal-footer">
	<button class="btn btn-mini" data-dismiss="modal" aria-hidden="true">Cerrar</button>
</div>

<script type="text/javascript">
$(document).ready(function(){
	jwplayer('video_preview').setup({
        file: '<?=$video_url?>',
        primary: "flash",
        width: "100%",
      	aspectratio: "12:5"
    });
});
</script>


