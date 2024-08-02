Set-Location -Path "D:/a/Millennium/Millennium"
$destinationBase = "D:/a/env/ext/data/assets"

$paths = @{
    "./assets/.millennium/Dist/index.js" = "$destinationBase/.millennium/Dist/index.js"
    "./assets/core"                      = "$destinationBase/core"
    "./assets/pipx"                      = "$destinationBase/pipx"
    "./assets/requirements.txt"          = "$destinationBase/requirements.txt"
    "./assets/plugin.json"               = "$destinationBase/plugin.json"
}

foreach ($source in $paths.Keys) {
    $destination = $paths[$source]
    $destinationDir = Split-Path -Path $destination -Parent
    if (-not (Test-Path -Path $destinationDir)) {
        New-Item -Path $destinationDir -ItemType Directory -Force
    }
    Copy-Item -Path $source -Destination $destination -Recurse -Force
}