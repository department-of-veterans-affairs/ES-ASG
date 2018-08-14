rem gets current directory folder name
set aFolder=%CD:~69%

rem Dependencies
rem pandoc (converts .docx to .mediawiki)
rem magick (converts images extracted from pandoc into .png)
rem Repo department-of-veterans-affairs/ES-ASG must be located at C:\GitHub\ES-ASG
rem Repo department-of-veterans-affairs/ES-ASG.wiki must be located at C:\GitHub\ES-ASG.wiki
rem GitHub Desktop will install git command line

rem Recommend to synch Repo's before starting

rem Get the URL from GitHub using a browser.  This is in the /media folder of each Section.  Replace /blob/ with /raw/ and replace all %%20 with %%20 (for Powershell below)
rem set aImage="https://github.com/department-of-veterans-affairs/ES-ASG/raw/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/01.00%%20ASG_API%%20Playbook_Introduction_Section/media/"

set aRootRaw=https://github.com/department-of-veterans-affairs/ES-ASG/raw/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/
set aRootTree=https://github.com/department-of-veterans-affairs/ES-ASG/tree/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/

SETLOCAL ENABLEDELAYEDEXPANSION
rem set aRepo=%aRootTree%!aFolder: =%%20!
rem set aImage=%aRepo%media/
set aRepo=%aRootTree%!aFolder: =%%20!
set aImage=%aRootRaw%!aFolder: =%%20!
set aImage=%aImage%!/media/

rmdir media /s /q

rem get the last .docx file
for /R %%f in (*.docx) do set aFile=%%~nf

rem convert .docx to .mediawiki and extract images
pandoc --extract-media ./ -t mediawiki -o "%aFile%.mediawiki" "%aFile%.docx"

rem TOC
powershell -Command "'<p>__TOC__</p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFile%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFile%.mediawiki'" -encoding UTF8

rem Edit .mediawiki and Pull Request
powershell -Command "'<p><a href=' + (34 -as [char]) + '%aRepo%' + '/' + '%aFile%.mediawiki' + (34 -as [char]) + '>Edit the Wiki .mediawiki file here.</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFile%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFile%.mediawiki'" -encoding UTF8
powershell -Command "'<p>To provide edited feedback, modify the .mediawiki file at the link below and submit a Pull Request:</p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFile%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFile%.mediawiki'" -encoding UTF8

rem Send feedback via email
powershell -Command "'<p><a href=mailto:jordan.braunstein@visualintegrator.com;paul.marshall4@va.gov>Send Feedback to this page Via Email</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFile%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFile%.mediawiki'" -encoding UTF8

rem Wiki source content here
powershell -Command "'<p><a href=' + '%aRepo%' +'>Wiki source content can be found here.</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFile%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFile%.mediawiki'" -encoding UTF8

rem Fix up image URLs: replacing image types .emf, .jpeg, .jpg, .gif, .tmp with .png; replace File: URL with current section set as aImage above
powershell -Command "(gc '%aFile%.mediawiki' -encoding UTF8) -replace '.emf', '.png' -replace '.jpeg', '.png' -replace '.jpg', '.png' -replace '.gif', '.png' -replace '.tmp', '.png' -replace 'File:.//media/', '%aImage%' | Out-File '%aFile%.mediawiki'" -encoding UTF8

rem housekeeping and move Wiki for publishing
del *.bak
copy "%aFile%.mediawiki" "C:\GitHub\ES-ASG.wiki"

rem convert all image files to .png
cd media
for /R %%f in (*.emf) do (
	magick %%~nf.emf %%~nf.png
)

for /R %%f in (*.jpeg) do (
	magick %%~nf.jpeg %%~nf.png
)

for /R %%f in (*.jpg) do (
	magick %%~nf.jpg %%~nf.png
)

for /R %%f in (*.tmp) do (
	magick %%~nf.tmp %%~nf.png
)

for /R %%f in (*.gif) do (
	magick %%~nf.gif %%~nf.png
)

rem Log to TOC
cd "C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content"
powershell -Command "'<p><a href=' + (34 -as [char]) + '%aRepo%' + '/' + '%aFile%.mediawiki' + (34 -as [char]) + '>Edit the Wiki .mediawiki file here.</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc 'TOC.txt' -encoding UTF8 | Out-String) | Out-File 'TOC.txt'" -encoding UTF8

rem push to GitHub Repo

cd "C:\GitHub\ES-ASG"
git add -f --all
git commit -m "Publish"
git push --all

cd "C:\GitHub\ES-ASG.wiki"
git add -f --all
git commit -m "Publish"
git push --all

