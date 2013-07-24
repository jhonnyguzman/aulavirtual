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
				<div class="bar bar-success" style="width: 35%;"></div>
  				<div class="bar bar-danger" style="width: 5%;"></div>			
  			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-993083">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-993083">
					</li>
					<li data-slide-to="1" data-target="#carousel-993083" class="active">
					</li>
					<li data-slide-to="2" data-target="#carousel-993083">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="http://lorempixel.com/1600/500/sports/1" />
						<div class="carousel-caption">
							<h4>
								Imagenes Vanguardistas
							</h4>
							<p>
								Impacte con sus imagenes.
							</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="http://lorempixel.com/1600/500/sports/2" />
						<div class="carousel-caption">
							<h4>
								Motivacion Grafica
							</h4>
							<p>
								Aprenda como transmitir emociones a traves de las imagenes.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="http://lorempixel.com/1600/500/sports/3" />
						<div class="carousel-caption">
							<h4>
								Una imagen vale mas que mil palabras
							</h4>
							<p>
								Hacemos real el famoso refran.
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-993083" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-993083" class="right carousel-control">›</a>
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
					<?php echo "Capitulo: " . $chapter->name ; ?>
				</li>
<?php			foreach ($chapter->lesson as $lesson) {
?>				
				<li class="">
					<a href="#"><?=$lesson->name?></a>
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
			<ul class="thumbnails">
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="http://lorempixel.com/600/200/people" />
						<div class="caption">
							<h3>
								Da vida a las personas
							</h3>
							<p>
								Es posbile crear unos efectos de animacion tridimensionales brindando la posibilidad de crear efectos tridimiencionales en cualquier imacenge que querracmos
							</p>
							<p>
								<a class="btn btn-primary" href="#">Aprender</a> 
							</p>
						</div>
					</div>
				</li>
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="http://lorempixel.com/600/200/city" />
						<div class="caption">
							<h3>
								Resaltar Ciudades
							</h3>
							<p>
								Aprende todo sobre como hacer lucir una imagen de una ciudad tan real que las personas que vean tu imagen van a sentirse dentro de ella. 
							</p>
							<p>
								<a class="btn btn-primary" href="#">Aprender</a>
							</p>
						</div>
					</div>
				</li>
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="http://lorempixel.com/600/200/sports" />
						<div class="caption">
							<h3>
								Movimientos
							</h3>
							<p>
								Aprende todo sobre las ultimas tecnicas para resaltar los movimientos de objetos, personas. No pierdas mas el tiempo y comienza a aprender ya.
							</p>
							<p>
								<a class="btn btn-primary" href="#">Aprender</a>
							</p>
						</div>
					</div>
				</li>
			</ul>		
		</div>
	</div>
</div>



<?php echo $this->load->view("default/_footer_manage"); ?>