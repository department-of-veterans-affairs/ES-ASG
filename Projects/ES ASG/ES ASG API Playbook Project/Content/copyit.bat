cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

set aInit=1

echo "<h3>Last Generated: [%date%, %time%]</h3>">TOC.txt
echo "<ul>">>TOC.txt

for /r %%i in (.) do (
		    copy "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\dopandoc.bat" "%%i"
		    cd %%i
		    dopandoc
		    cd ..
)
\
cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
echo "</ul>">>TOC.txt

