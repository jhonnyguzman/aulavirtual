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
			<div id="message_result"></div>
			<ul id="newChapter" class="item-list newChapter">
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

			<ul id="chapters" class="item-list">
				<?php foreach($course->chapter->order_by("order",'asc')->get() as $chapter): ?>
					<li data-order="<?=$chapter->order?>" data-id="<?=$chapter->id?>" data-name="<?=$chapter->name?>" id="item_<?=$chapter->id?>">
				  		<div class="title-chapter"><?=$chapter->name?> <i class="icon-pencil icon-white chapter-edit chapter-edit-hidden"></i></div>
				  	</li>
				<?php endforeach; ?>
			  <!--<li class="item-blue" data-order="1">
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
			  <li class="item-orange"  data-order="2">
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
			  <li class="item-pink" data-order="3">
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
			  <li class="item-green" data-order="4">
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
			  <li>Item 5</li>-->
			</ul>

	    </div>
	</div>
</div><!-- /row -->

<script type="text/javascript">
	$(document).ready(function(){
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
	});
	
	$(document).on("mouseover", "#chapters li", function(e) {
	    $(".title-chapter .chapter-edit",this).removeClass("chapter-edit-hidden");
	    $(".title-chapter .chapter-edit",this).fadeIn(500);
	});
	$(document).on("mouseleave", "#chapters li", function(e) {
	    $(".title-chapter .chapter-edit",this).addClass("chapter-edit-hidden");
	});
	$(document).on("click", "#chapters li .title-chapter .chapter-edit", function(e) {
	   builtChapterEditView($(this).parent().parent());
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

	function showMessageNewChapter(data){
		$("#message_result").html(data);
	    $("#message_result > .alert").fadeIn(500, function() {
	        $(this).delay(2000).fadeOut(500);
	    }); 
	}

	function builtChapterView(chapter){
		var cList = $('#chapters');
		/*if (!cList.hasClass('nav-stacked')) {
			cList.addClass('nav nav-tabs nav-stacked');
		}*/
		var li = $('<li/>')
			.attr("data-order",chapter.order)
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
</script>
<?php echo $this->load->view("default/_footer_manage"); ?>
