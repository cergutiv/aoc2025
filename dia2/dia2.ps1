#variable para ir haciendo la suma
$suma = 0
#sacar los valores y separarlos de la coma
$valores = (Get-Content .\inputprueba).Split(',')
foreach ($valor in $valores) {
    $ids = ($valor -split ',')
    foreach ($id in $ids) {
        <# $id is the current item #>
        $delimitador = $id.IndexOf("-")
        # valor 1 del rango
        $min = $id.Substring(0, $delimitador)
        # ultimo valor del rango
        $max = $id.Substring($delimitador + 1)
        $min = [int64]$min
        $max = [int64]$max
        #recorremos el rango
        for ($i = $min; $i -le $max; $i++) {
            #convertimos a string
            $string = $i.ToString()
            $longitud = $string.Length
            
        }
    }
        
}