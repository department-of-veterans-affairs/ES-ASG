rem gets current directory folder name
cd "C:\GitHub\ES-ASG\Projects\2018-06-06_Governance_ Models_in_Public_and_Private_Sector - Skylight\Deliverables"

rem convert .docx to .mediawiki and extract images
pandoc --extract-media ./ -t html -o "skylight_api_governance_research_report.html" "skylight_api_governance_research_report.md"

