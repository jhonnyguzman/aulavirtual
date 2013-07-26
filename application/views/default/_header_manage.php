<!DOCTYPE html>
<html>
  <head>
    <title>FormaNube</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<?=site_url()?>assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<?=site_url()?>assets/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="<?=site_url()?>assets/css/font-awesome.min.css" />
    <link href="<?=site_url()?>assets/css/chosen/chosen.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="<?=base_url()?>assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="<?=base_url()?>assets/css/jquery.gritter.css" />
    <!--fonts-->
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace-fonts.css" />

    <!--ace styles-->
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace.min.css" />
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace-responsive.min.css" />
    <link rel="stylesheet" href="<?=base_url()?>assets/css/ace-skins.min.css" />

    <link rel="stylesheet" href="<?=base_url()?>assets/css/upload/jquery.fileupload-ui.css">

    <link href="<?=site_url()?>assets/css/extras.css" rel="stylesheet" media="screen">
    <script src="<?=site_url()?>assets/js/jquery-1.10.1.min.js"></script>
    <script src="<?=site_url()?>assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="<?=site_url()?>assets/js/bootstrap.min.js"></script>
    <script src="<?=site_url()?>assets/js/chosen/chosen.jquery.js"></script>

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
    <script src="<?=base_url()?>assets/js/jquery.gritter.min.js"></script>
    <script src="<?=base_url()?>assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="<?=site_url()?>assets/js/jplayer/jwplayer.js"></script>
    <script src="<?=site_url()?>assets/js/jplayer/jwplayer.html5.js"></script>
    <script src="<?=base_url()?>assets/js/extras.js"></script>

  </head>
  <body>
  	<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
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
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            
            <ul class="nav pull-right">
	              <li><a href="<?=site_url('courses/course_new')?>" class="btn btn-small btn-success btn-create-course">Crear Curso</a></li>
	              <li class="divider-vertical"></li>
	              <?php if($this->session->userdata("logged_in")): ?>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<?=$this->session->userdata("user_avatar")?>" class="img-circle img-user-avatar"/></a>
                      
                      <ul class="dropdown-menu">
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

    <div class="container">