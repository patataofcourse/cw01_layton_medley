Get-Command java8
if ($? -eq 0) {
    $java = java8
} else {
    $java = java
}

& $java -jar ..\tickompiler.jar c tickflow\ bin\
cp -force tempo/* bin
& $java -jar ..\tickompiler.jar p bin\ base.bin
mv -force C00.bin $Env:APPDATA\Citra\sdmc\rhmm

citra