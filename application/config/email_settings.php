<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/* Config main account email*/

$config['email_from'] = "turnvy@gmail.com";
$config['email_from_name'] = "FormaNube Signup";

/* Config email messages to register new user */

$config['email_subject_register_new_user'] = "FormaNube Signup";
$config['email_header1_msg_register_new_user'] = "<h2>Register in FormaNube</h2> ";
$config['email_header2_msg_register_new_user'] = "<h3>Dear ";
/*$config['email_body1_msg_register_new_user'] = "<p>Gracias por registrarte en iturno.com! Haz click en el siguiente enlace para confirmar tu registro:<p>";
$config['email_body2_msg_register_new_user'] = "<p> Recomendamos el uso de Firefox o Google Chrome.
												Por cualquier consulta puedes enviarnos un mail a turnvy@gmail.com 
												</p><br><br><p>Se fel&iacute;z!<br>El equipo de iTurno. </p>";*/

$config['email_body3_msg_register_new_user'] = "Welcome to FormaNube! Please click on the following link to confirm your account:<br><br>";
$config['email_body4_msg_register_new_user'] = "Best regards,<br>";
$config['email_body5_msg_register_new_user'] = "Team FormaNube";
$config['text_notification_register_user'] = "We sent an email notification to confirm the registration. Please see it.";



/* Config flash messages for user registration*/

$config['user_register_confirm']= "Your registration was successful!!";
$config['user_register_error']= "Your have failed to register. No record found for that activation code";

$config['user_register_confirm_teacher']= "Tu registro se ha efectuado satisfactoriamente.";

?>