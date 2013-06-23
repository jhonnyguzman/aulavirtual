<?php echo $this->load->view("default/_header_public"); ?>
<div class="row-fluid show-grid">
	<div class="span2"></div>
    <div class="span8">
    	<form action="<?=site_url('signin/login')?>" method="post" name="signinform" id="signinform">
			  <fieldset>
			    <legend>Acceso</legend>
			    <?php if(isset($errors)): ?>
                  <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                        <?=$errors?>
                  </div>    
                <?php endif; ?>
			    <label>Correo Electr&oacute;nico:</label>
	            <input name="email" class="input-xlarge" type="text" placeholder="Correo Electrónico" >
	            <label>Contrase&ntilde;a:</label>
	            <input name="password" class="input-xlarge" type="password" placeholder="Contraseña" >
	            <label class="checkbox">
			        <input type="checkbox"> Recordar mis datos
			    </label>
			    <a href="#">¿Olvidaste tu Contrase&ntilde;a?</a>
	            <button type="submit" class="btn btn-success">Iniciar Sessión</button>
			  </fieldset>
		</form>
    </div>
    <div class="span2"></div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_public"); ?>