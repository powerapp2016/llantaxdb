$PBExportHeader$w_standar.srw
forward
global type w_standar from window
end type
type pb_buscar from picturebutton within w_standar
end type
type pb_pdf from picturebutton within w_standar
end type
type pb_imprimir from picturebutton within w_standar
end type
type pb_excel from picturebutton within w_standar
end type
type pb_salir from picturebutton within w_standar
end type
type dw_datos from datawindow within w_standar
end type
type pb_nuevo from picturebutton within w_standar
end type
type pb_ultimo from picturebutton within w_standar
end type
type pb_seguir from picturebutton within w_standar
end type
type pb_atras from picturebutton within w_standar
end type
type pb_primero from picturebutton within w_standar
end type
type st_modulo from statictext within w_standar
end type
type st_empresa from statictext within w_standar
end type
type p_logo from picture within w_standar
end type
type gb_1 from groupbox within w_standar
end type
type gb_2 from groupbox within w_standar
end type
type pb_modificar from picturebutton within w_standar
end type
type pb_eliminar from picturebutton within w_standar
end type
end forward

global type w_standar from window
integer width = 3351
integer height = 1856
boolean titlebar = true
string title = "Ventana Principal "
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 32833535
string icon = "D:\PowerApp\imagenes\icono_llantax2.ico"
boolean palettewindow = true
boolean center = true
windowanimationstyle openanimation = centeranimation!
pb_buscar pb_buscar
pb_pdf pb_pdf
pb_imprimir pb_imprimir
pb_excel pb_excel
pb_salir pb_salir
dw_datos dw_datos
pb_nuevo pb_nuevo
pb_ultimo pb_ultimo
pb_seguir pb_seguir
pb_atras pb_atras
pb_primero pb_primero
st_modulo st_modulo
st_empresa st_empresa
p_logo p_logo
gb_1 gb_1
gb_2 gb_2
pb_modificar pb_modificar
pb_eliminar pb_eliminar
end type
global w_standar w_standar

type variables
string is_ruta , is_accion , is_ventana   , is_actividad, is_detlog 

integer ii_error, ii_estado = 0;

st_accesos  st_accesos_usr 
end variables

forward prototypes
public subroutine wf_iconos_botones ()
public subroutine wf_activa_botones (string boton)
public subroutine wf_accesos (string ps_opcion)
public subroutine wf_permisos ()
public subroutine wf_guardar ()
public subroutine wf_modificar ()
public subroutine wf_eliminar ()
end prototypes

public subroutine wf_iconos_botones ();string ls_logo 

select rutaimagen  into :is_ruta from dbaparametro  using sqlca;

select logo  into :ls_logo  from dbaempresa   where empresaId = :gs_empresa using sqlca;

pb_primero.picturename   = is_ruta +"primero.jpg"
pb_primero.disabledname = is_ruta + "primeroi.jpg"
pb_primero.width  = 170
pb_primero.height  = 120

pb_ultimo.picturename   = is_ruta+"ultimo.jpg"
pb_ultimo.disabledname = is_ruta+"ultimoI.jpg"
pb_ultimo.width  = 170
pb_ultimo.height  = 120

pb_seguir.picturename   = is_ruta+"siguiente.jpg"
pb_seguir.disabledname = is_ruta+"siguienteI.jpg"
pb_seguir.width  = 170
pb_seguir.height  = 120

pb_atras.picturename  = is_ruta+"anterior.jpg"
pb_atras.disabledname= is_ruta+"anteriorI.jpg"
pb_atras.width  = 170
pb_atras.height  = 120

pb_excel.picturename  = is_ruta+"excel.jpg"
pb_excel.disabledname= is_ruta+"excelI.jpg"
pb_excel.width  = 240
pb_excel.height  = 120

pb_pdf.picturename  = is_ruta+"pdf.jpg"
pb_pdf.disabledname= is_ruta+"pdfI.jpg"
pb_pdf.width  = 240
pb_pdf.height  = 120

pb_imprimir.picturename  = is_ruta+"imprimir.jpg"
pb_imprimir.disabledname= is_ruta+"imprimirI.jpg"
pb_imprimir.width  = 240
pb_imprimir.height  = 120

pb_buscar.picturename  = is_ruta+"zoommax.jpg"
pb_buscar.disabledname= is_ruta+"zoommaxI.jpg"
pb_buscar.width  = 240
pb_buscar.height  = 120

pb_nuevo.picturename 		= is_ruta+"nuevo2.jpg"
pb_nuevo.disabledname 		= is_ruta+"nuevo2I.jpg"
pb_nuevo.width = 352
pb_nuevo.height= 120
pb_nuevo.text        		    = "Nuevo"

pb_modificar.picturename 	= is_ruta+"modificar2.jpg"
pb_modificar.disabledname 	= is_ruta+"modificar2I.jpg"
pb_modificar.width = 352
pb_modificar.height= 120
pb_modificar.text        		    = "Modificar"

pb_eliminar.picturename 	= is_ruta+"eliminar2.jpg"
pb_eliminar.disabledname 	= is_ruta+"eliminar2I.jpg"
pb_eliminar.width = 352
pb_eliminar.height= 120
pb_eliminar.text        		    = "Eliminar"

pb_salir.picturename 		= is_ruta+"salir2.jpg"
pb_salir.disabledname	= is_ruta+"salir2I.jpg"
pb_salir.width = 352
pb_salir.height= 120
pb_salir.text        		    = "Salir"


p_logo.picturename = ls_logo 

p_logo.width =242
p_logo.height= 188

st_empresa.text = uf_nombre_empresa(gs_empresa)
st_modulo.text =  uf_nombre_modulo(gs_modulo)

end subroutine

public subroutine wf_activa_botones (string boton);integer li_error =0
choose case  boton
	case   "Nuevo"
		 pb_primero.enabled = false
		 pb_seguir.enabled = false
		 pb_atras.enabled = false
 		 pb_ultimo.enabled = false
		 pb_modificar.enabled = false
		 pb_eliminar.enabled = false
        
		  pb_nuevo.text = "Grabar"
		  pb_nuevo.picturename = is_ruta+ "guardar2.jpg"
		  pb_salir.text = "Cancelar"
  		  pb_salir.picturename = is_ruta+ "cancelar2.jpg"
		  is_accion="Nuevo"
		 
	case   "Modificar"
		 pb_primero.enabled = false
		 pb_seguir.enabled = false
		 pb_atras.enabled = false
  		 pb_ultimo.enabled = false

   	  	 pb_nuevo.enabled = false
		 pb_eliminar.enabled = false
			
		  pb_modificar.text = "Grabar"
		  pb_salir.text = "Cancelar"
		  
	      pb_modificar.picturename = is_ruta+ "guardar2.jpg"
  		  pb_salir.picturename = is_ruta+ "cancelar2.jpg"
		  is_accion="Modificar"
		 


		  
 	case   "Eliminar"
		 pb_primero.enabled = false
		 pb_seguir.enabled = false
		 pb_atras.enabled = false
  		 pb_ultimo.enabled = false

		
		
		 pb_modificar.enabled = false
		 pb_nuevo.enabled = false
			 
 		  pb_eliminar.text = "Grabar"
		  pb_salir.text = "Cancelar"
		  pb_eliminar.picturename = is_ruta+ "guardar2.jpg"
  		  pb_salir.picturename = is_ruta+ "cancelar2.jpg"
		  is_accion="Eliminar"
		 


 	case   "Grabar"
		Choose case is_accion
				case "Nuevo"
					  wf_guardar( )
				case "Modificar"
					  wf_modificar( )
				case "Eliminar"
					  wf_eliminar( )
		End choose
		
		if ii_estado = -1 then 
			 return 
		end if 
		
		 pb_primero.enabled = true
		 pb_seguir.enabled = true
		 pb_atras.enabled = true
  		 pb_ultimo.enabled = true 

		
		 pb_nuevo.enabled = true
		 pb_modificar.enabled = true
 		 pb_eliminar.enabled = true
		 wf_iconos_botones()
      	 wf_permisos()
	     dw_datos.enabled = false
		  
		  
		 
  	case   "Cancelar"
		 pb_primero.enabled = true
		 pb_seguir.enabled = true
		 pb_atras.enabled = true
  		 pb_ultimo.enabled = true 

		 pb_nuevo.enabled = true
		 pb_modificar.enabled = true
 		 pb_eliminar.enabled = true
		 pb_salir.enabled = true 
 	     dw_datos.enabled = false 
		wf_iconos_botones( )
			
	 
end choose 
end subroutine

public subroutine wf_accesos (string ps_opcion);
//select adicionar,modificar,eliminar,consultar,imprimir,excel,pdf,estado from dbaacceso, ls_estado 
string ls_adicionar , ls_modificar, ls_consultar,ls_imprimir, ls_excel, ls_pdf, ls_eliminar, ls_estado 

select adicionar, modificar,eliminar,consultar,imprimir,excel,pdf,estado 
into :ls_adicionar , :ls_modificar, :ls_eliminar, :ls_consultar, :ls_imprimir, :ls_excel, :ls_pdf, :ls_estado from dbaacceso
where empresaid = :gs_empresa and 
          usuarioid   = :gs_usuario and 
			 moduloid = :gs_modulo and 
			 opcionid =:ps_opcion 
using sqlca;
if ls_adicionar ="S" then
     st_accesos_usr.adicionar = true
else
	st_accesos_usr.adicionar = false
end if 

if ls_modificar ="S" then
     st_accesos_usr.modificar = true
else
	st_accesos_usr.modificar = false
end if 

if ls_eliminar ="S" then
     st_accesos_usr.eliminar = true
else
	st_accesos_usr.eliminar = false
end if 

if ls_consultar ="S" then
     st_accesos_usr.consultar = true
else
	st_accesos_usr.consultar= false
end if 

if ls_imprimir ="S" then
     st_accesos_usr.imprimir = true
else
	st_accesos_usr.imprimir = false
end if 

if ls_excel ="S" then
     st_accesos_usr.excel = true
else
	st_accesos_usr.excel = false
end if 

if ls_pdf ="S" then
     st_accesos_usr.pdf = true
else
	st_accesos_usr.pdf = false
end if 

if ls_estado ="A" then
     st_accesos_usr.estado = true
else
	st_accesos_usr.estado = false
end if 




end subroutine

public subroutine wf_permisos ();if gs_usuario = "ADMIN" then 
	pb_nuevo.enabled     = true
	pb_modificar.enabled = true
	pb_eliminar.enabled   = true 
    pb_pdf.enabled   = true 
	pb_excel.enabled   = true 
     pb_imprimir.enabled   = true 
  	pb_buscar.enabled   = true 

else
	if st_accesos_usr.estado =true then 
	    pb_nuevo.enabled      = st_accesos_usr.adicionar
   		pb_modificar.enabled = st_accesos_usr.modificar
	    pb_eliminar.enabled   = st_accesos_usr.eliminar
		pb_pdf.enabled         = st_accesos_usr.pdf
         pb_excel.enabled      = st_accesos_usr.excel
         pb_imprimir.enabled  = st_accesos_usr.imprimir
      	pb_buscar.enabled    = st_accesos_usr.consultar
		 
	else
  		pb_nuevo.enabled     = false
		pb_modificar.enabled = false
		pb_eliminar.enabled   = false 
	    pb_pdf.enabled          = false
	    pb_excel.enabled       = false
        pb_imprimir.enabled   = false
        pb_buscar.enabled   = false

		
	end if 
end if 

end subroutine

public subroutine wf_guardar ();
end subroutine

public subroutine wf_modificar ();long ll_guardar 

ll_guardar = dw_datos.update()
if ll_guardar < 0  then 
	messagebox("Error", "Error Al Guardar,  Verifique Datos")
	rollback using sqlca;
	ii_estado = -1;

else 
	commit  using sqlca ;
	ii_estado = 0;
	is_accion = " ";
	
end if 

end subroutine

public subroutine wf_eliminar ();
end subroutine

on w_standar.create
this.pb_buscar=create pb_buscar
this.pb_pdf=create pb_pdf
this.pb_imprimir=create pb_imprimir
this.pb_excel=create pb_excel
this.pb_salir=create pb_salir
this.dw_datos=create dw_datos
this.pb_nuevo=create pb_nuevo
this.pb_ultimo=create pb_ultimo
this.pb_seguir=create pb_seguir
this.pb_atras=create pb_atras
this.pb_primero=create pb_primero
this.st_modulo=create st_modulo
this.st_empresa=create st_empresa
this.p_logo=create p_logo
this.gb_1=create gb_1
this.gb_2=create gb_2
this.pb_modificar=create pb_modificar
this.pb_eliminar=create pb_eliminar
this.Control[]={this.pb_buscar,&
this.pb_pdf,&
this.pb_imprimir,&
this.pb_excel,&
this.pb_salir,&
this.dw_datos,&
this.pb_nuevo,&
this.pb_ultimo,&
this.pb_seguir,&
this.pb_atras,&
this.pb_primero,&
this.st_modulo,&
this.st_empresa,&
this.p_logo,&
this.gb_1,&
this.gb_2,&
this.pb_modificar,&
this.pb_eliminar}
end on

on w_standar.destroy
destroy(this.pb_buscar)
destroy(this.pb_pdf)
destroy(this.pb_imprimir)
destroy(this.pb_excel)
destroy(this.pb_salir)
destroy(this.dw_datos)
destroy(this.pb_nuevo)
destroy(this.pb_ultimo)
destroy(this.pb_seguir)
destroy(this.pb_atras)
destroy(this.pb_primero)
destroy(this.st_modulo)
destroy(this.st_empresa)
destroy(this.p_logo)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.pb_modificar)
destroy(this.pb_eliminar)
end on

event open;uf_centrar_ventana(this)
wf_iconos_botones()
wf_accesos( upper(this.classname()))
wf_permisos()
is_ventana = upper(this.classname())

//this.title= this.title +   " [" +  lower(is_ventana)+"]"

dw_datos.enabled = false 
dw_datos.settransobject(sqlca)

this.title=this.title +"    [" +  lower(this.classname())+"]"

is_actividad = "Entro"
is_detlog    = "Entro A   : "+ upper((this.title))

if uf_logactivo()="S" then 
		uf_cargarlog(gs_empresa,gs_modulo,is_ventana, gs_usuario, uf_fecha_server(), is_actividad,is_detlog,"" )
end if 







end event

event key;Choose Case key
		
	   Case keyf2!
			choose case is_accion 
				case "Nuevo"
		                 pb_nuevo.triggerevent( clicked!)
							  
  				case "Modificar"
		                 pb_modificar.triggerevent( clicked!)

  				case "Eliminar"
		                 pb_eliminar.triggerevent( clicked!)

			end choose 
			
//----Boton que me permite crear un nuevo registro-----------//
		Case keyf5!
			if pb_nuevo.enabled = true  then
                   pb_nuevo.triggerevent( clicked!)			
   		end if

//----Boton que me permite Modificar  un registro------------//
		Case keyf6! 

        	if pb_modificar.enabled = true  then
			  pb_modificar.triggerevent( clicked!)			
          end if	
			 
//----Boton que me permite Eliminar registro----------------//			 
		Case keyf7!

        	if pb_eliminar.enabled = true   then
			  pb_eliminar.triggerevent( clicked!)			
  		   end if
 
			  
//----Botones que  permiten abanzar, retroceder ,ir al primero ó ultimo registro--------//			  

case  KeyP! 
	 if pb_primero.enabled = true  then 
    	  	  pb_primero.triggerevent( clicked!)			
	end if 
case  KeyS! 
		if pb_seguir.enabled = true  then 
			pb_seguir.triggerevent( clicked!)				
		end if 
case  KeyU! 
	if pb_ultimo.enabled = true then 
		pb_ultimo.triggerevent( clicked!)				
	end if 
case  KeyR! 
	if pb_atras.enabled = true then 
	   pb_atras.triggerevent( clicked!)			
	end if 
End choose



end event

event close;is_actividad = "Salió"
is_detlog    = "Salió De   : "+upper((this.title))
if uf_logactivo()="S" then 
		uf_cargarlog(gs_empresa,gs_modulo,is_ventana, gs_usuario, uf_fecha_server(), is_actividad,is_detlog,"" )
end if 


end event

type pb_buscar from picturebutton within w_standar
integer x = 1723
integer y = 1536
integer width = 242
integer height = 120
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\imagenes\zoommax.png"
string disabledname = "C:\PowerApp\imagenes\Salir2I.jpg"
alignment htextalign = right!
end type

type pb_pdf from picturebutton within w_standar
integer x = 1499
integer y = 1536
integer width = 242
integer height = 120
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\imagenes\PDF.jpg"
string disabledname = "C:\PowerApp\imagenes\Salir2I.jpg"
alignment htextalign = right!
end type

type pb_imprimir from picturebutton within w_standar
integer x = 1243
integer y = 1536
integer width = 242
integer height = 120
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\imagenes\Imprimir.jpg"
string disabledname = "C:\PowerApp\imagenes\Salir2I.jpg"
alignment htextalign = right!
end type

type pb_excel from picturebutton within w_standar
integer x = 987
integer y = 1532
integer width = 242
integer height = 120
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\imagenes\excel.jpg"
string disabledname = "C:\PowerApp\imagenes\Salir2I.jpg"
alignment htextalign = right!
end type

type pb_salir from picturebutton within w_standar
integer x = 1966
integer y = 1336
integer width = 352
integer height = 120
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Salir"
boolean cancel = true
string picturename = "C:\PowerApp\imagenes\Salir2.jpg"
string disabledname = "C:\PowerApp\imagenes\Salir2I.jpg"
alignment htextalign = right!
end type

type dw_datos from datawindow within w_standar
event ue_keypress pbm_dwnkey
integer x = 827
integer y = 408
integer width = 2062
integer height = 768
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_keypress;
/*Choose case key
		case (keyf5!) 
			 parent.event KEY(key,0)		
		case (keyf6!)
			 parent.event KEY(key,0)		
		case (keyf7!)
			 parent.event KEY(key,0)		
		case (keyf2!)
			 parent.event KEY(key,0)		
			
	End choose  */


parent.event KEY(key,0)		
If keydown(keyuparrow!) or keydown(keyenter!) or keydown(keydownarrow!)  then
	Return 1
End If
end event

event itemchanged;//dw_datos.scrolltorow( dw_datos.rowcount())
end event

event dberror;return 1
end event

type pb_nuevo from picturebutton within w_standar
integer x = 887
integer y = 1336
integer width = 352
integer height = 120
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Nuevo"
boolean default = true
string picturename = "C:\PowerApp\imagenes\Nuevo 2.png"
alignment htextalign = right!
end type

event clicked;//wf_activa_botones( this.text)

end event

type pb_ultimo from picturebutton within w_standar
integer x = 590
integer y = 1324
integer width = 169
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\Imágenes del sistema simples\Ultimo.jpg"
alignment htextalign = left!
end type

event clicked;dw_datos.scrolltorow( dw_datos.rowcount())
end event

type pb_seguir from picturebutton within w_standar
integer x = 421
integer y = 1324
integer width = 169
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\Imágenes del sistema simples\Siguiente.png"
alignment htextalign = left!
end type

event clicked;dw_datos.scrollnextrow( )
end event

type pb_atras from picturebutton within w_standar
integer x = 251
integer y = 1324
integer width = 169
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\Imágenes del sistema simples\anterior.png"
alignment htextalign = left!
end type

event clicked;dw_datos.scrollpriorrow( )
end event

type pb_primero from picturebutton within w_standar
integer x = 87
integer y = 1324
integer width = 169
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "C:\PowerApp\Imágenes del sistema simples\Primero.jpg"
alignment htextalign = left!
end type

event clicked;dw_datos.scrolltorow( 0)
end event

type st_modulo from statictext within w_standar
integer x = 421
integer y = 112
integer width = 1266
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 16777215
string text = "none"
boolean focusrectangle = false
end type

type st_empresa from statictext within w_standar
integer x = 421
integer y = 28
integer width = 1266
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 16777215
string text = "none"
boolean focusrectangle = false
end type

type p_logo from picture within w_standar
integer x = 18
integer y = 32
integer width = 361
integer height = 236
string picturename = "D:\PowerApp\imagenes\Logo_llantax.JPG"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_standar
integer x = 64
integer y = 1276
integer width = 731
integer height = 204
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31909087
end type

type gb_2 from groupbox within w_standar
integer x = 859
integer y = 1276
integer width = 1481
integer height = 216
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31909087
end type

type pb_modificar from picturebutton within w_standar
integer x = 1239
integer y = 1336
integer width = 352
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Modificar"
string picturename = "C:\PowerApp\imagenes\Modificar 2.png"
alignment htextalign = right!
end type

event clicked;//wf_activa_botones( this.text)
end event

type pb_eliminar from picturebutton within w_standar
integer x = 1591
integer y = 1336
integer width = 352
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Eliminar"
string picturename = "C:\PowerApp\imagenes\Eliminar 2.jpg"
alignment htextalign = right!
end type

event clicked;//wf_activa_botones( this.text)
end event

