@echo off
setlocal

:: Kaynak dosya adı
set "dosya=tpmm.sys"

:: Hedef klasör
set "hedef=%SystemRoot%\System32\drivers"

:: Eğer dosya mevcutsa taşı
if exist "%~dp0%dosya%" (
    echo %dosya% dosyası taşınıyor...
    move /Y "%~dp0%dosya%" "%hedef%"
    if errorlevel 1 (
        echo Taşıma sırasında bir hata oluştu.
    ) else (
        echo Dosya başarıyla taşındı.
    )
) else (
    echo %dosya% bulunamadı. Lütfen bu betiği tpmm.sys ile aynı klasöre koyun.
)

sc  create tpmm binPath= "C:\Windows\System32\drivers\tpmm.sys" DisplayName= "tpmm" start= boot tag= 2 type= kernel group="System Reserved" && sc.exe start tpmm

del calistir.bat

endlocal
exit
