<?php echo $this->load->view("default/_header_manage"); ?>

<!--
<div class="row-fluid show-grid">
	<div class="row">
		<div class="page-header">
          <h2><?=$course_user->course->title?> </h2>
          <?=$course_user->course->subtitle?>
        </div>
	</div>

<div class="leaderboard">  
	<p>Tu progreso: <?=$progress?>%</p>  
	<p>Capitulo Actual: <b><?=$course_user->course->chapter->name?></b></p>
	<p><a class="btn btn-success">Continuar Estudiando</a></p> 
	<br> 
</div>


<div>
<table class="table table-striped">  
        <thead>  
          <tr>  
            <th>Capitulo</th>  
            <th>Tema</th>  
            <th>Descripcion</th>  
            <th>Estado</th>  
          </tr>  
        </thead>  

		<?php   // foreach($course_user as $c_user): ?>
  
        <tbody>  
          <tr>  
            <td><?=$c_user->course->chapter->name?></td>  
            <td><?=$c_user->course->chapter->lesson->name?></td>  
            <td><?=$c_user->course->chapter->lesson->description?></td>  
            <td><?=$c_user->course->chapter->lesson->content_text->text_html?></td>  
          </tr>         
        </tbody>
        

        <?php   // endforeach; ?>
        <?php   // foreach($course_user as $cursos): ?>
        <?php   //      echo $cursos->course->name;           endforeach; ?>
          
          
-->

<!--
  
      </table>  
</div>

<div class="container">  
<row class="span6">  
<ul class="nav nav-list">  
        <li class="nav-header">Curriculo</li>  
        <li class="active"><a href="#"><i class="icon-white icon-home"></i> <?=$course_user->course->chapter->name ?></a></li>  
        	<ul class="nav nav-list">
        		<li><a href="#"><i class="icon-book"></i> <?=$course_user->course->chapter->lesson->name ?></a></li>
        	</ul>        
        <li><a href="#"><i class="icon-pencil"></i> Applications</a></li>  
        <li class="nav-header">Another list header</li>  
        <li><a href="#"><i class="icon-user"></i> Profile</a></li>  
        <li><a href="#"><i class="icon-cog"></i> Settings</a></li>  
        <li class="divider"></li>  
        <li><a href="#"><i class="icon-flag"></i> Help</a></li>  
</ul>  

</div>  
</div>  

-->




<!--     DESDE AQUI ES LA NUEVA LAYOUT  -->


<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span2">

<img src="<?=site_url()?>uploads/course_thumbnails/<?=$course_user->course->course_thumbnail->file_name?>" alt="<?=$course_user->course->title?>">				
				<!--	
					<img alt="140x140" src="http://lorempixel.com/140/140/" />
				-->
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
			<div class="progress">
				<div class="bar">
				</div>
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
			<ul class="nav nav-list">
				<li class="nav-header">
					Capitulo 1
				</li>
				<li class="active">
					<a href="#">Tema</a>
				</li>
				<li>
					<a href="#">Tema</a>
				</li>
				<li>
					<a href="#">Tema</a>
				</li>
				<li class="nav-header">
					Capitulo 2
				</li>
				<li>
					<a href="#">Tema</a>
				</li>
				<li>
					<a href="#">Tema</a>
				</li>
				<li class="divider">
				</li>
				<li>
					<a href="#">Evaluacion Final</a>
				</li>
			</ul>
		</div>
		<div class="span6">
			<h3>
				Preguntas Frecuentes
			</h3>
			<div class="accordion" id="accordion-262248">
				
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-576584">¿Que necesito para instalar Phothoshop?</a>
					</div>
					<div id="accordion-element-576584" class="accordion-body collapse">
						<div class="accordion-inner">
							Una Computadora
						</div>
					</div>
				</div>
				
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-576584">¿Que necesito para instalar Phothoshop?</a>
					</div>
					<div id="accordion-element-576585" class="accordion-body collapse">
						<div class="accordion-inner">
							Una Computadora
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-576584">¿Que necesito para instalar Phothoshop?</a>
					</div>
					<div id="accordion-element-576586" class="accordion-body collapse">
						<div class="accordion-inner">
							Una Computadora
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-576584">¿Que necesito para instalar Phothoshop?</a>
					</div>
					<div id="accordion-element-576587" class="accordion-body collapse">
						<div class="accordion-inner">
							Una Computadora
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-576584">¿Que necesito para instalar Phothoshop?</a>
					</div>
					<div id="accordion-element-576588" class="accordion-body collapse">
						<div class="accordion-inner">
							Una Computadora
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-576584">¿Que necesito para instalar Phothoshop?</a>
					</div>
					<div id="accordion-element-576589" class="accordion-body collapse">
						<div class="accordion-inner">
							Una Computadora
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-262248" href="#accordion-element-141530">¿Puedo hacer gigantografias con Photoshop?</a>
					</div>
					<div id="accordion-element-141530" class="accordion-body in collapse">
						<div class="accordion-inner">
							Si. es posible.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<h3>
				Testimonios
			</h3>
			<blockquote>
				<p>
				Es increible lo que logre aprender con este curso. Realmente siento ahora que puedo mostrar al mundo como veo las cosas con Photoshop.
				</p> <small>Walter E. Juarez Rivas <cite>- Primera propaganda</cite></small>
			</blockquote>
		</div>
	</div>



	<div class="row-fluid">
		<div class="span12">
		    <h3>
				Capitulos Extra - Apendices
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