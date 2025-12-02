#variable para ir haciendo la suma
$suma = 0
#sacar los valores y separarlos de la coma
$valores = (Get-Content .\input).Split(',')
foreach ($valor in $valores) {
    $ids = ($valor -split ',')
    foreach ($id in $ids) {
        Write-Host $suma
        <# $id is the current item #>
        $delimitador = $id.IndexOf("-")
        # valor 1 del rango
        $min = $id.Substring(0, $delimitador)
        # ultimo valor del rango
        $max = $id.Substring($delimitador + 1)
        $min = [int64]$min
        $max = [int64]$max
        while ($min -lt $max) {
            $min = [string]$min
            $array = @{}
            foreach ($char in $min.ToCharArray()) {
                if ($array.ContainsKey($char)) {
                    $array[$char]++
                }
                else {
                    $array[$char] = 1
                }
            }
            if (($array.Values | Where-Object { $_ -gt 1 } | Measure-Object | Select-Object -ExpandProperty Count) -gt 0) {
                $suma = $suma + $min
            }
            $min = [Int64]$min + 1
        }
    }
        
}
Write-Host "la suma de los valores repetidos es:" $suma