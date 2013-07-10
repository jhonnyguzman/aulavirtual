<!DOCTYPE html>
<html>
  <head>
    <title>FormaNube</title>
    <title><?php echo $this->cizacl->name?>-<?php echo $this->lang->line('version')?><?php echo $this->cizacl->version?></title>
    <?php echo $this->cizacl->css() ?><?php echo $this->cizacl->scripts() ?>
    <link href="<?=site_url()?>assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<?=site_url()?>assets/css/extras.css" rel="stylesheet" media="screen">
    <script src="<?=site_url()?>assets/js/bootstrap.min.js"></script>
  </head>

<body>
  <div id="header">
  	<div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">Admin</a>
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">Profesores</a></li>
                <li><a href="#contact">Organizaciones</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administraci&oacute;n <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="<?=site_url('cizacl/users')?>"><?=$this->lang->line('users')?></a></li>
                    <li><a href="<?=site_url('cizacl/management')?>"><?=$this->lang->line('roles_resources_rules')?></a></li>
                    <li><a href="<?=site_url('cizacl/sessions')?>"><?=$this->lang->line('sessions')?></a></li>
                    <li class="divider"></li>
                    <li><a href="<?=site_url('cizacl')?>"><?=$this->lang->line('summary')?></a></li>
                  </ul>
                </li>
              </ul>
              
              <ul class="nav pull-right">
  	              <li><a href="#">Link</a></li>
  	              <li class="divider-vertical"></li>
                  <?php if($this->session->userdata("logged_in")): ?>
    	              <li class="dropdown">
    	                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?=$this->session->userdata("user_surname")." ".$this->session->userdata("user_name")?><b class="caret"></b></a>
    	                <ul class="dropdown-menu">
    	                	<div class="modal-login">
    		                  <form>
    		                  	  <label><?=$this->session->userdata("user_email")?></label>
            						      <a href="#">Editar Perfil</a><br>
                              <a href="<?=site_url('login/logout')?>"><?=$this->lang->line('logout')?></a>
          				        </form>
      				          </div>
    	                </ul>
    	              </li>
                  <?php else: ?>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Iniciar Sessi&oacute;n <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <div class="modal-login">
                          <form>
                              <label>Correo Electr&oacute;nico:</label>
                              <input class="input-xlarge" type="text" placeholder="Correo Electrónico">
                              <label>Contrase&ntilde;a:</label>
                              <input  class="input-xlarge" type="password" placeholder="Contraseña">
                              <label class="checkbox">
                              <input type="checkbox"> Recordar mis datos
                              </label>
                              <a href="#">¿Olvidaste tu Contrase&ntilde;a?</a>
                              <button type="submit" class="btn btn-success">Iniciar Sessión</button>
                          </form>
                        </div>
                      </ul>
                    </li>
                  <?php endif; ?>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </div>
      </div>
  </div>
  <div id="container">