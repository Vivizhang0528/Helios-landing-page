# Downloads high-resolution public imagery into this folder for offline use.
# Sun: NASA SDO (updates daily if re-run). Bodies: Wikimedia Commons / ESO CDN.
# Run from repo: powershell -ExecutionPolicy Bypass -File website/assets/planets/download-images.ps1
$ErrorActionPreference = "Stop"
$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"

$pairs = @(
  @{ Name = "sun.jpg";    Url = "https://sdo.gsfc.nasa.gov/assets/img/latest/latest_2048_HMIIC.jpg" },
  @{ Name = "vesta.jpg";  Url = "https://upload.wikimedia.org/wikipedia/commons/9/9b/Vesta_in_natural_color.jpg" },
  @{ Name = "pallas.jpg"; Url = "https://cdn.eso.org/images/wallpaper1/eso2008a.jpg" },
  @{ Name = "gaspra.jpg"; Url = "https://upload.wikimedia.org/wikipedia/commons/8/81/951_Gaspra.jpg" },
  @{ Name = "eros.jpg";   Url = "https://upload.wikimedia.org/wikipedia/commons/2/2e/433eros.jpg" },
  @{ Name = "ida.jpg";    Url = "https://upload.wikimedia.org/wikipedia/commons/8/89/243_ida_crop.jpg" },
  @{ Name = "ryugu.jpg";  Url = "https://upload.wikimedia.org/wikipedia/commons/4/41/Hayabusa2_near_Ryugu_%2841404161811%29.jpg" },
  @{ Name = "bennu.jpg";  Url = "https://upload.wikimedia.org/wikipedia/commons/7/77/Bennu_mosaic_OSIRIS-REx.jpg" }
)

foreach ($item in $pairs) {
  $out = Join-Path $dir $item.Name
  Write-Host "GET $($item.Name) ..."
  Invoke-WebRequest -Uri $item.Url -OutFile $out -UseBasicParsing -UserAgent $ua
  Start-Sleep -Seconds 2
}

Write-Host "Done. Output: $dir"
