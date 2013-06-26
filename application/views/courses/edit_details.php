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
				    <ul class="nav-goals"></ul>
				    <input type="text" id="input_goal">
				    <a href="#" class="btn" id="btnAddGoal">Agregar</a>

				    <label>Audiencia:</label>
				    <ul class="nav-audiences"></ul>
				    <input type="text" id="input_audience">
				    <a href="" class="btn" id="btnAddAudience">Agregar</a>
				    
				    <label>Requisitos del Curso:</label>
				    <ul class="nav-requirements"></ul>
				    <input type="text" id="input_requirement">
				    <a href="" class="btn" id="btnAddRequirement">Agregar</a>
				    
				    <label>Nivel de Intrucci&oacute;n:</label>
				    <label class="radio inline">
					  <input type="radio" name="instruction" value="1" checked>
					  Introductorio
					</label>
					<label class="radio inline">
					  <input type="radio" name="instruction" value="2">
					  Intermedio
					</label>
					<label class="radio inline">
					  <input type="radio" name="instruction" value="3">
					  Avanzado
					</label>
					<label class="radio inline">
					  <input type="radio" name="instruction" value="4">
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
			return $(n).attr('id');
		}).get().join(',');
		var audiences = $('.nav-audiences li').map(function(i,n) {
    		return $(n).attr('id');
		}).get().join(',');
		var requirements = $('.nav-requirements li').map(function(i,n) {
    		return $(n).attr('id');
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
			var cList = $('ul.'+ul).addClass('nav nav-tabs nav-stacked');
			var li = $('<li/>')
		        .attr('role', 'goalitem')
		        .appendTo(cList);
		    var a = $('<a/>')
		    	.addClass("items-details")
		        .html("<i class='icon-ok'></i> "+item)
		        .attr("id",item)
		        .appendTo(li);
		}
	}

</script>
<?php echo $this->load->view("default/_footer_manage"); ?>