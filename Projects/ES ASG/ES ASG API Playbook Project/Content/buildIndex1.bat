SETLOCAL ENABLEDELAYEDEXPANSION

cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"

set aRootWiki="https://github.com/department-of-veterans-affairs/ES-ASG/wiki/"

for /R %%i in (.) do (

	if "%%i"=="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\." (echo pass) else (

  	cd %%i

		for /R %%j in (*.docx) do (set aFile=%%~nj)

		echo FILE %aFile%
		cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
			
	)
)

pause