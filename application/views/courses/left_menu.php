<ul class="nav nav-list">
    <li class="nav-header">Contenido del Curso</li>
    <li class="active"><a href="<?=site_url('courses/course-edit-curriculum/'.$course->id)?>">Contenidos</a></li>
    <li class="nav-header">Informaci&oacute;n del Curso</li>
    <li><a href="<?=site_url('courses/course-edit-basics/'.$course->id)?>">Informaci&oacute;n b&aacute;sica</a></li>
    <li><a href="<?=site_url('courses/course-edit-details/'.$course->id)?>">Detalles</a></li>
    <li><a href="<?=site_url('courses/course-edit-image/'.$course->id)?>">Im&aacute;gen</a></li>
    <li><a href="#">Video de promoci&oacute;n</a></li>
    <li class="nav-header">Configuraci&oacute;n del Curso</li>
    <li><a href="#">Privacidad</a></li>
    <li><a href="<?=site_url('courses/course-edit-price/'.$course->id)?>">Precio</a></li>
    <li><a href="#">Deshabilitar Curso</a></li>
    <li class="divider"></li>
    <li><a href="#">Ayuda</a></li>
</ul>