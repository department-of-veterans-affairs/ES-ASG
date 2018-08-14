cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

echo [%date%, %time%] > TOC.txt

for /r %%i in (.) do (
	copy "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\dopandoc.bat" "%%i"
	cd %%i
	dopandoc
	cd ..
)

