cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

set aInit="1"

echo "<h3>Last Generated: [%date%, %time%]</h3>">TOC.txt
echo "<ul>">>TOC.txt

for /r %%i in (.) do (
rem			if "%aInit%"=="2" (
				set aInit=2
		    copy "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\dopandoc.bat" "%%i"
		    cd %%i
		    dopandoc
		    cd ..
rem			) else (
rem				set aInit="2"
rem				echo %aInit%
rem			)
)

cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
echo "</ul>">>TOC.txt

