<?php echo $this->load->view("default/_header_manage"); ?>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span2">
					<img src="<?=site_url()?>uploads/course_thumbnails/<?=$course_user->course->course_thumbnail->file_name?>" alt="<?=$course_user->course->title?>">				
				</div>
				<div class="span6">
					<h3 class="text-left">
						<?=$course_user->course->title?>
					</h3>
					<p>
						<?=$course_user->course->subtitle?>
					</p>
				</div>
				<div class="span4">
				</div>
			</div>
			<div class="progress progress-striped">
				<div class="bar bar-success" <?php echo "style=\"width: ". $progress ."%;\"";?> >
					<?php echo "Progreso: " . $progress ."%"; ?>
				</div>

  				<div class="bar bar-danger" <?php echo "style=\"width: ". $error_evaluation ."%;\"";?> >
  				<?php echo "Errores: ". $error_evaluation . "%"; ?>
  				</div>			
  			</div>
		</div>
	</div>
	
<div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-993083">
				<div class="carousel-inner">
					
					<?php   foreach($course_user as $c_user){
					foreach ($c_user->course->course_slider as $slider) {	
					?>

					<div class="item">					
                        <img src="<?=site_url()?>uploads/course_sliders/<?=$slider->file_name?>" alt="<?=$course_user->course->title?>">
						<div class="carousel-caption">
							<h4>
								<?=$slider->title?>
							</h4>
							<p>
								<?=$slider->subtitle?>
							</p>
						</div>
					</div>
					<?php }} ?>

				</div> 


				<a data-slide="prev" href="#carousel-993083" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-993083" class="right carousel-control">›</a>
			</div>
		</div>
	</div>


	<div class="row-fluid">
		<div class="span6">
			<h3>
				Curriculo
			</h3>
<?php   foreach($course_user as $c_user){
			foreach ($c_user->course->chapter as $chapter) {	
?>
			<ul class="nav nav-list">
				<li class="nav-header">
					<?php 
					$num = $chapter->order + 1; 
					echo "Capitulo " . $num . ": " . $chapter->name ; ?>
				</li>
<?php			foreach ($chapter->lesson as $lesson) {
?>				
				<li class="">
					<a href="#"><?php 
					$num_lesson = $lesson->order + 1;
					echo "Tema " . $num . ".". $num_lesson .": ". $lesson->name;
					?>
					</a>
				</li>
<?php 
				}
?>				
   			</ul>
<?php 	}             	
            } 
?>
<!--
				<li>
					<a href="#">Evaluacion Final</a>
				</li>
-->				
		</div>
		<div class="span6">
			<h3>
				Preguntas Frecuentes
			</h3>



<div class="accordion" id="accordion2">  
<?php   foreach($course_user as $c_user){	
		    foreach ($c_user->course->course_faq as $faq) {
?>
<div class="accordion-group">
  	<div class="accordion-heading">
  	 	<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" <?php echo "href=\"#". $faq->id ."\""; ?>>
<?php      echo "Pregunta: " . $faq->question ;  ?>
        </a>
    </div>

    <div <?php echo "id=\"". $faq->id ."\""; ?> class="accordion-body collapse in">
      <div class="accordion-inner">
<?php       echo "Respuesta: " . $faq->answer ;  ?>
      </div>
    </div> 
    </div> 
<?php		    
		    }
		} 
?>


</div>
</div></div>

	<div class="row-fluid">
		<div class="span12">
			<h3>
				Testimonios
			</h3>
			<blockquote>
				<p>
				<?php  echo $course_user->course->course_testimony->testimony;  ?>
				
				</p> <small><?php  echo $course_user->course->course_testimony->user->name . " " . $course_user->course->course_testimony->user->surname;  ?></small>
			</blockquote>
		</div>
	</div>



	<div class="row-fluid">
		<div class="span12">
		    <h3>
				Capitulos Sobresalientes
			</h3>
<?php   
	foreach($course_user->course->chapter as $chapter){
			//foreach ($c_user->course->chapter as $chapter) {
			?>
			<ul class="thumbnails">
				<li class="span4">

<?php				if($chapter->special == 1) {	 ?>
					<div class="thumbnail">
						<img alt="300x200" src="http://lorempixel.com/600/200/people" />
						<div class="caption">
							<h3>
								<?php  echo $chapter->name;  ?>
							</h3>
							<p>
								<?php  echo $chapter->description;  ?>
							</p>
							<p>
								<a class="btn btn-primary" href="#">Aprender</a> 
							</p>
						</div>
					</div>						
				</li>		
<?php   
				}
?>					
			</ul>	

			<?php
			 }
		
?>				
</div>
	</div>
	</div>
</div>



<?php echo $this->load->view("default/_footer_manage"); ?>