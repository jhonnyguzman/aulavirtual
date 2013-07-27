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
            <div class="input-prepend input-append">
                <select name="money_id" class="span3">
                <?php foreach($moneys as $m): ?>
                  <?php if($m->id == $course->money_id): ?>
                    <option value="<?=$m->id?>" selected><?=$m->name?></option>
                  <?php else: ?>
                    <option value="<?=$m->id?>"><?=$m->name?></option>
                  <?php endif; ?>
                <?php endforeach; ?>
                </select>
                <input name="price" class="span6" id="appendedPrependedInput" type="text" value="<?=$course->price?>">
                <span class="add-on">.00</span>
            </div>    
            <br><br>
            <button type="submit" class="btn btn-primary ">Guardar</button>
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