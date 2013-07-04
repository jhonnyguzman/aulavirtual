<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
	<div class="row">
		<div class="page-header">
          <h2><?=$course->title?></h2>
        </div>
	</div>
	<div class="row">
		<div class="span3">
			<?php echo $this->load->view("courses/left_menu"); ?>
		</div>
	    <div class="span9">
	    	<div>
		    	<div class="page-header">
				  <h3>Curr&iacute;culo <small>Crea el esquema de tu curso y agrega los materiales.</small></h3>
				</div>
			</div>
	    	<?php echo $this->load->view("default/_result_messages"); ?>
	    	<!--<form action="<?=site_url('courses/update_curriculum')?>" method="post" id="updateCurriculum">
				    <?php if(isset($errors)): ?>
	                  <div class="alert alert-error">
	                    <a class="close" data-dismiss="alert" href="#">×</a>
	                        <?=$errors?>
	                  </div>    
	                <?php endif; ?>
	                <input type="hidden" name="id" value="<?=$course->id?>">
				    
				    
			</form>-->
			<ul id="newChapter" class="item-list newChapter">
				<li>
					<div class="title-chapter" id="div-add-title">
						Agregar Capitulo
					</div>
			  		<div class="title-chapter" id="add-chapter"> 
			  			<form class="form-horizontal">
						  <div class="control-group">
						    <label class="control-label" for="inputEmail">Agregar Capitulo</label>
						    <div class="controls">
						      <input type="text" id="inputEmail" placeholder="Titulo">
						    </div>
						  </div>
						  <div class="control-group">
						  	<div class="controls">
						  		<button type="submit" class="btn btn-success" id="btnAddChapter">Guardar</button>
						  		<button type="btn" class="btn" id="btnCancelAddChapter">Cancelar</button>
						  	</div>
						  </div>
						</form>
			  		</div>
			  	</li>
			</ul>
			<ul id="chapters" class="item-list">
			  <li class="item-blue">
			  	<div class="title-chapter"> Item 1</div>
			  	<ul id="lessons1" class="item-list">
			  		<li>
			  			<div class="title-lesson">Item 1.1</div>
			  			<div class="lesson-content">
			  				<div class="single-item">Contenido 1.1</div>
			  				<div class="details">Contenido 1.2</div>
			  				<div class="bottom-btns">Contenido 1.3</div>
			  			</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 1.2</div>
			  			<div class="lesson-content">
			  				<div class="single-item">Contenido 1.1</div>
			  				<div class="details">Contenido 1.2</div>
			  				<div class="bottom-btns">Contenido 1.3</div>
			  			</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 1.3</div>
			  			<div class="lesson-content">
			  				<div class="single-item">Contenido 1.1</div>
			  				<div class="details">Contenido 1.2</div>
			  				<div class="bottom-btns">Contenido 1.3</div>
			  			</div>
			  		</li>
			  	</ul>
			  </li>
			  <li class="item-orange">
			  	<div class="title-chapter"> Item 2</div>
			  	<ul id="lessons2" class="item-list">
			  		<li>
			  			<div class="title-lesson">Item 2.1</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 2.2</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 2.3</div>
			  		</li>
			  	</ul>
			  </li>
			  <li class="item-pink">
			  	<div class="title-chapter"> Item 3</div>
			  	<ul id="lessons3" class="item-list">
			  		<li>
			  			<div class="title-lesson">Item 3.1</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 3.2</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 3.3</div>
			  		</li>
			  	</ul>
			  </li>
			  <li class="item-green">
			  	<div class="title-chapter"> Item 4</div>
			  	<ul id="lessons4" class="item-list">
			  		<li>
			  			<div class="title-lesson">Item 4.1</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 4.2</div>
			  		</li>
			  		<li>
			  			<div class="title-lesson">Item 4.3</div>
			  		</li>
			  	</ul>
			  </li>
			  <li>Item 5</li>
			</ul>

	    </div>
	</div>
</div><!-- /row -->

<script type="text/javascript">
$(document).ready(function(){
	$("#chapters").sortable({
      placeholder: "ui-state-highlight"
    });
    //$("#chapters").disableSelection();
    $("#lessons1,#lessons2").sortable({
      placeholder: "ui-state-highlight"
    });
    $("#div-add-title").click(function(){
    	$(this).css("display","none");
    	$("#add-chapter").css("display","block");
    });
	$("#btnCancelAddChapter").click(function(){
		$("#div-add-title").css("display","block");
    	$("#add-chapter").css("display","none");
		return false;
	});
	$("#btnAddChapter").click(function(){
		$.ajax({
				url: "data.json",
				type: "POST",
				dataType: "json",
				success: function(data){
					
					
				},
				error: function(data){
					alert("ERROR");
				}
			});
		});
});
</script>
<?php echo $this->load->view("default/_footer_manage"); ?>