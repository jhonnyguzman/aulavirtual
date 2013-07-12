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
				  <h3>Detalles <small>Agrega informaci&oacute;n extra sobre el curso</small></h3>
				</div>
			</div>
	    	<?php echo $this->load->view("default/_result_messages"); ?>
	    	<form action="<?=site_url('courses/update_details')?>" method="post" name="updateInfoDetail" id="updateInfoDetail">
				    <?php if(isset($errors)): ?>
	                  <div class="alert alert-error">
	                    <a class="close" data-dismiss="alert" href="#">×</a>
	                        <?=$errors?>
	                  </div>    
	                <?php endif; ?>
	                <input type="hidden" name="id" value="<?=$course->id?>">
	                <input type="hidden" name="goals" id="goals">
	                <input type="hidden" name="audiences" id="audiences">
	                <input type="hidden" name="requirements" id="requirements">
				    <label>Sumario del curso:</label>
				    <textarea name="summary" class="span8" style="height:200px;"><?=$course->summary?></textarea>
				    
				    <label>Metas y Objetivos del curso:</label>
				    <?php if($course_goals_count > 0): ?>
				    	<ul class="nav nav-tabs nav-stacked nav-goals">
						    <?php foreach($course_goals as $cg): ?>
						    	<li><a href="#" data-description="<?=$cg->description?>" data-id="<?=$cg->id?>" class="items-details"><i class='icon-ok'></i> <?=$cg->description?></a></li>
							<?php endforeach; ?>
						</ul>
					<?php else: ?>
				    	<ul class="nav-goals"></ul>
					<?php endif; ?>
				    <input type="text" id="input_goal">
				    <a href="#" class="btn" id="btnAddGoal">Agregar</a>

				    <label>Audiencia:</label>
				    <?php if($course_audiences_count > 0): ?>
				    	<ul class="nav nav-tabs nav-stacked nav-audiences">
						    <?php foreach($course_audiences as $ca): ?>
						    	<li><a href="#" data-description="<?=$ca->description?>" data-id="<?=$ca->id?>" class="items-details"><i class='icon-ok'></i> <?=$ca->description?></a></li>
							<?php endforeach; ?>
						</ul>
					<?php else: ?>
				    	<ul class="nav-audiences"></ul>
					<?php endif; ?>

				    <input type="text" id="input_audience">
				    <a href="" class="btn" id="btnAddAudience">Agregar</a>
				    
				    <label>Requisitos del Curso:</label>
				    <?php if($course_requirements_count > 0): ?>
				    	<ul class="nav nav-tabs nav-stacked nav-requirements">
						    <?php foreach($course_requirements as $cr): ?>
						    	<li><a href="#" data-description="<?=$cr->description?>" data-id="<?=$cr->id?>" class="items-details"><i class='icon-ok'></i> <?=$cr->description?></a></li>
							<?php endforeach; ?>
						</ul>
					<?php else: ?>
				    	<ul class="nav-requirements"></ul>
					<?php endif; ?>

				    <input type="text" id="input_requirement">
				    <a href="" class="btn" id="btnAddRequirement">Agregar</a>
				    
				    <label>Nivel de Intrucci&oacute;n:</label>
					    <label class="radio inline">
						  <input type="radio" name="instruction" value="1" <?php if($course->instruction == 1) echo"checked"?> >
						  Introductorio
						</label>
						<label class="radio inline">
						  <input type="radio" name="instruction" value="2" <?php if($course->instruction == 2) echo"checked"?>>
						  Intermedio
						</label>
						<label class="radio inline">
						  <input type="radio" name="instruction" value="3" <?php if($course->instruction == 3) echo"checked"?>>
						  Avanzado
						</label>
						<label class="radio inline">
						  <input type="radio" name="instruction" value="4" <?php if($course->instruction == 4) echo"checked"?>>
						  Todos los niveles
						</label><br>
				    <button type="submit" class="btn btn-primary">Guardar</button>
			</form>
	    </div>
	</div>
</div><!-- /row -->

<script type="text/javascript">
	$(document).ready(function(){
		$("#btnAddGoal").click(function(){
			addItem("input_goal","nav-goals");
		    return false;
		});
		$("#btnAddAudience").click(function(){
			addItem("input_audience","nav-audiences");
		    return false;
		});
		$("#btnAddRequirement").click(function(){
			addItem("input_requirement","nav-requirements");
		    return false;
		});
		
	});

	$(document).on("submit","#updateInfoDetail",function(){
		var goals = $('.nav-goals li a').map(function(i,n) {
			return $(n).data('description');
		}).get().join(',');
		var audiences = $('.nav-audiences li a').map(function(i,n) {
    		return $(n).data('description');
		}).get().join(',');
		var requirements = $('.nav-requirements li a').map(function(i,n) {
    		return $(n).data('description');
		}).get().join(',');
		$("#goals").val(goals);
		$("#audiences").val(audiences);
		$("#requirements").val(requirements);
		return true;
	});

	$(document).on("mouseover", ".items-details .icon-ok", function(e) {
	    $(this).removeClass("icon-ok");
	    $(this).addClass("icon-trash");
	});
	$(document).on("mouseleave", ".items-details .icon-trash", function(e) {
	    $(this).removeClass("icon-trash");
	    $(this).addClass("icon-ok");
	});
	$(document).on("click", ".items-details .icon-trash", function(e) {
	   var a = $(this).parent();
	   var li = a.parent().remove();
	});

	function addItem(input, ul){
		var item = $("#"+input).val();
		if(item != "")
		{
			var cList = $('ul.'+ul);
			if (!cList.hasClass('nav-stacked')) {
				cList.addClass('nav nav-tabs nav-stacked');
			}
			var li = $('<li/>')
		        .appendTo(cList);
		    var a = $('<a/>')
		    	.addClass("items-details")
		        .html("<i class='icon-ok'></i> "+item)
		        .attr("data-id","")
		        .attr("data-description",item)
		        .appendTo(li);
		}
	}

</script>
<?php echo $this->load->view("default/_footer_manage"); ?>