<?php echo $this->load->view("default/_header_landing_home"); ?>
            <div class="row">
              <div class="span8 content-hero-unit">
                  <!-- Main hero unit for a primary marketing message or call to action -->
                    <h1>Mejora tus habilidades.</h1>
                    <h2>FormaNube es la mejor herramienta de e-learning en la web</h2>
                  
              </div>
              <div class="span4">
                  <form action="<?=site_url('signup/register')?>" method="post" name="formsigninfront" id="formsigninfront" class="form-signin">
                    <h2 class="form-signin-heading">Registrate</h2>
                    <?php if(isset($errors)): ?>
                      <div class="alert alert-error">
                        <a class="close" data-dismiss="alert" href="#">×</a>
                            <?=$errors?>
                      </div>    
                    <?php endif; ?>
                    <div class="input-prepend">
                      <input type="email" name="email" class="input-block-level" placeholder="Correo Electrónico" required>
                    </div>
                    <div class="input-prepend">
                      <input type="password" name="password" class="input-block-level" placeholder="Contraseña" required>
                    </div>
                    <div class="input-prepend">
                      <input type="password" name="confirm_password" class="input-block-level" placeholder="Confirmar Contraseña" required>
                    </div>
                    <div class="input-prepends">
                      <button class="btn btn-large btn-primary btn-register" type="submit">Registrate</button>
                    </div>
                  </form>
              </div>
            </div>

          </div> <!-- end div container-->

      </div> <!-- end div row-fluid container-top-->

      <div class="container">
      
        <div class="row bar-search">
              <form action="" method="post" class="form-search-home">
                <div class="input-append">
                    <input class="span10" type="text" placeholder="¿Qué quieres aprender hoy?">
                    <div class="btn-group">
                      <button type="submit" class="btn btn-success span2">Búsqueda</button>
                    
                    </div>
                </div>
              </form>
        </div>
        <div class="row content-thumbnails">
            <ul class="thumbnails">
              <li class="span4">
                <div class="thumbnail">
                  <img src="<?=site_url()?>assets/img/test/course1.jpg" alt="">
                  <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img src="<?=site_url()?>assets/img/test/course2.jpg" alt="">
                  <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img src="<?=site_url()?>assets/img/test/course3.jpg" alt="">
                  <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img src="<?=site_url()?>assets/img/test/course4.jpg" alt="">
                  <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img src="<?=site_url()?>assets/img/test/course5.jpg" alt="">
                  <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img src="<?=site_url()?>assets/img/test/course6.jpg" alt="">
                  <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a href="#" class="btn btn-primary">Action</a> <a href="#" class="btn">Action</a></p>
                  </div>
                </div>
              </li>
            </ul>
        </div>


        <!-- Example row of columns -->
        <div class="row">
          <div class="span4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn" href="#">View details &raquo;</a></p>
          </div>
          <div class="span4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn" href="#">View details &raquo;</a></p>
         </div>
          <div class="span4">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn" href="#">View details &raquo;</a></p>
          </div>
        </div>
<?php echo $this->load->view("default/_footer_landing_home"); ?>

<script type="text/javascript">
$(document).ready(function(){
  $('#formsigninfront').submit(function(){
      runSpin($(".btn-register", $(this)));
  });
});
</script>
    