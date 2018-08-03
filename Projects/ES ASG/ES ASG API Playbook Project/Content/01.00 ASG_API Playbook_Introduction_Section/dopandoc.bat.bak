rmdir media

rem pandoc -f docx -t mediawiki -o "ASG_API Playbook_01.03 Introduction Section_01.04_Publication Review {Paul}.mediawiki" "ASG_API Playbook_01.03 Introduction Section_01.04_Publication Review {Paul}.docx"
pandoc --extract-media ./ -t mediawiki -o "ASG_API Playbook_01.03 Introduction Section_01.04_Publication Review {Paul}.mediawiki" "ASG_API Playbook_01.03 Introduction Section_01.04_Publication Review {Paul}.docx"

cd media
for /R %%f in (*.emf) do (
	magick %%~nf.emf %%~nf.png
)

cd media
for /R %%f in (*.jpeg) do (
	magick %%~nf.jpeg %%~nf.png
)

cd media
for /R %%f in (*.jpg) do (
	magick %%~nf.jpg %%~nf.png
)

cd media
for /R %%f in (*.tmp) do (
	magick %%~nf.tmp %%~nf.png
)

pause
