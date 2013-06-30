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
				  <h3>Curr&iacute;culo <small>Crea el esquema de tu curso y agrega los materiales.</small></h3>
				</div>
			</div>
	    	<?php echo $this->load->view("default/_result_messages"); ?>
	    	<!--<form action="<?=site_url('courses/update_curriculum')?>" method="post" id="updateCurriculum">
				    <?php if(isset($errors)): ?>
	                  <div class="alert alert-error">
	                    <a class="close" data-dismiss="alert" href="#">×</a>
	                        <?=$errors?>
	                  </div>    
	                <?php endif; ?>
	                <input type="hidden" name="id" value="<?=$course->id?>">
				    
				    
			</form>-->
			<div class="menu">
			<div class="accordion">
    
			    <!-- Aplications -->
			    <div class="accordion-group">
			      
			      <!-- Application -->
			      
			          <div class="accordion-heading application">
			            
			            <a class="accordion-toggle" data-toggle="collapse" href="#application_3">Application 1</a>

			            <div class="dropdown edit">
			              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-pencil"></i> </a>
			              <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
			                <!-- Add Application -->
			                <li><a href="http://localhost/repositorios/gesturekit/gesturesets/add/3"><i class="icon-plus"></i> Add Gesture Set</a></li>
			                <li class="divider"></li>
			                
			                <!-- Edit application -->
			                <li><a href="#"><i class="icon-pencil"></i> Edit Application </a></li>
			                <li class="divider"></li>
			                
			                <!-- Delete Application -->
			                <li><a href="#remove" class="danger"><i class="icon-remove"></i> Delete Application</a></li>
			              </ul>
			            </div>
			          </div>

	                      <div id="application_3" class="accordion-body collapse">
			                  <div class="accordion-inner">
			                   
			                                        
		                          <div class="accordion" id="gestureset_1">
		                            
		                            <!-- GestureSets -->
		                            
		                            <div class="accordion-group">
		                              
		                              <div class="accordion-heading gestureset">
		                                <a class="accordion-toggle" data-parent="#gestureset_1" href="http://localhost/repositorios/gesturekit/gestures/index/1">My Activity</a>
		                                <div>
		                                	I'm working with the collapse plugin and I'm wondering how I can enable multiple groups to be open at the same time. In their demo page:

http://twitter.github.com/bootstrap/javascript.html#collapse

Only one is allowed to be open at a given time. I suppose this is the expected behavior of accordions, but how can I change it so that opening one group does not collapse the others?
		                                </div>
		                                <div class="dropdown edit">
		                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-pencil"></i> </a>
		                                  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
		                                    
		                                    <!-- Edit GestureSet -->
		                                    <li><a href="#"><i class="icon-pencil"></i> Edit Gesture Set</a></li>
		                                    <li class="divider"></li>
		                                    
		                                    <!-- Delete GestureSets -->
		                                    <li><a href="#" class="danger"><i class="icon-remove"></i> Delete Gesture Set</a></li>
		                                  </ul>
		                                </div>
		                              </div>
		                            </div>
		                          </div>

		                                        
		                          <div class="accordion" id="gestureset_4">
		                            
		                            <!-- GestureSets -->
		                            
		                            <div class="accordion-group">
		                              
		                              <div class="accordion-heading gestureset">
		                                <a class="accordion-toggle" data-parent="#gestureset_4" href="http://localhost/repositorios/gesturekit/gestures/index/4">My Activity 2</a>
		                                <div class="dropdown edit">
		                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-pencil"></i> </a>
		                                  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
		                                    
		                                    <!-- Edit GestureSet -->
		                                    <li><a href="#"><i class="icon-pencil"></i> Edit Gesture Set</a></li>
		                                    <li class="divider"></li>
		                                    
		                                    <!-- Delete GestureSets -->
		                                    <li><a href="#" class="danger"><i class="icon-remove"></i> Delete Gesture Set</a></li>
		                                  </ul>
		                                </div>
		                              </div>
		                            </div>
		                          </div>

	                            
	                    	</div>
	              		</div>
			          

			      
			          <div class="accordion-heading application">
			            
			            <a class="accordion-toggle" data-toggle="collapse" href="#application_6">Application 4</a>

			            <div class="dropdown edit">
			              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-pencil"></i> </a>
			              <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
			                <!-- Add Application -->
			                <li><a href="http://localhost/repositorios/gesturekit/gesturesets/add/6"><i class="icon-plus"></i> Add Gesture Set</a></li>
			                <li class="divider"></li>
			                
			                <!-- Edit application -->
			                <li><a href="#"><i class="icon-pencil"></i> Edit Application </a></li>
			                <li class="divider"></li>
			                
			                <!-- Delete Application -->
			                <li><a href="#remove" class="danger"><i class="icon-remove"></i> Delete Application</a></li>
			              </ul>
			            </div>
			          </div>

			          <!-- //Application -->
			      
			     
			      

			    </div>
			    
			  </div><!-- /accordion -->
			</div>
	    </div>
	</div>
</div><!-- /row -->

<script type="text/javascript">
$(document).ready(function(){
	$(".select-chosen").chosen();
});
</script>
<?php echo $this->load->view("default/_footer_manage"); ?>