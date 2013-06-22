<?php $this->load->view('default/_header_public'); ?> 
<div class="row-fluid show-grid">
	<div class="span2"></div>
    <div class="span8">
	  <?php if($status == 1): ?>
		<div class="alert alert-success">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <p><?=$status_description?>&nbsp;</p>
		  <a href="<?=base_url()?>signup/login">Login</a>
		</div>
	  <?php else:  ?>
	  	<div class="alert alert-error">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <?=$status_description?>
		</div>
	  <?php endif; ?>
	 </div>
	 <div class="span2"></div>
</div>
<?php $this->load->view('default/_footer_public'); ?>