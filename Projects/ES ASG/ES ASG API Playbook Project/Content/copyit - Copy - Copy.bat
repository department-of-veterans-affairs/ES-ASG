
				rem get the last .docx file
				for /R %%f in (*.docx) do set aFile=%%~nf

				echo FILE %aFile%

pause
