# los numeros van de izquierda a derecha
# a la izquierda restan y a la derecha suman
# se sabe la direccion segun el prefijo L o R; por ejemplo R5 al valor inicial 50 le daria el valor 55
# el numero inicial es 50
$valor = 50
# si restamos a 0 el valor pasa a ser 99 y el valor pasa de 99 pasa a 0
# la contraseña es el numero de veces que el candado vale 0, lo voy a llamar $vueltas
$vueltas = 0
#if($valor -eq 0){ $click++}
# por cada linea del input, hacer estas operaciones
Get-Content '.\input' | ForEach-Object {
    $valorAntes = $valor
    $vueltasAntes = $vueltas
    # Saco los numeros de la string de esta manera porque siempre va a ser la misma estructura
    $numeroString = $_ -replace '\D'
    # hay que ver si el valor de $resta es mayor que 99
    # habia pensado en sacar los 2 ultimos valores de $resta y a partir de ahi a la izquierda es un numero que sumar a $vueltas
    if ($numeroString.Length -ge 3) {
        # aprovecho y saco el valor porque ya no me importa y asi me ahorro una variable
        $numeroString = $numeroString.Substring(($numeroString.Length - 2))
    }
    # ahora hay que ver si es izquierda o derecha
    # la izquierda resta
    if ($_ -match "L") {
        # si la resta da un numero negativo sumarle 99 y una vuelta
        if (($valor - $numeroString) -le -1) {
            $valor = $valor + 100
            $valor = $valor - $numeroString
        }
        else {
            $valor = $valor - $numeroString
        }
    }
    # la derecha suma
    elseif ($_ -match "R") {
        # si suma un numero que da mas de 100 y una vuelta
        if (($valor + $numeroString) -ge 100) {
            $valor = $valor - 100
            $valor = $valor + $numeroString
        }
        else {
            $valor = $valor + $numeroString
        }
    }
    if ($valor -eq 0) {
        $vueltas++
    }
    Write-Host "modifico" $valorAntes "por" $valor
    if ($vueltasAntes -ne $vueltas) {
        Write-Host "ya van" $vueltas "vueltas"
    }
}

Write-host "da" $vueltas "vueltas"
