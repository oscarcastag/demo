/*
put unform '<div class="overlay">' skip

           '<div class="row">' skip
           '<h1> Rockjs Framework' skip
           '<div>' skip
           '<div class="col-md-12 col-sm-12">' skip
           '<div class="consultup-breadcrumb-title">'.
*/
put unform "<table>"
    "<tr><td>Custnum<td>Nombre<td>Direccion<td>Direccion2<td>Ciudad<td>Estado<td>Pais" skip.
for each customer:
    put unform "<tr><td>" custnum "<td> " name "<td> " address "<td> " address2 "<td> " city "<td> " state "<td> " country "</tr>" skip.
end.

put unform "</table></div></div>" skip 
        "</div>" skip
        "</div>".

quit.

