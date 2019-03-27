Write-Host "Viafree Streaming URL grabber!"
$inNumber = Read-Host -Prompt "Enter a valid number identifier"
$URLString = "https://playapi.mtgx.tv/v3/videos/stream-links/"+$inNumber+"?device=web"
if (Test-Path -Path "viafree.json") { Remove-Item -LiteralPath ".\viafree.json" -Force }
Invoke-WebRequest -Uri $URLString -OutFile "viafree.json"
$json = (Get-Content "viafree.json" -Raw) | ConvertFrom-Json
Write-Host "`nStreaming URL:"
$json.embedded.prioritizedStreams.links.stream.href
while($answerVariable -notmatch ("yes","no"))
{
	$answerVariable = Read-Host -Prompt "`nDo you want to copy the streaming URL into clipboard? (yes/no) "
	switch -casesensitive ($answerVariable)
	{
		"yes" {	Set-Clipboard -Value $json.embedded.prioritizedStreams.links.stream.href; Write-Host "Current streaming url has been copied to clipboard." }
		"no" { Write-Host "Continue." }
		default	{ Write-Host "Try Again!" }
	}
	if (($answerVariable.Contains("yes")) -or ($answerVariable.Contains("no")))
	{
		break
	}
}
if (Test-Path -Path "viafree.json") { Remove-Item -LiteralPath ".\viafree.json" -Force }
Write-Host "`nThere must be entered a valid number, then it should be a url for streaming video in a external media player."
Write-Host "if you experience a issue. Please try again later."