# Set source and destination folders
$sourceFolder = "C:\Users\costrategix\PycharmProjects\DEFINITY_REGRESSION\Tests"
$exportFolder = "$sourceFolder\export"
$zipFile = "$sourceFolder\TestResults.zip"

# Create export folder if it doesn't exist
if (!(Test-Path -Path $exportFolder)) {
    New-Item -ItemType Directory -Path $exportFolder
}

# List of Robot Framework output files to copy
$filesToExport = @("report.html", "log.html", "output.xml")

# Copy files to export folder
foreach ($file in $filesToExport) {
    $sourcePath = Join-Path $sourceFolder $file
    $destinationPath = Join-Path $exportFolder $file
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $destinationPath -Force
    } else {
        Write-Host "File not found: $file"
    }
}

# Remove old zip if exists
if (Test-Path $zipFile) {
    Remove-Item $zipFile -Force
}

# Compress export folder into zip file
Compress-Archive -Path "$exportFolder\*" -DestinationPath $zipFile

Write-Host "✅ Export completed. Zipped results at: $zipFile"