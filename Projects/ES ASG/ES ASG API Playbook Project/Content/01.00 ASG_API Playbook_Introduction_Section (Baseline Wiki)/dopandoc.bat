rem pandoc -f docx -t mediawiki -o "ASG_API Playbook_01.00 Introduction_Section_01.01_Initial Draft.mediawiki" "ASG_API Playbook_01.00 Introduction_Section_01.01_Initial Draft.docx"
pandoc --from html --to mediawiki "ASG_API Playbook_01.00 Introduction_Section_01.01_Initial Draft - Copy.htm" > myfile.mediawiki
pause
