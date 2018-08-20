cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

echo "<h3>Last Generated: [%date%, %time%]</h3>">TOC.txt
echo "<ul>">>TOC.txt

for /r %%i in (.) do (

	if "%%i"=="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\." (echo pass) else (

		    xcopy/Y "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\copyit2.bat" "%%i"
		    cd %%i
				copyit2
	)

if "%%i"=="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\ZZZ" (echo HERE ZZZ)

)
