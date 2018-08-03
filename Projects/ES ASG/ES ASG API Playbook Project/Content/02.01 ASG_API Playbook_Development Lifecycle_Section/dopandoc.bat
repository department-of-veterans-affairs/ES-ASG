rmdir media

pandoc --extract-media ./ -t mediawiki -o "ASG_API Playbook_02.01 Development Lifecycle_Section_01.03_SME Review Resolved {Max}.mediawiki" "ASG_API Playbook_02.01 Development Lifecycle_Section_01.03_SME Review Resolved {Max}.docx"

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
