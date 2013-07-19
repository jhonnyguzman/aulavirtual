<?php echo $this->load->view("default/_header_manage"); ?>


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
		<?php foreach($course_user as $c_user): ?>
        <tbody>  
          <tr>  
            <td><?=$c_user->course->chapter->name?></td>  
            <td><?=$c_user->course->chapter->lesson->name?></td>  
            <td><?=$c_user->course->chapter->lesson->description?></td>  
            <td><?=$c_user->course->chapter->lesson->content_text->text_html?></td>  
          </tr>         
        </tbody>
        <?php endforeach; ?>

        <?php foreach($chapters as $chapter): ?>
        
          <tr>  
            <td><?=$chapter->name?></td>  
            <td><?=$chapter->lesson->name?></td>  
            <td><?=$chapter->lesson->description?></td>  
            <td><?=$chapter->lesson->content_text->text_html?></td>  
          </tr>         
       
        <?php endforeach; ?>
  
      </table>  
</div>
<?php echo $this->load->view("default/_footer_manage"); ?>