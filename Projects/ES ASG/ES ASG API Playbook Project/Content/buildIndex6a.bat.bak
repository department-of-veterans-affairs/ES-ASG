rem This is located in a separate batch fail, mainly because it wouldn't work correctly when combined with buildIndex6.bat

SETLOCAL ENABLEDELAYEDEXPANSION

for %%j in (*.docx) do (set "aFile1=%%~nj" & set "aFile2=https://github.com/department-of-veterans-affairs/ES-ASG/wiki/!aFile1: =-!")

if NOT "%aFile1%"=="" (

echo "<li><a href='%aFile2%' target='_blank'>%aFile1%</a>">>"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"

call "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\dopandoc"

)
			