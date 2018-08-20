SETLOCAL ENABLEDELAYEDEXPANSION

cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"

set aRootWiki="https://github.com/department-of-veterans-affairs/ES-ASG/wiki/"


echo "<h3>Last Generated: [%date%, %time%]</h3>">TOC.txt
echo "<ul>">>TOC.txt

for /R %%i in (.) do (

	if "%%i"=="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\." (echo pass) else (
  	cd %%i

		for /R %%j in (*.docx) do (set aFile=%%~nj)

		cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"

		if "%aFile%"=="" (echo pass) else (echo "<li><a href='%bURL%' target='_blank'>%aFile%</a>">>TOC.txt)
	)
)

echo "</ul>">>TOC.txt

