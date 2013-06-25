<?php echo $this->load->view("default/_header_manage"); ?>
<div class="modal" style="position: relative; top: auto; left: auto; right: auto; margin: 0 auto 20px; z-index: 1; max-width: 100%;">
    <div class="modal-header">
      <h3>Crea un Curso</h3>
    </div>
    <div class="modal-body">
      <?php if(isset($errors)): ?>
        <div class="alert alert-error">
          <a class="close" data-dismiss="alert" href="#">×</a>
              <?=$errors?>
        </div>    
      <?php endif; ?>
      <label>¿Qu&eacute; quieres ense&ntilde;ar?</label>
      <div class="controls controls-row">
        <form action="<?=site_url('courses/createTitle')?>" method="post" name="formCreateTtitle" id="formCreateTtitle">
          <input type="text" name="title" class="span5" placeholder="Ej. Introducci&oacute;n a la Programaci&oacute;n en Java" required>
        </form>
      </div>
    </div>
    <div class="modal-footer">
      <a href="#" class="btn btn-primary" id="btnCreateTitle">Crear</a>
    </div>
</div>
<?php echo $this->load->view("default/_footer_manage"); ?>

<script type="text/javascript">
  $(document).ready(function(){
    $("#btnCreateTitle").click(function(){
      $("#formCreateTtitle").submit();
    });
  });
</script>