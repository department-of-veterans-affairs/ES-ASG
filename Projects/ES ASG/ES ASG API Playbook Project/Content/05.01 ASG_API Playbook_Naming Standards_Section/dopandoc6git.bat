rem This .bat file handles the transformation of .docx to .mediawiki files

rem Note:  If you're just working on one file...you may place this .bat in the folder containing the .docx file and it will only generate that one document.
rem You will need to perform a GitHub sync yourself.

rem Dependencies
rem pandoc (converts .docx to .mediawiki)
rem magick (converts images extracted from pandoc into .png)
rem Repo department-of-veterans-affairs/ES-ASG must be located at C:\GitHub\ES-ASG
rem Repo department-of-veterans-affairs/ES-ASG.wiki must be located at C:\GitHub\ES-ASG.wiki
rem GitHub Desktop will install git command line
rem Recommend to synch Repo's before starting

rem Get the URL from GitHub using a browser.  This is in the /media folder of each Section.  Replace /blob/ with /raw/ and replace all %%20 with %%20 (for Powershell below)
rem set aImage="https://github.com/department-of-veterans-affairs/ES-ASG/raw/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/01.00%%20ASG_API%%20Playbook_Introduction_Section/media/"

SETLOCAL ENABLEDELAYEDEXPANSION
rem gets current directory folder name
set aFolder=%CD:~69%

rem Set some useful locations
set aRootRaw="https://github.com/department-of-veterans-affairs/ES-ASG/raw/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/"
set aRootTree="https://github.com/department-of-veterans-affairs/ES-ASG/tree/master/Projects/ES%%20ASG/ES%%20ASG%%20API%%20Playbook%%20Project/Content/"
set aRootWiki="https://github.com/department-of-veterans-affairs/ES-ASG/wiki/"
set aRepo=%aRootTree%!aFolder: =%%20!
set aImage=%aRootRaw%!aFolder: =%%20!
set aImage=%aImage%!/media/

rem Clean up prior to generating
rmdir media /s /q
del *.mediawiki
del *.bak

rem Get the last .docx file - merely loops through all files, leaving us with the highest version .docx file
for /R %%f in (*.docx) do set aFile=%%~nf

rem Convert .docx to .mediawiki and extract images to /media
pandoc --extract-media ./ -t mediawiki -o "%aFolder%.mediawiki" "%aFile%.docx"

rem This will insert at top of file, thus these are in reverse order of what one will see after we're done
rem Add TOC
powershell -Command "'<p>__TOC__</p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFolder%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFolder%.mediawiki'" -encoding UTF8

rem Wiki source content here
powershell -Command "'<p><a href=' + '%aRepo%' +'>Wiki source content can be found here.</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFolder%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFolder%.mediawiki'" -encoding UTF8

rem Edit .mediawiki and Pull Request
powershell -Command "'<p><a href=' + (34 -as [char]) + '%aRepo%' + '/' + '%aFolder%.mediawiki' + (34 -as [char]) + '>Edit the Wiki .mediawiki file here.</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFolder%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFolder%.mediawiki'" -encoding UTF8

rem Send feedback via email
powershell -Command "'<p><a href=' + (34 -as [char]) + 'mailto:ronald.opperman@va.gov;paul.marshall4@va.gov?subject=' + '%aFile%' + (34 -as [char]) + '>Send Feedback to this page Via Email</a></p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFolder%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFolder%.mediawiki'" -encoding UTF8

rem Advisory text
powershell -Command "'<p>Refer to the three ways to provide feedback on the Wiki Home page.</p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFolder%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFolder%.mediawiki'" -encoding UTF8

rem Generated Timestamp
powershell -Command "'<p>This page was generated from <b>' + '%aFile%' + '.docx</b> on <b>' + '%date%' + '</b> at <b>' + '%time%' + ' Eastern Time Zone</b>.</p>' + (13 -as [char]) + (10 -as [char]) + (gc '%aFolder%.mediawiki' -encoding UTF8 | Out-String) | Out-File '%aFolder%.mediawiki'" -encoding UTF8

rem Fix up image URLs: replacing image types .emf, .jpeg, .jpg, .gif, .tmp with .png; replace File: URL with current section set as aImage above. Remove <blockquote> as it seems to cause problems
rem powershell -Command "(gc '%aFolder%.mediawiki' -encoding UTF8) -replace '.emf', '.png' -replace '.jpeg', '.png' -replace '.jpg', '.png' -replace '.gif', '.png' -replace '.tmp', '.png' -replace 'File:.//media/', '%aImage%' -replace '<blockquote>', '' -replace '</blockquote>', '' -replace 'rel=' + (34 -as [char]) + 'nofollow' + (34 -as [char]) +'>', 'target=' + (34 -as [char]) +'blank' + (34 -as [char]) + '>' | Out-File '%aFolder%.mediawiki'" -encoding UTF8
powershell -Command "(gc '%aFolder%.mediawiki' -encoding UTF8) -replace 'rel=', 'XXXXXXXXXXXXXXX' | Out-File '%aFolder%.mediawiki'" -encoding UTF8



rem <a href="http://www.ietf.org/rfc/rfc1035.txt" rel="nofollow">RFC 1035</a>


rem Move Wiki for publishing
copy "%aFolder%.mediawiki" "C:\GitHub\ES-ASG.wiki"

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

cd C:\GitHub
gitSync

