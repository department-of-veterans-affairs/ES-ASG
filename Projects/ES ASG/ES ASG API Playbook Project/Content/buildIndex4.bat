SETLOCAL ENABLEDELAYEDEXPANSION

cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
echo "Start">"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"

echo "<h3>Last Generated: [%date%, %time%]</h3>">"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"
echo "<ul>">>"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"


set aRootWiki="https://github.com/department-of-veterans-affairs/ES-ASG/wiki/"

for /R %%i in (.) do (

	if "%%i"=="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\." (echo pass) else (

		echo FOLDER "%%i">>"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"

  	cd %%i
		rem rmdir media /s /q

		"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\buildindex4a"

		cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
			
	)

)
echo "</ul>">>"C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\TOC.txt"

pause
