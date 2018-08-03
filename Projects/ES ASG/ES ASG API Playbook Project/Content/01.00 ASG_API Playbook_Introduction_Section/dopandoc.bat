rmdir media

pandoc --extract-media ./ -t mediawiki -o "ASG_API Playbook_01.03 Introduction Section_01.05_Publication Review {Paul}.mediawiki" "ASG_API Playbook_01.03 Introduction Section_01.04_Publication Review {Paul}.docx"

uedit64 "ASG_API Playbook_01.03 Introduction Section_01.05_Publication Review {Paul}.mediawiki" /m,e="C:\GitHub\ES-ASG\Projects\ES ASG\ES ASG API Playbook Project\Content\01.00 ASG_API Playbook_Introduction_Section\fixURL.mac"

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

pause
