@echo off
color 0A
mode con:cols=70 lines=8
title aaeeeee
cls
set /A x=120
cls
:1
set /a y=x%%2
echo 
echo  ____________________:      :________________________________________
echo         ,--.       .--.         ,--.                   ,--.
if %y%==0 (
echo        :  oo:  _  :___ \       :ЋЋ:                 :oo  : 
echo  o  o  :  ~~: ^(_^) :    /       : ~~ :  o  o  o  o  o  :~~  :  o  o  o
echo        :/\/\:      '--'        :/\/\:                 :/\/\:
) else (
echo        :oo  :  _  '-._ \       : oo :                 :  oo: 
echo  o  o  :~~  : ^(_^) .-'  /       : ~~ :  o  o  o  o  o  :  ~~:  o  o  o
echo        :\/\/:      '--'        :\/\/:                 :\/\/:
)
echo  ____________________        ________________________________________
echo   WAKA - WAKA - WAKA :      :   €¤Ґв § ЇгбЄ Є ббл. Ћбв «®бм %x% бҐЄ
ping 127.0.0.1 -n 2 > nul
set /A x=x-1
if %x%==0 goto 2
cls
goto 1
:2
exit