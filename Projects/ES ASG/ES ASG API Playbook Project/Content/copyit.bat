cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

set aInit=2

echo "<h3>Last Generated: [%date%, %time%]</h3>">TOC.txt
echo "<ul>">>TOC.txt

for /r %%i in (.) do (
pause
			if %aInit%==2 (
pause
				set aInit=2
		    copy "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\dopandoc.bat" "%%i"
		    cd %%i
		    dopandoc
		    cd ..
			) else (
				set aInit=2
			)
)
\
cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
echo "</ul>">>TOC.txt

