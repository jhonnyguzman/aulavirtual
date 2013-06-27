<?php echo $this->load->view("default/_header_manage"); ?>
<div class="row-fluid show-grid">
  <div class="row">
    <div class="page-header">
          <h2><?=$course->title?></h2>
        </div>
  </div>
  <div class="row">
    <div class="span3">
      <?php echo $this->load->view("courses/left_menu"); ?>
    </div>
      <div class="span9">
        <div>
          <div class="page-header">
          <h3>Precio<small> Agrega y/o modifica el precio de tu curso</small></h3>
        </div>
      </div>
        <?php echo $this->load->view("default/_result_messages"); ?>
        <form action="<?=site_url('courses/update_price')?>" method="post" name="updatePrice" id="updatePrice">
            <?php if(isset($errors)): ?>
                    <div class="alert alert-error">
                      <a class="close" data-dismiss="alert" href="#">×</a>
                          <?=$errors?>
                    </div>    
                  <?php endif; ?>
                  <input type="hidden" name="id" value="<?=$course->id?>">
            <label>Precio:</label>
            <input type="number" name="price" min="0" max="9999"  value="<?=$course->price?>">      
            <br><button type="submit" class="btn btn-primary ">Guardar</button>
      </form>
      </div>
  </div>
</div><!-- /row -->

<script type="text/javascript">
$(document).ready(function(){
  $(".select-chosen").chosen();
});
</script>
<?php echo $this->load->view("default/_footer_manage"); ?>