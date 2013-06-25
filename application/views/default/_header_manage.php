<!DOCTYPE html>
<html>
  <head>
    <title>FormaNube</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<?=site_url()?>assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<?=site_url()?>assets/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="<?=site_url()?>assets/css/extras.css" rel="stylesheet" media="screen">
    <script src="<?=site_url()?>assets/js/jquery-1.10.1.min.js"></script>
    <script src="<?=site_url()?>assets/js/bootstrap.min.js"></script>
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
          <a class="brand" href="#">FormaNube</a>
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
	              <li><a href="<?=site_url('courses/newTitle')?>" class="btn btn-success btn-create-course">Crear Curso</a></li>
	              <li class="divider-vertical"></li>
	              <?php if($this->session->userdata("logged_in")): ?>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?=$this->session->userdata("user_surname")." ".$this->session->userdata("user_name")?><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <div class="modal-login">
                          <form>
                              <label><?=$this->session->userdata("user_email")?></label>
                              <a href="<?=site_url('profiles')?>">Editar Perfil</a><br>
                              <a href="<?=site_url('login/logout')?>"><?=$this->lang->line('logout')?></a>
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

    <div class="container">