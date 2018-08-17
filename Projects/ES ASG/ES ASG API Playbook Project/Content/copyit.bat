cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

set aInit=1

echo [%date%, %time%] > TOC.txt

for /r %%i in (.) do (

			if NOT %%i=="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\." (
		    copy "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\dopandoc.bat" "%%i"
		    cd %%i
		    dopandoc
		    cd ..
      )
)
