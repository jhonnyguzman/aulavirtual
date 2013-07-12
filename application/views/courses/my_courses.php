<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
	<div class="row">
		<div class="page-header">
          <h2>Cursos Ofrecidos</h2>
        </div>
	</div>
	<div class="row">
		<div class="span12">
			<div class="row content-thumbnails">
			  <ul class="thumbnails">
			  <?php foreach($courses as $course): ?>
		            <li class="span4">
		              <div class="thumbnail">
		                <img src="<?=site_url()?>uploads/course_thumbnails/<?=$course->course_thumbnail->file_name?>" alt="<?=$course->title?>">
		                <div class="caption">
		                  <h3><?=$course->title?></h3>
		                  <p><?=$course->subtitle?></p>
		                  <p>
		                  	<div class="row">
		                  		<div class="span6">
		                  			<strong>Precio: $ </strong> <?=$course->price?>
		                  		</div>
		                  		<div class="span6 btns-list-my-courses">
		                  			<a href="<?=site_url('courses/course-manage/'.$course->id)?>" class="btn btn-primary">Configurar</a> 
		                  		</div>
		                  	</div>
		                  </p>
		                </div>
		              </div>
		            </li>
	          <?php endforeach; ?>
	          </ul>
	      	</div>
		</div>
	</div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_manage"); ?>