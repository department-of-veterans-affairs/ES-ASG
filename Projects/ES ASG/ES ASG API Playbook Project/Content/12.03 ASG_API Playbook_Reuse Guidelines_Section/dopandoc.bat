for /R %%f in (*.docx) do set aFile=%%~nf

pandoc --extract-media ./ -t mediawiki -o "%aFile%.mediawiki" "%aFile%.docx"

for /R %%f in (*.docx) do (
	uedit64 "%aFile%.mediawiki" /m,e="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\12.03 ASG_API Playbook_Reuse Guidelines_Section\fixURL.mac"
)

del *.bak

copy "%aFile%.mediawiki" "C:\GitHub\ES-ASG.wiki"

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

git add -f --all
git commit -m "Publish"
git push --all

cd "C:\GitHub\ES-ASG.wiki"

git add -f --all
git commit -m "Publish"
git push --all

pause
