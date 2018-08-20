SETLOCAL ENABLEDELAYEDEXPANSION

echo **************************************CD=%CD%

for /R %%j in (*.docx) do (set aFile=%%~nj)	

echo FILE2 "%aFile%">>"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"

cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"

			