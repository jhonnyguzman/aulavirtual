<?php echo $this->load->view("cizacl/_header"); ?>
<script type="text/javascript" src="<?php echo site_url('cizacl_js/users')?>"></script>
	<h1><?php echo $this->lang->line('users_management')?></h1>
	<p align="right">
		<button type="button" onclick="view();" class="cizacl_btn_view"><?php echo $this->lang->line('view')?></button>
		&nbsp;
		<button type="button" onclick="add();" class="cizacl_btn_add"><?php echo $this->lang->line('add')?></button>
		&nbsp;
		<button type="button" onclick="edit();" class="cizacl_btn_edit"><?php echo $this->lang->line('edit')?></button>
		&nbsp;
		<button type="button" onclick="del();" class="cizacl_btn_del"><?php echo $this->lang->line('del')?></button>
	</p>
	<p>&nbsp;</p>
	<table id="users_table" class="jqgrid">
	</table>
	<div id="users_navigator"></div>
<?php echo $this->load->view("cizacl/_footer"); ?>
