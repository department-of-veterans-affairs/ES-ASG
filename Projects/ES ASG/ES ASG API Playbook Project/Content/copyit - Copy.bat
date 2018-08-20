cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content

echo "<h3>Last Generated: [%date%, %time%]</h3>">TOC.txt
echo "<ul>">>TOC.txt

for /r %%i in (.) do (

	if "%%i" == "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\." (echo pass) else (

		    cd %%i

				SETLOCAL ENABLEDELAYEDEXPANSION
				rem gets current directory folder name
				set aFolder=%CD:~69%

				rem set root URLs
				set aRootRaw="https://github.com/department-of-veterans-affairs/ES-ASG/raw/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/"
				set aRootTree="https://github.com/department-of-veterans-affairs/ES-ASG/tree/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/"
				set aRootWiki="https://github.com/department-of-veterans-affairs/ES-ASG/wiki/"
				set aRepo=%aRootTree%!aFolder: =%%20!
				set aImage=%aRootRaw%!aFolder: =%%20!
				set aImage=%aImage%!/media/

"copyit - Copy - Copy"

				rem Log to TOC
				cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
				set aURL=%aRootWiki%!aFile: =-!
				set bURL=%aURL:"=%
				echo "<li><a href='%bURL%' target='_blank'>%aFile%</a>">>TOC.txt

		    cd C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content
	)
)

cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
echo "</ul>">>TOC.txt


