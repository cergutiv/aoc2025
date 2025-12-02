#variable para ir haciendo la suma
$suma = 0
#sacar los valores y separarlos de la coma
$valores = (Get-Content .\input).Split(',')
foreach ($valor in $valores) {
    $ids = ($valor -split ',')
    foreach ($id in $ids) {
        <# $id is the current item #>
        $delimitador = $id.IndexOf("-")
        # valor 1 del rango
        $min = $id.Substring(0, $delimitador)
        # ultimo valor del rango
        $max = $id.Substring($delimitador + 1)
        while ($min -lt $max) {
            #comprobar si tiene valores que se repiten dentro de la string
            ##############################################################################################################################
            # AQUI ES DONDE ME LLEGO                                                                                                     #
            ##############################################################################################################################
            # i=0, mientras $i sea menor a la longitud de $min suma 1 a $i
            

            $min = $min + 1
        }
    }
}
Write-Host "la suma de los valores repetidos es:" $suma