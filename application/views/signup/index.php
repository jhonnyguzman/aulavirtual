<?php echo $this->load->view("default/_header_public"); ?>
<div class="row-fluid show-grid">
	<div class="span2"></div>
    <div class="span8">
    	<form action="<?=site_url('signup/register')?>" method="post" name="signupform" id="signupform">
			  <fieldset>
			    <legend>Registro</legend>
			    <?php if(isset($errors)): ?>
                  <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                        <?=$errors?>
                  </div>    
                <?php endif; ?>
			    <label>Correo Electr&oacute;nico:</label>
			    <input type="email" name="email" required>
			    <label>Contrase&ntilde;a:</label>
			    <input type="password" name="password" required>
			    <label>Confirmar Contrase&ntilde;a:</label>
			    <input type="password" name="confirm_password" required><br>
			    <button type="submit" class="btn btn-primary">Registrarse</button>
			  </fieldset>
		</form>
    </div>
    <div class="span2"></div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_public"); ?>