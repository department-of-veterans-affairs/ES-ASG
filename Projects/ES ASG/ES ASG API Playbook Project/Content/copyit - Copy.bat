
setlocal ENABLEDELAYEDEXPANSION
rem set word=table
rem set str="jump over the chair"
rem set str=%str:chair=!word!%
rem echo.%str%

rem set aRepo=%aRootTree%!aFolder: =%%20!
rem set aImage=%aRootRaw%!aFolder: =%%20!
rem set aImage=%aImage%!/media/

set aRoot=https://github.com/department-of-veterans-affairs/ES-ASG/wiki/
set aSection=ASG_API Playbook_01.00 Introduction_Section_01.05_Published {Paul Marshall}
set aURL=%aRoot%!aSection: =%%20!

set aHref="<a href='%aURL%' target='_blank'>%aSection%</a>"
echo.%aHref% >TOC.txt


pause

