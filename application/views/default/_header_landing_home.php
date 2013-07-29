<!DOCTYPE html>
<html>
  <head>
    <title>FormaNube</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Bootstrap -->
    <link href="<?=site_url()?>assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<?=site_url()?>assets/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="<?=site_url()?>assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<?=base_url()?>assets/css/jquery-ui-1.10.3.custom.min.css" />
    <!--fonts-->
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace-fonts.css" />

    <!--ace styles-->
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace.min.css" />
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace-responsive.min.css" />
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace-skins.min.css" />

    <link href="<?=site_url()?>assets/css/extras.css" rel="stylesheet" media="screen">
    <script src="<?=site_url()?>assets/js/jquery-1.10.1.min.js"></script>
    <script src="<?=site_url()?>assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="<?=site_url()?>assets/js/bootstrap.min.js"></script>
   
    <script type="text/javascript">
      if("ontouchend" in document) document.write("<script src='<?=base_url()?>assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="<?=base_url()?>assets/js/markdown/markdown.min.js"></script>
    <script src="<?=base_url()?>assets/js/markdown/bootstrap-markdown.min.js"></script>
    <script src="<?=base_url()?>assets/js/jquery.hotkeys.min.js"></script>
    <script src="<?=base_url()?>assets/js/bootstrap-wysiwyg.min.js"></script>
    <script src="<?=base_url()?>assets/js/bootbox.min.js"></script>
    <!--ace scripts-->
    <script src="<?=base_url()?>assets/js/ace-elements.min.js"></script>
    <script src="<?=base_url()?>assets/js/ace.min.js"></script>
    <script src="<?=base_url()?>assets/js/extras.js"></script>
  </head>
  <body>
  	<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner top-bar-home">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="<?=site_url('home')?>">FormaNube</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">Profesores</a></li>
              <li><a href="#contact">Organizaciones</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="<?=site_url('cizacl/users')?>">Action</a></li>
                  <li><a href="<?=site_url('cizacl/management')?>"></a></li>
                  <li><a href="<?=site_url('cizacl/sessions')?>">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            
            <ul class="nav pull-right">
                <?php if(!$this->session->userdata("logged_in")): ?>
                  <li><a href="#">Link</a></li>
                  <li class="divider-vertical"></li>
  	              <li class="dropdown">
  	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Iniciar Sessi&oacute;n <b class="caret"></b></a>
  	                <ul class="dropdown-menu">
  	                	<div class="modal-login">
  		                  <form action="<?=site_url('signin/login')?>" method="post" name="formlogin">
  		                  	  <label>Correo Electr&oacute;nico:</label>
      				              <input name="email" class="input-xlarge" type="text" placeholder="Correo Electrónico">
      				              <label>Contrase&ntilde;a:</label>
      				              <input name="password" class="input-xlarge" type="password" placeholder="Contraseña">
      				              <label class="checkbox">
      						            <input type="checkbox"> Recordar mis datos
      						          </label>
      						          <a href="#">¿Olvidaste tu Contrase&ntilde;a?</a>
      				              <button type="submit" class="btn btn-success">Iniciar Sessión</button>
  				              </form>
  				            </div>
  	                </ul>
  	              </li>
                <?php else: ?>
                  <li><a href="<?=site_url('courses/newTitle')?>" class="btn btn-success btn-small btn-create-course">Crear Curso</a></li>
                  <li class="divider-vertical"></li>
                  <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<?=$this->session->userdata("user_avatar")?>" class="img-circle img-user-avatar"/></a>
                        <ul class="dropdown-menu  dropdown-menu-user-perfil">
                          <li>
                            <a href="<?=site_url('courses/my_courses')?>">Mis cursos</a>
                          </li>
                          <li>
                            <a href="<?=site_url('courses/my_courses')?>">Cursos creados por mi</a>
                          </li>
                          <li>
                            <a href="<?=site_url('courses/my_courses')?>">Crear Curso</a>
                          </li>
                          <li>
                            <a href="<?=site_url('courses/my_courses')?>">Monedero</a>
                          </li>
                          <li class="divider"></li>
                          <li>
                            <a href="<?=site_url('profiles')?>">Editar Cuenta</a>
                          </li>
                          <li>
                            <a href="<?=site_url('login/logout')?>"><?=$this->lang->line('logout')?></a>
                          </li>
                        </ul>
                    </li>
                <?php endif; ?>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="row-fluid container-top">
        <div class="container">