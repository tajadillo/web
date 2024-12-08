
@echo off
REM ##############################################################
REM # Tabla de valores para los pagos en seminarios culturales
REM # Autor: Richard A. Tajadillo Pérez
REM # Copyright (C) 2024
REM # LICENCIA GNU GPL 3.0
REM ##############################################################

REM Variables de colores (no nativas en batch, aquí quedan como referencia)
set greenColour=
set endColour=
set redColour=
set blueColour=
set yellowColour=
set purpleColour=
set turquoiseColour=
set grayColour=

REM Obtener la hora actual para definir el saludo
for /f "tokens=1-3 delims=:" %%a in ("%time%") do set hora_actual=%%a

REM Saludo basado en la hora actual
if %hora_actual% geq 5 if %hora_actual% lss 12 (
    set saludo=¡Buenos días %usuario%!
) else if %hora_actual% geq 12 if %hora_actual% lss 20 (
    set saludo=¡Buenas tardes %usuario%!
) else (
    set saludo=¡Buenas noches %usuario%!
)

REM Inicio del script
cls
echo.
echo hola
echo.
timeout /t 2 >nul

set /p usuario=¿Cuál es tu nombre?

timeout /t 2 >nul
cls
timeout /t 2 >nul
cls

REM Obtener la fecha actual en formato "Día, dd de Mes de Año"
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set dia_semana=%%a
    set mes=%%b
    set dia=%%c
    set ano=%%d
)
set fecha=%dia_semana% %dia% de %mes% del %ano%

echo.
echo %fecha%
echo.

REM Mostrar el saludo
echo %saludo%

echo.
echo Correcto %usuario%.
echo Vamos a calcular cuál es la edad que tienes.
timeout /t 6 >nul
cls
echo COMENCEMOS!!! %usuario%

REM Calcular la edad
set /p ano_nacimiento=Introduce tu año de nacimiento:
set /p mes_nacimiento=Introduce tu mes de nacimiento:
set /p dia_nacimiento=Introduce tu día de nacimiento:

REM Calcular edad en años
set /a edad=%ano% - %ano_nacimiento%

REM Ajustar la edad en base al mes y día actuales
if %mes% LSS %mes_nacimiento% (
    set /a edad=%edad%-1
) else if %mes% EQU %mes_nacimiento% if %dia% LSS %dia_nacimiento% (
    set /a edad=%edad%-1
)

echo Tienes %edad% años, %usuario%.
pause
