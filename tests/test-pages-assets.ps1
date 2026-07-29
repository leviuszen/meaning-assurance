$ErrorActionPreference = "Stop"

function Assert {
  param([bool]$Condition, [string]$Message)
  if (-not $Condition) {
    throw $Message
  }
}

function ConvertFrom-CodePoints {
  param([int[]]$CodePoints)
  return -join ($CodePoints | ForEach-Object { [char]$_ })
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$siteRoot = Join-Path $repoRoot "site"
$requiredFiles = @(
  "index.html",
  "zh-cn\index.html",
  "demo\index.html",
  "cases\strategy-review\index.html",
  "styles.css",
  "robots.txt",
  "sitemap.xml",
  "llms.txt",
  "404.html"
)

foreach ($relativePath in $requiredFiles) {
  Assert (Test-Path -LiteralPath (Join-Path $siteRoot $relativePath) -PathType Leaf) "Missing Pages file: $relativePath"
}

$english = Get-Content -LiteralPath (Join-Path $siteRoot "index.html") -Raw -Encoding UTF8
$chinese = Get-Content -LiteralPath (Join-Path $siteRoot "zh-cn\index.html") -Raw -Encoding UTF8
$demo = Get-Content -LiteralPath (Join-Path $siteRoot "demo\index.html") -Raw -Encoding UTF8
$case = Get-Content -LiteralPath (Join-Path $siteRoot "cases\strategy-review\index.html") -Raw -Encoding UTF8
$styles = Get-Content -LiteralPath (Join-Path $siteRoot "styles.css") -Raw -Encoding UTF8
$robots = Get-Content -LiteralPath (Join-Path $siteRoot "robots.txt") -Raw -Encoding UTF8
$sitemap = Get-Content -LiteralPath (Join-Path $siteRoot "sitemap.xml") -Raw -Encoding UTF8
$llms = Get-Content -LiteralPath (Join-Path $siteRoot "llms.txt") -Raw -Encoding UTF8
$workflow = Get-Content -LiteralPath (Join-Path $repoRoot ".github\workflows\pages.yml") -Raw -Encoding UTF8

Assert ($english.Contains('<html lang="en">')) "English page must declare its language."
Assert ($chinese.Contains('<html lang="zh-CN">')) "Chinese page must declare its language."
Assert ($english.Contains('rel="canonical" href="https://leviuszen.github.io/meaning-assurance/"')) "English canonical URL is missing."
Assert ($chinese.Contains('rel="canonical" href="https://leviuszen.github.io/meaning-assurance/zh-cn/"')) "Chinese canonical URL is missing."
Assert ($english.Contains('hreflang="zh-CN"')) "English page must link to the Chinese alternate."
Assert ($chinese.Contains('hreflang="en"')) "Chinese page must link to the English alternate."
Assert ($english.Contains("What evidence did it leave?")) "English page must preserve the problem-first hook."
$chineseHook = -join (@(0x5B83, 0x7559, 0x4E0B, 0x4E86, 0x4EC0, 0x4E48, 0x8BC1, 0x636E) | ForEach-Object { [char]$_ })
Assert ($chinese.Contains($chineseHook)) "Chinese page must preserve the problem-first hook."
Assert ($demo.Contains("requires no API key") -or $demo.Contains("require a provider key")) "Demo page must state the no-key boundary."
Assert ($case.Contains("first-party workflow evidence")) "Case page must preserve the first-party boundary."
Assert ($case.Contains("not independent")) "Case page must reject independent-validation overclaiming."
Assert ($styles.Length -gt 5000) "Pages stylesheet is unexpectedly small."
Assert ($robots.Contains("sitemap.xml")) "robots.txt must expose the sitemap."
Assert ($sitemap.Contains("/zh-cn/")) "Sitemap must contain the Chinese entry."
Assert ($sitemap.Contains("/demo/")) "Sitemap must contain the demo entry."
Assert ($sitemap.Contains("/cases/strategy-review/")) "Sitemap must contain the strategy case."
Assert ($llms.StartsWith("# Meaning Assurance")) "llms.txt must start with the canonical brand."
Assert ($llms.Contains("coding agent verification")) "llms.txt must expose the core functional category."
$chineseAlias = ConvertFrom-CodePoints @(0x0041,0x0049,0x0020,0x5BF9,0x6297,0x5BA1,0x8BA1,0x52A9,0x624B)
Assert ($llms.Contains($chineseAlias)) "llms.txt must expose the Chinese audience-facing alias."
Assert ($llms.Contains("docs/CODING_AGENT_VERIFICATION.md")) "llms.txt must link the functional verification page."
Assert ($llms.Contains("Apache License 2.0")) "llms.txt must state the repository license accurately."
Assert ($workflow.Contains("actions/checkout@v6")) "Pages workflow must avoid the deprecated checkout runtime."
Assert ($workflow.Contains("actions/configure-pages@v5")) "Pages workflow must configure Pages."
Assert ($workflow.Contains("actions/upload-pages-artifact@v4")) "Pages workflow must upload the static artifact."
Assert ($workflow.Contains("actions/deploy-pages@v4")) "Pages workflow must deploy through the official action."
Assert (-not $workflow.Contains("pull_request")) "Pages workflow must not deploy unmerged Pull Requests."

$publicTextFiles = @(
  Get-ChildItem -LiteralPath (Join-Path $repoRoot "docs\launch") -File -Filter "*.md"
  Get-Item -LiteralPath (Join-Path $repoRoot ".github\RELEASE_v0.2.0.md")
  Get-Item -LiteralPath (Join-Path $repoRoot ".github\RELEASE_v0.2.0.zh-CN.md")
)
$chinesePlaceholder = -join (@(0x003C, 0x6700, 0x7EC8, 0x4ED3, 0x5E93, 0x5730, 0x5740, 0x003E) | ForEach-Object { [char]$_ })
foreach ($file in $publicTextFiles) {
  $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
  Assert (-not $content.Contains("<FINAL_")) "Unreplaced English launch URL placeholder in: $($file.FullName)"
  Assert (-not $content.Contains($chinesePlaceholder)) "Unreplaced Chinese launch URL placeholder in: $($file.FullName)"
}

Write-Output "PASS Pages and final launch assets"
