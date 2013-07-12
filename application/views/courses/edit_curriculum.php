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
	    	
	    	<div id="message_result"></div>

			<ul id="newChapter" class="item-list-custom newChapter">
				<li>
					<div class="title-chapter" id="div-add-title">
						Agregar Capitulo
					</div>
			  		<div class="title-chapter" id="add-chapter"> 
			  			<!--<form class="form-horizontal">-->
						  <div class="control-group">
						    <label class="control-label" for="input-chapter-name">Agregar Capitulo</label>
						    <div class="controls">
						      <input type="text" name= "input-chapter-name" id="input-chapter-name" placeholder="Titulo">
						    </div>
						  </div>
						  <div class="control-group">
						  	<div class="controls">
						  		<button type="btn" class="btn btn-success" id="btnAddChapter">Guardar</button>
						  		<button type="btn" class="btn" id="btnCancelAddChapter">Cancelar</button>
						  	</div>
						  </div>
						<!--</form>-->
			  		</div>
			  	</li>
			</ul>

			<ul id="chapters" class="item-list-custom">
				<?php foreach($course->chapter->order_by("order",'asc')->get() as $chapter): ?>
					<li data-order="<?=$chapter->order?>" data-id="<?=$chapter->id?>" data-name="<?=$chapter->name?>" id="item_<?=$chapter->id?>">
				  		<div class="row title-chapter">
				  			<div class="span6">
					  			<?=$chapter->name?> 
					  			<i class="icon-pencil icon-white chapter-edit chapter-edit-hidden"></i>
					  		</div>
					  		<div class="span6 btns-right">
				  				<i class="icon-download icon-white chapter-bull-down chapter-bull-down-hidden" ></i>
				  			</div>
				  		</div>
				  		<ul id="newLesson" class="item-list-custom newLesson newLesson-hidden">
					  		<li>
					  			<div class="title-lesson div-add-lesson">
									Agregar Tema
								</div>
						  		<div class="title-lesson add-lesson" > 
									  <div class="control-group">
									    <label class="control-label" for="input-lesson-name">Agregar Tema</label>
									    <div class="controls">
									      <input type="text" name="input-lesson-name" placeholder="Titulo">
									    </div>
									  </div>
									  <div class="control-group">
									  	<div class="controls">
									  		<button type="btn" class="btn btn-success btnAddLesson" >Guardar</button>
									  		<button type="btn" class="btn btnCancelAddLesson" >Cancelar</button>
									  	</div>
									  </div>
						  		</div>
					  		</li>
					  	</ul>
					  	<ul id="lessons-<?=$chapter->id?>" class="item-list-custom lessons lessons-hidden">
					  		<?php foreach($chapter->lesson->order_by("order",'asc')->get() as $lesson): ?>
					  			<li data-order="<?=$lesson->order?>" data-id="<?=$lesson->id?>" data-name="<?=$lesson->name?>" id="item_<?=$lesson->id?>">
				  					<div class="row title-lesson">
				  						<div class="span6">
				  							<?=$lesson->name?> <i class="icon-pencil icon-white lesson-edit lesson-edit-hidden"></i>
				  						</div>
				  						<div class="span6 btns-right">
				  							<a href="#" class="btn btn-small btn-success btnAddContent">Agregar Contenido</a>
				  						</div>
				  					</div>
				  					<div class="row box-content box-content-hidden">
				  						<div class="box-title">
				  							Seleccione tipo de contenido
				  							<div>
				  								<a href="#" class="btnBoxRemove" title="Cerrar"><i class="icon-remove"></i></a>
				  							</div>
				  						</div>
				  						<div class="span12 box">
					  						<img src="<?=site_url()?>assets/img/text.png" class="img-rounded" title="Texto">
					  						<img src="<?=site_url()?>assets/img/image.png" class="img-rounded" title="Imágen">
					  						<img src="<?=site_url()?>assets/img/audio.png" class="img-rounded" title="Audio">
					  						<img src="<?=site_url()?>assets/img/video.png" class="img-rounded" title="Video">
					  						<img src="<?=site_url()?>assets/img/presentation.png" class="img-rounded" title="Presentación">
					  						<img src="<?=site_url()?>assets/img/pdf.png" class="img-rounded" title="Pdf">
				  						</div>
				  					</div>
				  				</li>
					  		<?php endforeach; ?>
					  	</ul>
				  	</li>
				<?php endforeach; ?>
			</ul>

			<div class="wysiwyg-editor" id="editor1"></div>

	    </div>
	</div>
</div><!-- /row -->



<script type="text/javascript">
	$(document).ready(function()
	{
		$("#chapters").sortable({
	      placeholder: "ui-state-highlight",
	      start:function(){
				//alert("Estas utilizando Drag and Drop");
				
			},
			stop:function(){
				 var data = $(this).sortable('toArray');
				 $.ajax({
					url: "<?=site_url('chapters/updateorder')?>",
					type: "POST",
					data: {'arrOrder': data },
					dataType: "json",
					success: function(data){
						if(data.message_status == 'success'){
							//showMessageNewChapter(data.message_html);
							console.log(data);
						}else{
							showMessageNewChapter(data.message_html);
							console.log(data);
						}
					},
					error: function(data){
						console.log(data);
					}
				});
			}
	    });

	    $(".lessons").sortable({
	      placeholder: "ui-state-highlight",
	      start:function(){
				//alert("Estas utilizando Drag and Drop");
				
			},
			stop:function(){
				 var data = $(this).sortable('toArray');
				 $.ajax({
					url: "<?=site_url('lessons/updateorder')?>",
					type: "POST",
					data: {'arrOrder': data },
					dataType: "json",
					success: function(data){
						if(data.message_status == 'success'){
							console.log(data);
						}else{
							showMessageNewChapter(data.message_html);
							console.log(data);
						}
					},
					error: function(data){
						console.log(data);
					}
				});
			}
	    });

	    //$("#chapters").disableSelection();
	    $("#lessons1,#lessons2").sortable({
	      placeholder: "ui-state-highlight"
	    });
	    $("#div-add-title").click(function(){
	    	$(this).css("display","none");
	    	$("#add-chapter").css("display","block");
	    });
	    $(".div-add-lesson").click(function(){
	    	$(this).css("display","none");
	    	var div = $(this).parent();
	    	$(".add-lesson",div).css("display","block");
	    });
		$("#btnCancelAddChapter").click(function(){
			$("#div-add-title").css("display","block");
	    	$("#add-chapter").css("display","none");
			return false;
		});
		$(".btnCancelAddLesson").click(function(){
			var div = $(this).parent().parent().parent().parent();
			$(".add-lesson",div).css("display","none");
			$(".div-add-lesson",div).css("display","block");
		});
		$("#btnAddChapter").click(function(){
			var order = getChapterOrder();
			$.ajax({
					url: "<?=site_url('chapters/create')?>",
					type: "POST",
					data: {'name': $("#input-chapter-name").val(), 'order': order, 'course_id': <?=$course->id?> },
					dataType: "json",
					success: function(data){
						if(data.message_status == 'success'){
							builtChapterView(data.chapter);
							showMessageNewChapter(data.message_html);
							$("#input-chapter-name").val("");
						}else{
							showMessageNewChapter(data.message_html);
						}
						
					},
					error: function(data){
						console.log(data);
					}
			});
		});
		$(".btnAddLesson").click(function(){
			var cList = $(this).parent().parent().parent().parent().parent().parent();
			var chapter_id = cList.data('id');
			var add_lesson = $(this).parent().parent().parent();
			var lesson_name = add_lesson.find($("input[name=input-lesson-name]"));
			var order = getLessonOrder(chapter_id);
			$.ajax({
					url: "<?=site_url('lessons/create')?>",
					type: "POST",
					data: {'name': lesson_name.val(), 'order': order, 'chapter_id': chapter_id},
					dataType: "json",
					success: function(data){
						if(data.message_status == 'success'){
							builtLessonView(data.lesson,chapter_id);
							showMessageNewChapter(data.message_html);
							lesson_name.val("");
						}else{
							showMessageNewChapter(data.message_html);
						}
						
					},
					error: function(data){
						console.log(data);
					}
			});
		});

		//but we want to change a few buttons colors for the third style
		$('#editor1').ace_wysiwyg({
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
	
	// for chapter
	$(document).on("mouseover", "#chapters li", function(e) {
	    $(".title-chapter .span6 .chapter-edit",this).removeClass("chapter-edit-hidden");
	    $(".title-chapter .span6 .chapter-edit",this).fadeIn(500);
	    $(".title-chapter .btns-right .chapter-bull-down",this).removeClass("chapter-bull-down-hidden");
	    $(".title-chapter .btns-right .chapter-bull-down",this).fadeIn(500);
	});
	$(document).on("mouseleave", "#chapters li", function(e) {
	    $(".title-chapter .span6 .chapter-edit",this).addClass("chapter-edit-hidden");
	    $(".title-chapter .btns-right .chapter-bull-down",this).addClass("chapter-bull-down-hidden");
	});
	$(document).on("click", "#chapters li .title-chapter .span6 .chapter-edit", function(e) {
	   builtChapterEditView($(this).parent().parent().parent());
	});
	$(document).on("click", "#chapters li .title-chapter .btns-right .chapter-bull-down", function(e) {
	   var button = this;
	   var cList = $(button).parent().parent().parent();
	   $(".lessons,.newLesson",cList).slideToggle(500, function(){
	  		$(button).toggleClass('icon-upload', $(this).is(':visible')); 	
	   });
	});

	$(document).on("click", "#btnCancelEditChapter", function(e) {
	   var cList = $(this).parent().parent().parent().parent();
	   $("#chapter-edit-title").remove();
	   $(".title-chapter",cList).css("display","block");
	   return false;
	});
	$(document).on("click", "#btnEditChapter", function(e) {
	   var cList = $(this).parent().parent().parent().parent();
	   $.ajax({
			url: "<?=site_url('chapters/update')?>",
			type: "POST",
			data: {'id': cList.data('id'), name: $("#input-chapter-edit-name").val(), 'order': cList.data('order'), 'course_id': <?=$course->id?> },
			dataType: "json",
			success: function(data){
				if(data.message_status == 'success'){
					updateChapterView(cList, data.chapter);
					showMessageNewChapter(data.message_html);
				}else{
					showMessageNewChapter(data.message_html);
				}
				
			},
			error: function(data){
				console.log(data);
			}
		});
	});

	$(document).on("click", "#btnDeleteChapter", function(e) {
	   if(confirm("Are you sure?")){
		   var cList = $(this).parent().parent().parent().parent().parent();
		   $.ajax({
				url: "<?=site_url('chapters/delete')?>",
				type: "POST",
				data: {'id': cList.data('id')},
				dataType: "json",
				success: function(data){
					if(data.message_status == 'success'){
						cList.remove();
						showMessageNewChapter(data.message_html);
					}else{
						showMessageNewChapter(data.message_html);
					}
					
				},
				error: function(data){
					console.log(data);
				}
			});
		}
	});

	function getChapterOrder()
	{
		var last_li = $('#chapters li:last');
		if(last_li.data("order") != null){
			return parseInt(last_li.data("order")) + 1;
		}
		else
			return 1;
	}

	function builtChapterView(chapter){
		var cList = $('#chapters');
		/*if (!cList.hasClass('nav-stacked')) {
			cList.addClass('nav nav-tabs nav-stacked');
		}*/
		var li = $('<li/>')
			.attr("data-order",chapter.order)
			.attr("data-id",chapter.id)
			.attr("data-name",chapter.name)
			.attr("id",'item_'+chapter.id)
			.attr("class",'chapter-hidden')
	        .appendTo(cList).fadeIn(1000);
	    var div = $('<div/>')
	    	.addClass("title-chapter")
	        .html(chapter.name)
	        .attr("data-id",chapter.id)
	        .appendTo(li);
	    var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white chapter-edit chapter-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(div);
	
	}

	function builtChapterEditView(li){
		var cList = li;
		var old_title = cList.data("name");
		$(".title-chapter",cList).css("display","none");
		var title_chapter = $("<div/>")
			.attr("class","chapter-title-edit")
			.attr("id","chapter-edit-title")
			.appendTo(cList);
		var control_group = $("<div/>")
			.attr("class","control-group")
			.appendTo(title_chapter);
		var label = $("<label/>")
			.attr("class","control-label")
			.attr("for","input-chapter-name")
			.text("Editar Capitulo")
			.appendTo(control_group);
		var controls = $("<div/>")
			.attr("class","controls")
			.appendTo(control_group);
		var input = $("<input/>")
			.attr("type","text")
			.attr("name","input-chapter-edit-name")
			.attr("id","input-chapter-edit-name")
			.val(old_title)
			.appendTo(controls);
		var control_group_btns = $("<div/>")
			.attr("class","control-group")
			.appendTo(title_chapter);
		var controls_btns = $("<div/>")
			.attr("class","controls")
			.appendTo(control_group_btns);
		var btn_save = $("<button/>")
			.attr("type","button")
			.attr("class","btn btn-success")
			.attr("id", "btnEditChapter")
			.text("Editar")
			.appendTo(controls_btns);
		var btn_cancel = $("<button/>")
			.attr("type","button")
			.attr("class","btn")
			.attr("id", "btnCancelEditChapter")
			.text("Cancelar")
			.css("margin-left","3px")
			.appendTo(controls_btns);

		var div_trash = $("<div/>")
			.attr("class","remove-chapter")
			.appendTo(controls_btns);
		var btn_trash = $("<button/>")
			.attr("type","button")
			.attr("class","btn btnDeleteChapter")
			.attr("id", "btnDeleteChapter")
			.appendTo(div_trash);

		var i_trash = $("<i/>")
			.attr("class","icon-trash")
			.appendTo(btn_trash);
	}

	function updateChapterView(li,chapter){
		var div = $(".title-chapter",li);
		div.html(chapter.name);
		li.attr("data-name",chapter.name);
		var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white chapter-edit chapter-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(div);
	    $("#chapter-edit-title").remove();
	    div.css("display","block");
	}


	//for lesson

	$(document).on("mouseover", ".lessons li", function(e) {
	    $(".title-lesson .lesson-edit",this).removeClass("lesson-edit-hidden");
	    $(".title-lesson .lesson-edit",this).fadeIn(500);
	});
	$(document).on("mouseleave", ".lessons li", function(e) {
	    $(".title-lesson .lesson-edit",this).addClass("lesson-edit-hidden");
	});
	$(document).on("click", ".lessons li .title-lesson .span6 .lesson-edit", function(e) {
	    builtLessonEditView($(this).parent().parent().parent());
	});
	$(document).on("click", ".btnCancelEditLesson", function(e) {
	   var cList = $(this).parent().parent().parent().parent();
	   $(".lesson-title-edit",cList).remove();
	   $(".title-lesson",cList).css("display","block");
	   return false;
	});
	$(document).on("click", ".btnEditLesson", function(e) {
	   var chapter_content = $(this).parent().parent().parent().parent().parent().parent();
	   var chapter_id = chapter_content.data('id');
	   var cList = $(this).parent().parent().parent().parent();
	   var add_lesson = $(this).parent().parent().parent();
	   var lesson_name = add_lesson.find($("input[name=input-lesson-edit-name]"));
	   var order = getLessonOrder(chapter_id);
	   $.ajax({
			url: "<?=site_url('lessons/update')?>",
			type: "POST",
			data: {'id': cList.data('id'), name: lesson_name.val(), 'order': order, 'chapter_id': chapter_id },
			dataType: "json",
			success: function(data){
				if(data.message_status == 'success'){
					updateLessonView(cList, data.lesson);
					showMessageNewChapter(data.message_html);
				}else{
					showMessageNewChapter(data.message_html);
				}
				
			},
			error: function(data){
				console.log(data);
			}
		});
	});
	$(document).on("click", ".btnDeleteLesson", function(e) {
	   if(confirm("Are you sure?")){
		   var cList = $(this).parent().parent().parent().parent().parent();
		   $.ajax({
				url: "<?=site_url('lessons/delete')?>",
				type: "POST",
				data: {'id': cList.data('id')},
				dataType: "json",
				success: function(data){
					if(data.message_status == 'success'){
						cList.remove();
						showMessageNewChapter(data.message_html);
					}else{
						showMessageNewChapter(data.message_html);
					}
					
				},
				error: function(data){
					console.log(data);
				}
			});
		}
	});

	function getLessonOrder(chapter_id)
	{
		var last_li = $('#lessons-'+chapter_id+' li:last');
		if(last_li.data("order") != null){
			return parseInt(last_li.data("order"));
		}
		else
			return 0;
	}

	function showMessageNewChapter(data){
		$("#message_result").html(data);
	    $("#message_result > .alert").fadeIn(500, function() {
	        $(this).delay(2000).fadeOut(500);
	    }); 
	}

	function builtLessonView(lesson, chapter_id){
		var cList = $('#lessons-'+chapter_id);
		/*if (!cList.hasClass('nav-stacked')) {
			cList.addClass('nav nav-tabs nav-stacked');
		}*/
		var li = $('<li/>')
			.attr("data-order",lesson.order)
			.attr("data-id",lesson.id)
			.attr("data-name",lesson.name)
			.attr("id",'item_'+lesson.id)
			.attr("class",'lesson-hidden')
	        .appendTo(cList).fadeIn(1000);
	    var div = $('<div/>')
	    	.addClass("title-lesson")
	        .html(lesson.name)
	        .attr("data-id",lesson.id)
	        .appendTo(li);
	    var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white lesson-edit lesson-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(div);
	
	}

	function builtLessonEditView(li){
		var cList = li;
		var old_title = cList.data("name");
		$(".title-lesson",cList).css("display","none");
		var title_lesson = $("<div/>")
			.attr("class","lesson-title-edit")
			.attr("id","lesson-edit-title")
			.appendTo(cList);
		var control_group = $("<div/>")
			.attr("class","control-group")
			.appendTo(title_lesson);
		var label = $("<label/>")
			.attr("class","control-label")
			.attr("for","input-lesson-name")
			.text("Editar Tema")
			.appendTo(control_group);
		var controls = $("<div/>")
			.attr("class","controls")
			.appendTo(control_group);
		var input = $("<input/>")
			.attr("type","text")
			.attr("name","input-lesson-edit-name")
			.attr("id","input-lesson-edit-name")
			.val(old_title)
			.appendTo(controls);
		var control_group_btns = $("<div/>")
			.attr("class","control-group")
			.appendTo(title_lesson);
		var controls_btns = $("<div/>")
			.attr("class","controls")
			.appendTo(control_group_btns);
		var btn_save = $("<button/>")
			.attr("type","button")
			.attr("class","btn btn-success btnEditLesson")
			.attr("id", "btnEditLesson")
			.text("Editar")
			.appendTo(controls_btns);
		var btn_cancel = $("<button/>")
			.attr("type","button")
			.attr("class","btn btnCancelEditLesson")
			.attr("id", "btnCancelEditLesson")
			.text("Cancelar")
			.css("margin-left","3px")
			.appendTo(controls_btns);

		var div_trash = $("<div/>")
			.attr("class","remove-lesson")
			.appendTo(controls_btns);
		var btn_trash = $("<button/>")
			.attr("type","button")
			.attr("class","btn btnDeleteLesson")
			.attr("id", "btnDeleteLesson")
			.appendTo(div_trash);

		var i_trash = $("<i/>")
			.attr("class","icon-trash")
			.appendTo(btn_trash);
	}

	function updateLessonView(li,lesson){
		var div = $(".title-lesson",li);
		div.html(lesson.name);
		li.attr("data-name",lesson.name);
		var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white lesson-edit lesson-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(div);
	    $(".lesson-title-edit",li).remove();
	    div.css("display","block");
	}

	//for content
	$(document).on("click", ".lessons li .title-lesson .btns-right .btnAddContent", function(e) {
	   var cList = $(this).parent().parent().parent();
	   $(this).fadeOut(200);
	   $(".box-content",cList).fadeIn(500);
	});
	$(document).on("click", ".lessons li .box-content .box-title div .btnBoxRemove", function(e) {
	   var cList = $(this).parent().parent().parent().parent();
	   $(".box-content",cList).fadeOut(200);
	   $(".title-lesson .btns-right .btnAddContent",cList).fadeIn(500);
	   
	});

</script>
<?php echo $this->load->view("default/_footer_manage"); ?>
