[CmdletBinding()]
param(
  [string]$OutputDirectory
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$fixtureRoot = Join-Path $repoRoot "examples\demo-fixture"

if (-not (Test-Path -LiteralPath $fixtureRoot -PathType Container)) {
  throw "Demo fixture is missing: examples\demo-fixture"
}

if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
  $suffix = [DateTime]::UtcNow.ToString("yyyyMMdd-HHmmss-fff")
  $OutputDirectory = Join-Path ([System.IO.Path]::GetTempPath()) "meaning-assurance-demo-$suffix"
}

$fullOutputPath = [System.IO.Path]::GetFullPath($OutputDirectory)
if (Test-Path -LiteralPath $fullOutputPath) {
  throw "Demo output directory already exists. Choose a new path: $fullOutputPath"
}

$requiredFixtureFiles = @(
  "summary.md",
  "task-packet.json",
  "worker-claim.json",
  "frozen-evidence\test-results.json",
  "frozen-evidence\changed-files.json",
  "reviewer-findings.json",
  "moderation-result.json",
  "final-decision.md"
)

foreach ($relativePath in $requiredFixtureFiles) {
  $sourcePath = Join-Path $fixtureRoot $relativePath
  if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
    throw "Demo fixture is incomplete: $relativePath"
  }
}

New-Item -ItemType Directory -Path $fullOutputPath -Force:$false | Out-Null

foreach ($relativePath in $requiredFixtureFiles) {
  $sourcePath = Join-Path $fixtureRoot $relativePath
  $targetPath = Join-Path $fullOutputPath $relativePath
  $targetParent = Split-Path -Parent $targetPath
  if (-not (Test-Path -LiteralPath $targetParent -PathType Container)) {
    New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
  }
  Copy-Item -LiteralPath $sourcePath -Destination $targetPath
}

$manifestFiles = foreach ($relativePath in $requiredFixtureFiles) {
  $targetPath = Join-Path $fullOutputPath $relativePath
  $hash = Get-FileHash -LiteralPath $targetPath -Algorithm SHA256
  [ordered]@{
    path = $relativePath.Replace("\", "/")
    sha256 = $hash.Hash.ToLowerInvariant()
  }
}

$manifest = [ordered]@{
  schema = "meaning-assurance.demo-evidence-manifest.v1"
  fixture_id = "bounded-validation-review-v1"
  deterministic_fixture = $true
  live_agent_invoked = $false
  files = @($manifestFiles)
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$manifestJson = $manifest | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText(
  (Join-Path $fullOutputPath "evidence-manifest.json"),
  $manifestJson + [Environment]::NewLine,
  $utf8NoBom
)

Write-Output "Meaning Assurance deterministic demo"
Write-Output "Worker claim: COMPLETE"
Write-Output "Evidence: one declared test is missing; one changed file is outside scope"
Write-Output "Review outcomes: 2 confirmed, 1 rejected, 1 not testable"
Write-Output "Final acceptance: BLOCKED"
Write-Output "Open first: $(Join-Path $fullOutputPath 'summary.md')"
Write-Output "Output directory: $fullOutputPath"
