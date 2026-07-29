$ErrorActionPreference = "Stop"

function Assert {
  param([bool]$Condition, [string]$Message)
  if (-not $Condition) {
    throw $Message
  }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$demoScript = Join-Path $repoRoot "scripts\Run-Demo.ps1"
$scratchRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("meaning-assurance-demo-test-" + [guid]::NewGuid().ToString("N"))
$outputPath = Join-Path $scratchRoot "output"

Assert (Test-Path -LiteralPath $demoScript -PathType Leaf) "Run-Demo.ps1 is missing."

$statusBefore = [string]::Join("`n", @(& git -C $repoRoot status --porcelain))

try {
  $demoOutput = @(& $demoScript -OutputDirectory $outputPath)
  $demoOutputText = [string]::Join("`n", $demoOutput)

  $requiredFiles = @(
    "summary.md",
    "task-packet.json",
    "worker-claim.json",
    "frozen-evidence\test-results.json",
    "frozen-evidence\changed-files.json",
    "reviewer-findings.json",
    "moderation-result.json",
    "final-decision.md",
    "evidence-manifest.json"
  )

  foreach ($relativePath in $requiredFiles) {
    Assert (Test-Path -LiteralPath (Join-Path $outputPath $relativePath) -PathType Leaf) "Demo output is missing: $relativePath"
  }

  $workerClaim = Get-Content -LiteralPath (Join-Path $outputPath "worker-claim.json") -Raw -Encoding UTF8 | ConvertFrom-Json
  $testEvidence = Get-Content -LiteralPath (Join-Path $outputPath "frozen-evidence\test-results.json") -Raw -Encoding UTF8 | ConvertFrom-Json
  $moderation = Get-Content -LiteralPath (Join-Path $outputPath "moderation-result.json") -Raw -Encoding UTF8 | ConvertFrom-Json
  $manifest = Get-Content -LiteralPath (Join-Path $outputPath "evidence-manifest.json") -Raw -Encoding UTF8 | ConvertFrom-Json
  $decision = Get-Content -LiteralPath (Join-Path $outputPath "final-decision.md") -Raw -Encoding UTF8

  Assert ($workerClaim.status -eq "COMPLETE") "Demo worker claim should be COMPLETE."
  Assert ($testEvidence.expected_check_count -eq 3) "Demo should declare three required checks."
  Assert ($testEvidence.observed_check_count -eq 2) "Demo should show only two observed checks."
  Assert ($moderation.counts.confirmed -eq 2) "Demo should contain two confirmed findings."
  Assert ($moderation.counts.rejected -eq 1) "Demo should contain one rejected finding."
  Assert ($moderation.counts.not_testable -eq 1) "Demo should contain one not-testable finding."
  Assert ($manifest.live_agent_invoked -eq $false) "Deterministic demo must not claim a live agent invocation."
  Assert (@($manifest.files).Count -eq 8) "Evidence manifest should hash all eight copied fixture files."
  Assert ($decision.Contains('**State:** `BLOCKED`')) "Final demo decision should be BLOCKED."
  Assert ($demoOutputText.Contains("Worker claim: COMPLETE")) "Demo stdout must report the worker claim."
  Assert ($demoOutputText.Contains("Evidence: one declared test is missing; one changed file is outside scope")) "Demo stdout must report both confirmed evidence gaps."
  Assert ($demoOutputText.Contains("Review outcomes: 2 confirmed, 1 rejected, 1 not testable")) "Demo stdout must report calibrated review outcomes."
  Assert ($demoOutputText.Contains("Final acceptance: BLOCKED")) "Demo stdout must report the final acceptance state."

  $existingPathError = $null
  try {
    & $demoScript -OutputDirectory $outputPath | Out-Null
  } catch {
    $existingPathError = $_
  }
  Assert ($null -ne $existingPathError) "Demo should refuse to overwrite an existing output directory."

  $statusAfter = [string]::Join("`n", @(& git -C $repoRoot status --porcelain))
  Assert ($statusBefore -eq $statusAfter) "Running the demo changed the source repository."
} finally {
  if (Test-Path -LiteralPath $scratchRoot) {
    Remove-Item -LiteralPath $scratchRoot -Recurse -Force
  }
}

Write-Output "PASS deterministic demo"
