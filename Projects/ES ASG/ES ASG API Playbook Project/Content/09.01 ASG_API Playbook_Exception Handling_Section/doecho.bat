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

rem get the last .docx file
for /R %%f in (*.docx) do set aFile=%%~nf

echo pandoc "%aFile%.mediawiki" "%aFile%.docx"

set aURL=%aRootWiki%!aFile: =-!
set bURL=%aURL:"=%
echo "<a href='%bURL%' target='_blank'>%aFile%</a>">>TOC.txt

pause
