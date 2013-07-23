// function to show data's pagination
function setPagination(pag,loader)
{	 
	 $("#" + pag + " a").click(function(e){
    	// stop normal link click
    	e.preventDefault();
    	$('#'+loader).load($(this).attr("href"));
  	 });
}

// function to show data's pagination
function setPaginationTwo(pag,p_url, p_div_loader, p_form)
{    
     $("#"+ pag + " a").click(function(e)
     {
        // stop normal link click
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr("href"),
            data: $('#'+p_form).serialize(),
            success: function(data) {
                    $('#'+p_div_loader).html(data);
            }
        });  
     });        
}

// function to show data's pagination
function setPaginationModal(pag, loader, p_data)
{    
     $("#"+ pag + " a").click(function(e)
     {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr("href"),
            data: p_data,
            success: function(data) {
                    $('#'+loader).html(data);
            }
        }) ; 
     });
}

function deleteRow(url)
{
	if(confirm("¿Estás seguro de eliminar este item?")){
		window.open(url,'_top');
	}

}

function deleteItemModal(url, div)
{
    if(confirm("¿Estás seguro de eliminar este item?")){
        $.get(url, function(data){
            $('#'+div).html(data);
        });
    }

}

function searchData(form,loader)
{    
	$("#"+form).submit(function() 
    {
   	  $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),	
        success: function(data) {
        		$("#"+loader).html(data);
        }
    	});        
      return false;
    });	  
}


function updateContent(url,div)
{
    $.get(url, function(data){
        $('#'+div).html(data);
    });
}


// function to send form through ajax
function submitData(idform,loader_div)
{    
    $("#"+idform).submit(function() 
    {
     $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        success: function(data) {
               $("#"+loader_div).html(data);
        }
        });

    return false;
    }); 
}

// function to send form through ajax
function submitDataTwo(idform,loader_div)
{    
    
     $.ajax({
        type: 'POST',
        url: $("#"+idform).attr('action'),
        data: $("#"+idform).serialize(),
        success: function(data) {
               $("#"+loader_div).html(data);
        }
    });        
    
}


function getLocalidades(url, loc_selected)
{
    var options = '';
    var url_f = url + $("#departamento_id").val()
    $.getJSON(url_f, function(data) {
        $("#localidad_id").find("option").remove();
        if(data != 'none'){
            $.each(data, function(key, val) {
                if(loc_selected){
                    if(loc_selected == val.id){
                        options = options + "<option value='"+val.id+"' selected>"+ val.nombre +"</option>";
                    }else{
                        options = options + "<option value='"+val.id+"'>"+ val.nombre +"</option>";
                    }
                }else{
                    options = options + "<option value='"+val.id+"'>"+ val.nombre +"</option>";
                }
            });
            $("#localidad_id").append(options);
            $("#localidad_id").trigger("liszt:updated");
        }
    });
}

function getMeses(url, mes_selected, select1, select2)
{
    var options = '';
    var url_f = url + $("#"+select1).val()
    $.getJSON(url_f, function(data) {
        $("#"+select2).find("option").remove();
        if(data != 'none'){
            options = options + "<option value='' >Todos</option>";
            $.each(data, function(key, val) {
                if(mes_selected){
                    if(mes_selected == val.id){
                        options = options + "<option value='"+val.id+"' selected>"+ val.mes_descripcion +"</option>";
                    }else{
                        options = options + "<option value='"+val.id+"'>"+ val.mes_descripcion +"</option>";
                    }
                }else{
                    options = options + "<option value='"+val.id+"'>"+ val.mes_descripcion +"</option>";
                }
            });
            $("#"+select2).append(options);
        }
    });
}


function getMesesConsultas(url, mes_selected, select1, select2, select3)
{
    var options = '';
    if($("#"+select1).val() != '')
    {
        var url_f = url + $("#"+select1).val();
        
        $.getJSON(url_f, function(data) {
            $("#"+select2).find("option").remove();
            if(select3)
                $("#"+select3).find("option").remove();
            
            if(data != 'none'){
                $.each(data, function(key, val) {
                    if(mes_selected){
                        if(mes_selected == val.id){
                            options = options + "<option value='"+val.anio+'-'+val.mes+"' selected>"+ val.mes_descripcion +"</option>";
                        }else{
                            options = options + "<option value='"+val.anio+'-'+val.mes+"'>"+ val.mes_descripcion +"</option>";
                        }
                    }else{
                        options = options + "<option value='"+val.anio+'-'+val.mes+"'>"+ val.mes_descripcion +"</option>";
                    }
                });
                $("#"+select2).append(options);
                if(select3)
                    $("#"+select3).append(options);
            }
        });
    }

}


function getFuentesRubros(url, fuente_rubro_selected, select1, select2)
{
    var options = '';
    var url_f = url + $("#"+select1).val()
    $.getJSON(url_f, function(data) {
        $("#"+select2).find("option").remove();
        if(data != 'none'){
            $.each(data, function(key, val) {
                if(fuente_rubro_selected){
                    if(fuente_rubro_selected == val.id){
                        options = options + "<option value='"+val.id+"' selected>"+ val.fuente_nombre +"</option>";
                    }else{
                        options = options + "<option value='"+val.id+"'>"+ val.fuente_nombre +"</option>";
                    }
                }else{
                    options = options + "<option value='"+val.id+"'>"+ val.fuente_nombre +"</option>";
                }
            });
            $("#"+select2).append(options);
        }
    });
}

function getGestureSets(url, gestureset_selected, select1, select2)
{
    var options = '';
    var url_f = url + $("#"+select1).val()
    $.getJSON(url_f, function(data) {
        $("#"+select2).find("option").remove();
        if(data != 'none'){
            $.each(data, function(key, val) {
                if(gestureset_selected){
                    if(gestureset_selected == val.id){
                        options = options + "<option value='"+val._id+"' selected>"+ val.name +"</option>";
                    }else{
                        options = options + "<option value='"+val._id+"'>"+ val.name +"</option>";
                    }
                }else{
                    options = options + "<option value='"+val._id+"'>"+ val.name +"</option>";
                }
            });
            $("#"+select2).append(options);
        }
    });
}

function loadModal(url,div)
{
    $('div#'+div).load(url,function(){
        $(this).modal({
            keyboard:false,
            backdrop:false
        });
    }).modal('show'); 
}

function loadVideoPreview(url,obj,video_url)
{
    $.ajax({
        type: 'POST',
        url: url,
        data: {videourl: video_url},  
        success: function(data) {
            obj.html(data).modal('show');
        }
    }); 
}


function showContentTabMenu(url, div)
{
    $("#"+div).load(url + $("#perfiles_id").val());
}

function showContentTabLineaAccion(url, div)
{
    $("#"+div).load(url + $("#escuela_id").val());
}

function asignMenu(url)
{
    document.location.href =url + $("#perfiles_id").val();
}

function checkExisteHoras(base_url,linea_accion_escuela_id)
{
      $.ajax({
        url: base_url + "lineas_accion_docentes_controller/checkHorasDisponibles_c/" + linea_accion_escuela_id,
        dataType:'json',
        success:function(data)
        {
            if(data == 1) submitDataTwo('formAddlineas_accion_docentes','contentModal');
            else getHorasSobrantes(base_url);
        },
        error:function(data)
        {
            alert('Sorry an error has ocurred. Please try again later.');
            return false;
        }
    });
}

function getHorasSobrantes(base_url)
{
    $.ajax({
        url: base_url + "fondo_comun_controller/searchJson_c",
        dataType:'json',
        success:function(data)
        {
            if(data != 0){
                var lista = "<div class=\"wrapperStep3\"><h5>Seleccione el Origen de las horas sobrantes</h5>";
                var i = 1;
                var check = "";
                 $.each(data, function(key, val) {
                    if(i == 1) check = "checked";
                    lista+="<label class=\"radio\"><input type=\"radio\" name=\"fondo_comun_id\" value=\"" + val.id +"\" "+check+"> Escuela: " + val.escuela_nombre + " | " + val.periodo_fecha_inicio + " - " + val.periodo_fecha_fin + " | Horas: <span class=\"label label-important\">" + val.horas_sin_usar_restantes +"</span></label>";
                    check = "";
                    i+=1;
                 });

                lista+= "<p class=\"stdformbutton\"><input type=\"button\" class=\"btn\" id=\"actBack\" value=\"Atras\"/><input type=\"submit\" class=\"btn\" id=\"actFinalizar\" value=\"Finalizar\" onClick=\"submitData('formAddlineas_accion_docentes','contentModal');\"/></p></div>";
                $("#step1").hide(500);
                $("#step2").show(500);
                $("#step3 > .wrapperStep3").remove();
                $("#step3").append(lista);
            }else if(data == 0){
                alert("No existen horas disponibles para asignar");
            }
   
        },
        error:function(data)
        {
            alert('Sorry an error has ocurred. Please try again later.');
        }
    });

}


function calcSubtotal()
{
    var costo = $("#costo").val();
    var cantidad = $("#cantidad").val();
    var subtotal;
    if(costo != '' && cantidad != '')
        subtotal = costo*cantidad;
    else 
        subtotal = 0;
    return Math.round (subtotal*100) / 100;
}

function calcTotal()
{
    var total=0;
    $(".subtotal").each(function(i,v){
        if($(v).val() != '') total = parseFloat(total) + parseFloat($(v).val());
    });
    $("#monto").val(Math.round (total*100) / 100);
    
}

function removeLinea(e,num_linea)
{
    var total = $("#monto").val();
    var lineaSubtotal = $("#subtotal-"+num_linea).val();
    $("#monto").val(total - lineaSubtotal);
    $(e).closest('tr').remove();
}


function base64_encode (data) {
  // http://kevin.vanzonneveld.net
  // +   original by: Tyler Akins (http://rumkin.com)
  // +   improved by: Bayron Guevara
  // +   improved by: Thunder.m
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   bugfixed by: Pellentesque Malesuada
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   improved by: Rafał Kukawski (http://kukawski.pl)
  // *     example 1: base64_encode('Kevin van Zonneveld');
  // *     returns 1: 'S2V2aW4gdmFuIFpvbm5ldmVsZA=='
  // mozilla has this native
  // - but breaks in 2.0.0.12!
  //if (typeof this.window['btoa'] == 'function') {
  //    return btoa(data);
  //}
  var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,
    ac = 0,
    enc = "",
    tmp_arr = [];

  if (!data) {
    return data;
  }

  do { // pack three octets into four hexets
    o1 = data.charCodeAt(i++);
    o2 = data.charCodeAt(i++);
    o3 = data.charCodeAt(i++);

    bits = o1 << 16 | o2 << 8 | o3;

    h1 = bits >> 18 & 0x3f;
    h2 = bits >> 12 & 0x3f;
    h3 = bits >> 6 & 0x3f;
    h4 = bits & 0x3f;

    // use hexets to index into b64, and append result to encoded string
    tmp_arr[ac++] = b64.charAt(h1) + b64.charAt(h2) + b64.charAt(h3) + b64.charAt(h4);
  } while (i < data.length);

  enc = tmp_arr.join('');

  var r = data.length % 3;

  return (r ? enc.slice(0, r - 3) : enc) + '==='.slice(r || 3);

}


function base64_decode (data) {
  // http://kevin.vanzonneveld.net
  // +   original by: Tyler Akins (http://rumkin.com)
  // +   improved by: Thunder.m
  // +      input by: Aman Gupta
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   bugfixed by: Onno Marsman
  // +   bugfixed by: Pellentesque Malesuada
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +      input by: Brett Zamir (http://brett-zamir.me)
  // +   bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // *     example 1: base64_decode('S2V2aW4gdmFuIFpvbm5ldmVsZA==');
  // *     returns 1: 'Kevin van Zonneveld'
  // mozilla has this native
  // - but breaks in 2.0.0.12!
  //if (typeof this.window['atob'] == 'function') {
  //    return atob(data);
  //}
  var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,
    ac = 0,
    dec = "",
    tmp_arr = [];

  if (!data) {
    return data;
  }

  data += '';

  do { // unpack four hexets into three octets using index points in b64
    h1 = b64.indexOf(data.charAt(i++));
    h2 = b64.indexOf(data.charAt(i++));
    h3 = b64.indexOf(data.charAt(i++));
    h4 = b64.indexOf(data.charAt(i++));

    bits = h1 << 18 | h2 << 12 | h3 << 6 | h4;

    o1 = bits >> 16 & 0xff;
    o2 = bits >> 8 & 0xff;
    o3 = bits & 0xff;

    if (h3 == 64) {
      tmp_arr[ac++] = String.fromCharCode(o1);
    } else if (h4 == 64) {
      tmp_arr[ac++] = String.fromCharCode(o1, o2);
    } else {
      tmp_arr[ac++] = String.fromCharCode(o1, o2, o3);
    }
  } while (i < data.length);

  dec = tmp_arr.join('');

  return dec;
}


