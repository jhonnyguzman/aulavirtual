<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
  <div class="span3">
    <?php echo $this->load->view("profile/left_menu"); ?>
  </div>
    <div class="span9">
      <div class="page-header">
      <h3>Password <small>Modifica tu password</small></h3>
    </div>
      <?php echo $this->load->view("default/_result_messages"); ?>

      <form action="<?=site_url('profiles/edit_preferences')?>" method="post" name="editPreferences" id="editPreferences" enctype="multipart/form-data">
          <?php if(isset($errors)): ?>
                  <div class="alert alert-error">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                        <?=$errors?>
                  </div>    
                <?php endif; ?>
          <label>Nueva contraseña</label>
          <input type="text" name="preferences">
          <!--
          <input type="hidden" name="user_id" value="<?=$this->session->userdata("user_id");?>">
          -->
          <br>
          <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
    </div>
</div><!-- /row -->
<?php echo $this->load->view("default/_footer_manage"); ?>