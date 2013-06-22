<?php echo $this->load->view("cizacl/_header"); ?>
<script type="text/javascript" src="<?php echo site_url('cizacl_js/sessions')?>"></script>
	<h1><?php echo $this->lang->line('sessions_management')?></h1>
	<p align="right">
		<button type="button" onclick="del()" class="cizacl_btn_del"><?php echo $this->lang->line('del')?></button>
	</p>
	<p>&nbsp;</p>
	<table id="sessions_table">
	</table>
	<div id="sessions_navigator"></div>
<?php echo $this->load->view("cizacl/_footer"); ?>
