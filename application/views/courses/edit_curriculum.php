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
				  			<div class="span6 btns-left">
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
				  						<div class="span6 btns-left">
				  							<?=$lesson->name?> <i class="icon-pencil icon-white lesson-edit lesson-edit-hidden"></i>
				  						</div>
				  						<div class="span6 btns-right">
				  							<?php if($lesson->content_text->count() > 0): ?>
				  								<i class="icon-download icon-white lesson-bull-down lesson-bull-down-hidden" ></i>
				  							<?php else: ?>
				  								<a href="#" class="btn btn-small btn-success btnAddContent">Agregar Contenido</a>
				  							<?php endif; ?>
				  						</div>
				  					</div>
				  					<div class="row box-content box-content-hidden cancel">
				  						<?php if($lesson->content_text->count() > 0): ?>
				  							<div class="span12 box">
					  							<div class="span12 single-item">
					  								<div class="span6">
						  								<img src="<?=site_url()?>assets/img/text_medium.png" class="img-circle" />
						  								<p>
						  									<strong>Texto</strong><br>
						  									<a href="#" class="btnEditContent">Editar</a>
						  								</p>
						  							</div>
					  							</div>
					  							<div class="span12 more">
					  								<a href="#" class="btn btn-success btn-small">Agregar Descripci&oacute;n</a>
					  								<a href="#" class="btn btn-success btn-small">Agregar Material Extra</a>
					  							</div>
				  							</div>	
				  						<?php endif; ?>
				  					</div>
				  				</li>
					  		<?php endforeach; ?>
					  	</ul>
				  	</li>
				<?php endforeach; ?>
			</ul>

			

	    </div>
	</div>
</div><!-- /row -->


<script type="text/javascript">
	var isProcessing = false;
	$(document).ready(function()
	{
		$("#chapters").sortable({
	      placeholder: "ui-state-highlight",
	      cancel: "input,button,select,textarea,option,.cancel",
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
	      cancel: "input,button,select,textarea,option,.cancel",
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
		$("#btnCancelAddChapter").click(function(){
			$("#div-add-title").css("display","block");
	    	$("#add-chapter").css("display","none");
			return false;
		});
		
		$("#btnAddChapter").click(function(){
			var obj = $(this);
			if(isProcessing){
				return;
			}
			isProcessing = true;
			var order = getChapterOrder();
			$.ajax({
					url: "<?=site_url('chapters/create')?>",
					type: "POST",
					data: {'name': $("#input-chapter-name").val(), 'order': order, 'course_id': <?=$course->id?> },
					dataType: "json",
					beforeSend: function() {
						runSpin(obj);
					},
					success: function(data){
						isProcessing = false;
						if(data.message_status == 'success'){
							gritterAdd("Mensaje", data.message_html, data.message_status);
							builtChapterView(data.chapter);
							$("#input-chapter-name").val("");
						}else{
							gritterAdd("Mensaje", data.message_html, data.message_status);
							isProcessing = false;
							showMessageNewChapter(data.message_html);
						}
						
					},
					error: function(data){
						console.log(data);
					},
					complete: function() {
						removeSpin(obj);
					}
			});
			
		});

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

	$(document).on("click", ".chapter-title-edit .control-group .controls .btnCancelEditChapter", function(e) {
	   var cList = $(this).parent().parent().parent().parent();
	   $("#chapter-edit-title").remove();
	   $(".title-chapter",cList).css("display","block");
	   return false;
	});
	$(document).on("click", ".chapter-title-edit .control-group .controls .btnEditChapter", function(e) {
	   if(isProcessing) return;
	   var obj = $(this);
	   var cList = obj.parent().parent().parent().parent();
	   isProcessing  = true;
	   $.ajax({
			url: "<?=site_url('chapters/update')?>",
			type: "POST",
			data: {'id': cList.data('id'), name: $("#input-chapter-edit-name").val(), 'order': cList.data('order'), 'course_id': <?=$course->id?> },
			dataType: "json",
			beforeSend: function() {
				runSpin(obj);
			},
			success: function(data){
				isProcessing = false;
				if(data.message_status == 'success'){
					gritterAdd("Mensaje", data.message_html, data.message_status);
					updateChapterView(cList, data.chapter);
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
				//$.scrollTo(obj,800);
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

	$(document).on("click", ".newLesson li .div-add-lesson", function(e) {
    	$(this).css("display","none");
    	var div = $(this).parent();
    	$(".add-lesson",div).css("display","block");
	});

	function getChapterOrder()
	{
		var last_li = $('#chapters > li:last');
		if(last_li.data("order") != null){
			return parseInt(last_li.data("order")) + 1;
		}
		else
			return 0;
	}

	function builtChapterView(chapter){
		var cList = $('#chapters');
		var li = $('<li/>')
			.attr("data-order",chapter.order)
			.attr("data-id",chapter.id)
			.attr("data-name",chapter.name)
			.attr("id",'item_'+chapter.id)
			.attr("class",'chapter-hidden')
	        .appendTo(cList).fadeIn(1000);
	    var div = $('<div/>')
	    	.addClass("row title-chapter")
	        .attr("data-id",chapter.id)
	        .appendTo(li);
	    var btns_left = $("<div/>")
	    	.attr("class","span6 btns-left")
	    	.html(chapter.name)
	    	.appendTo(div);
	    var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white chapter-edit chapter-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(btns_left);
	    var btns_right = $("<div/>")
	    	.attr("class","span6 btns-right")
	    	.appendTo(div);
	    var i = $("<i/>")
	    	.attr("class","icon-download icon-white chapter-bull-down chapter-bull-down-hidden")
	    	.appendTo(btns_right);
	    var ul = $("<ul/>")
	    	.attr("id","newLesson")
	    	.attr("class","item-list-custom newLesson newLesson-hidden")
	    	.appendTo(li);
	    var li_lesson = $("<li/>")
	    	.appendTo(ul);
	    var title_lesson = $("<div/>")
	    	.attr("class","title-lesson div-add-lesson")
	    	.html("Agregar Tema")
	    	.appendTo(li_lesson);
	    var div_add_lesson = $("<div/>")
	    	.attr("class","title-lesson add-lesson")
	    	.appendTo(li_lesson);
	    var control_group = $("<div/>")
	    	.attr("class","control-group")
	    	.appendTo(div_add_lesson);
	    var control_label = $("<label/>")
	    	.attr("class","control-label")
	    	.attr("for","input-lesson-name")
	    	.text("Agregar Tema")
	    	.appendTo(control_group);
	    var controls = $("<div/>")
	    	.attr("class","controls")
	    	.appendTo(control_group);
	    var input_lesson_name = $("<input/>")
	    	.attr("type","text")
	    	.attr("name","input-lesson-name")
	    	.attr("placeholder","Titulo")
	    	.appendTo(controls);
	    var control_group2 = $("<div/>")
	    	.attr("class","control-group")
	    	.appendTo(div_add_lesson);
	    var controls2 = $("<div/>")
	    	.attr("class","controls")
	    	.appendTo(control_group2);
	    var btn_add_lesson = $("<button/>")
	    	.attr("type","btn")
	    	.attr("class","btn btn-success btnAddLesson")
	    	.text("Guardar")
	    	.appendTo(controls2);
	    var btn_cancel_add_lesson = $("<button/>")
	    	.attr("type","btn")
	    	.attr("class","btn btnCancelAddLesson")
	    	.text("Cancelar")
	    	.appendTo(controls2);
		var ul_list_lesson = $("<ul/>")
			.attr("id",chapter.id)
			.attr("class","item-list-custom lessons lessons-hidden")
			.appendTo(li);

		$.scrollTo(li,800);
		
	}

	function builtChapterEditView(li){
		var cList = li;
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
			.val(cList.data("name"))
			.appendTo(controls);
		var control_group_btns = $("<div/>")
			.attr("class","control-group")
			.appendTo(title_chapter);
		var controls_btns = $("<div/>")
			.attr("class","controls")
			.appendTo(control_group_btns);
		var btn_save = $("<button/>")
			.attr("type","button")
			.attr("class","btn btn-success btnEditChapter")
			.text("Editar")
			.appendTo(controls_btns);
		var btn_cancel = $("<button/>")
			.attr("type","button")
			.attr("class","btn btnCancelEditChapter")
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
		$(".chapter-title-edit", li).remove();
		li.attr("data-order",chapter.order)
			.attr("data-id",chapter.id)
			.attr("data-name",chapter.name)
			.attr("id",'item_'+chapter.id);

		var div = $(".title-chapter",li);
		div.empty();
	        
	    var btns_left = $("<div/>")
	    	.attr("class","span6 btns-left")
	    	.html(chapter.name)
	    	.appendTo(div);
	    var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white chapter-edit chapter-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(btns_left);
	    var btns_right = $("<div/>")
	    	.attr("class","span6 btns-right")
	    	.appendTo(div);
	    var i = $("<i/>")
	    	.attr("class","icon-download icon-white chapter-bull-down chapter-bull-down-hidden")
	    	.appendTo(btns_right);
	    div.css("display","block");
	}


	//for lesson

	$(document).on("click", ".newLesson li .add-lesson .control-group .controls .btnAddLesson", function(e) {
		var obj = $(this);
		if(isProcessing){
			return;
		}
		isProcessing = true;

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
				beforeSend: function() {
					runSpin(obj);
				},
				success: function(data){
					isProcessing = false;
					if(data.message_status == 'success'){
						builtLessonView(data.lesson,chapter_id);
						gritterAdd("Mensaje", data.message_html, data.message_status);
						lesson_name.val("");
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
	});

	$(document).on("click", ".newLesson li .add-lesson .control-group .controls .btnCancelAddLesson", function(e) {
		var div = $(this).parent().parent().parent().parent();
		$(".add-lesson",div).css("display","none");
		$(".div-add-lesson",div).css("display","block");
	});

	$(document).on("mouseover", ".lessons li", function(e) {
	    $(".title-lesson .lesson-edit",this).removeClass("lesson-edit-hidden");
	    $(".title-lesson .lesson-edit",this).fadeIn(500);
	    $(".title-lesson .btns-right .lesson-bull-down",this).removeClass("lesson-bull-down-hidden");
	    $(".title-lesson .btns-right .lesson-bull-down",this).fadeIn(500);
	});
	$(document).on("mouseleave", ".lessons li", function(e) {
	    $(".title-lesson .lesson-edit",this).addClass("lesson-edit-hidden");
	    $(".title-lesson .btns-right .lesson-bull-down",this).addClass("lesson-bull-down-hidden");
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
		var last_li = $('#lessons-'+chapter_id+' > li:last');
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
	    	.addClass("row title-lesson")
	        .attr("data-id",lesson.id)
	        .appendTo(li);
	    var btns_left = $("<div/>")
	    	.attr("class","span6 btns-left")
	    	.html(lesson.name)
	    	.appendTo(div);
	    var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white lesson-edit lesson-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(btns_left);
		var btns_right = $("<div/>")
			.attr("class","btns-right")
			.appendTo(div);
		var a = $("<a/>")
			.attr("href","#")
			.attr("class","btn btn-small btn-success btnAddContent")
			.text("Agregar Contenido")
			.appendTo(btns_right);
		var box_content = $("<div/>")
			.attr("class","row box-content box-content-hidden cancel")
			.appendTo(li);
		$.scrollTo(li,800);
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
		li.attr("data-name",lesson.name);
		var div = $(".title-lesson",li);
		var btns_left = $(".btns-left",div);
		
		btns_left.html(lesson.name);
		var i = $("<i/>")
	    	.attr("class","icon-pencil icon-white lesson-edit lesson-edit-hidden")
	    	.css("margin-left","3px")
	    	.appendTo(btns_left);
	   
	    $(".lesson-title-edit",li).remove();
	    div.css("display","block");
	}

	//for content

	$(document).on("click", ".lessons li .title-lesson .btns-right .btnAddContent", function(e) {
	   var cList = $(this).parent().parent().parent();
	   $(this).fadeOut(200);
	   builtTypeContentView($(".box-content",cList));
	   $(".box-content",cList).fadeIn(500);
	   $.scrollTo($(".box-content",cList),800);
	});
	$(document).on("click", ".lessons li .box-content .box-title div .btnBoxRemove", function(e) {
	   var cList = $(this).parent().parent().parent().parent();
	   $(".box-content",cList).html("").fadeOut(200);
	   $(".title-lesson .btns-right .btnAddContent",cList).fadeIn(500);
	   
	});

	$(document).on("click", ".lessons li .box-content .box .content-type-text", function(e) {
	   var cList = $(this).parent().parent().parent();
	   var box_content = $(".box-content",cList);
	   $.ajax({
			url: "<?=site_url('contents/text_add')?>",
			type: "POST",
			data: {'lesson_id': cList.data('id')},
			success: function(data){
				$(".box-title span",box_content).text("Agregar Texto");
				$(".box",cList).html(data);
			},
			error: function(data){
				console.log(data);
			}
		});
	});

	$(document).on("click", ".lessons li .box-content .box .single-item .span6 p .btnEditContent", function(e) {
	   var cList = $(this).parent().parent().parent().parent().parent().parent();
	   var box_content = $(".box-content",cList);
	   $.scrollTo(cList,800);
	   $.ajax({
			url: "<?=site_url('contents/text_edit')?>",
			type: "POST",
			data: {'lesson_id': cList.data('id')},
			success: function(data){
				$(".title-lesson .btns-right",cList).text("");
				box_content.html(data);
			},
			error: function(data){
				console.log(data);
			}
		});
	});

	$(document).on("click", ".lessons li .box-content .box .content-btns-bottom .btnSaveContentTypeText", function(e) {
	   var form_div = $(this).parent().parent();
	   var editor = $(".wysiwyg-editor",form_div);
	   var lesson_id = editor.attr("id");
	   $.ajax({
			url: "<?=site_url('contents/text_create')?>",
			type: "POST",
			data: {'lesson_id': lesson_id, "text_html": htmlEntities(editor.html())},
			dataType: "json",
			success: function(data){
				if(data.message_status == 'success'){
					//cList.remove();
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

	$(document).on("click", ".lessons li .box-content .box .content-btns-bottom .btnSaveEditContentTypeText", function(e) {
	   var form_div = $(this).parent().parent();
	   var editor = $(".wysiwyg-editor",form_div);
	   var lesson_id = editor.data("lessonid");
	   var id = editor.attr("id");
	   $.ajax({
			url: "<?=site_url('contents/text_update')?>",
			type: "POST",
			data: {'id': id, 'lesson_id': lesson_id, "text_html": htmlEntities(editor.html())},
			dataType: "json",
			success: function(data){
				if(data.message_status == 'success'){
					builtContentTypeText(form_div);
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

	$(document).on("click", ".lessons li .box-content .box .content-btns-bottom .btnCancelEditContentTypeText", function(e) {
	   var form_div = $(this).parent().parent();
	   builtContentTypeText(form_div);
	});

	$(document).on("click", ".lessons li .box-content .box-title div .btnBoxRemoveEditContentTypeText", function(e) {
	   var form_div = $(this).parent().parent().parent();
	   var box = $(".box",form_div);
	   builtContentTypeText(box);
	});

	$(document).on("click", ".lessons li .title-lesson .btns-right .lesson-bull-down", function(e) {
	   var button = this;
	   var cList = $(button).parent().parent().parent();
	   $(".box-content",cList).slideToggle(500, function(){
	  		$(button).toggleClass('icon-upload', $(this).is(':visible')); 	
	   });
	});

	
	function builtTypeContentView(box_content){
		var box_title = $("<div/>")
			.attr("class","box-title")
			.appendTo(box_content);
		var span = $("<span/>")
			.text("Seleccione tipo de contenido")
			.appendTo(box_title);
		var div = $("<div/>")
			.appendTo(box_title);
		var a = $("<a/>")
			.attr("href","#")
			.attr("class","btnBoxRemove")
			.attr("title","Cerrar")
			.appendTo(div);
		var i = $("<i/>")
			.attr("class","icon-remove")
			.appendTo(a);
		var box = $("<div/>")
			.attr("class","span12 box")
			.appendTo(box_content);
		var img_text = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/text.png")
			.attr("class","img-rounded content-type-text")
			.attr("title","Texto")
			.appendTo(box);
		var img_text = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/image.png")
			.attr("class","img-rounded content-type-image")
			.attr("title","Imagen")
			.appendTo(box);
		var img_text = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/audio.png")
			.attr("class","img-rounded content-type-audio")
			.attr("title","Audio")
			.appendTo(box);
		var img_text = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/video.png")
			.attr("class","img-rounded content-type-video")
			.attr("title","Video")
			.appendTo(box);
		var img_text = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/presentation.png")
			.attr("class","img-rounded content-type-presentation")
			.attr("title","Presentación")
			.appendTo(box);
		var img_text = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/pdf.png")
			.attr("class","img-rounded content-type-pdf")
			.attr("title","PDF")
			.appendTo(box);
	}
	
	function builtContentTypeText(box){
		var li = box.parent().parent();
		var box_content = box.parent();
		$(".box-title",box_content).remove();
		box.text("");
		var single_item = $("<div/>")
			.attr("class","span12 single-item")
			.appendTo(box);
		var span6 = $("<div/>")
			.attr("class","span6")
			.appendTo(single_item);
		var img = $("<img/>")
			.attr("src","<?=site_url()?>assets/img/text_medium.png")
			.attr("class","img-circle")
			.appendTo(span6);
		var p = $("<p/>")
			.appendTo(span6);
		var strong = $("<strong/>")
			.text("Texto")
			.appendTo(p);
		var br = $("<br>")
			.appendTo(p);
		var a = $("<a/>")
			.attr("class","btnEditContent")
			.attr("href","#")
			.text("Editar")
			.appendTo(p);
		var more = $("<div/>")
			.attr("class","span12 more")
			.appendTo(single_item);
		var a = $("<a/>")
			.attr("class","btn btn-success btn-small")
			.attr("href","#")
			.text("Agregar Descripción")
			.appendTo(more);
		var a = $("<a/>")
			.attr("class","btn btn-success btn-small")
			.attr("href","#")
			.text("Agregar Material Extra")
			.appendTo(more);

		var btns_right = $(".title-lesson .btns-right",li)
		var i = $("<i/>")
			.attr("class","icon-download icon-white lesson-bull-down lesson-bull-down-hidden")
			.appendTo(btns_right);
	}

	function htmlEntities(str) {
    	return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
	}

	function runSpin(obj){
		obj.addClass("disabled");
		var spin = $("<i/>")
			.attr("class","icon-spinner icon-spin white bigger-130 icon-spinner-custom")
			.appendTo(obj);
	}

	function removeSpin(obj){
		obj.removeClass("disabled");
		obj.find("i").remove();
	}

	function gritterAdd(title, message, type){
		if(type == "success"){
			$.gritter.add({
				title: title,
				text: message,
				class_name: 'gritter-success'
			});
		}
		else if(type == "error"){
			$.gritter.add({
				title: title,
				text: message,
				class_name: 'gritter-error'
			});
		}
	}
</script>
<?php echo $this->load->view("default/_footer_manage"); ?>
