$ErrorActionPreference = "Stop"

function Assert {
  param([bool]$Condition, [string]$Message)
  if (-not $Condition) {
    throw $Message
  }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$requiredRelativePaths = @(
  "README.md",
  "README.zh-CN.md",
  "scripts\Run-Demo.ps1",
  "examples\demo-fixture\README.md",
  "examples\demo-fixture\summary.md",
  "docs\QUICKSTART.md",
  "docs\LIMITATIONS.md",
  "docs\MIGRATION.md",
  "docs\CLAIM_TRACEABILITY.md",
  "docs\TURNAROUND_BASELINE_2026-07-28.md",
  "docs\PAGES_DECISION.md",
  "docs\cases\2026-07-25-readme-strategy-review\README.md",
  "docs\cases\2026-07-25-readme-strategy-review\strategy-discussion.md",
  "docs\launch\README.md",
  "docs\launch\SHOW_HN.md",
  "docs\launch\REDDIT_CLAUDECODE.md",
  "docs\launch\V2EX.md",
  "docs\launch\ZHIHU.md",
  "docs\launch\ECOSYSTEM_SUBMISSIONS.md",
  "docs\launch\OUTREACH.md",
  "assets\social-preview.svg",
  "assets\social-preview.png",
  ".github\RELEASE_v0.2.0.md",
  ".github\RELEASE_v0.2.0.zh-CN.md"
)

foreach ($relativePath in $requiredRelativePaths) {
  Assert (Test-Path -LiteralPath (Join-Path $repoRoot $relativePath) -PathType Leaf) "Missing TURNAROUND-01 asset: $relativePath"
}

$readme = Get-Content -LiteralPath (Join-Path $repoRoot "README.md") -Raw -Encoding UTF8
$readmeZh = Get-Content -LiteralPath (Join-Path $repoRoot "README.zh-CN.md") -Raw -Encoding UTF8
$quickstart = Get-Content -LiteralPath (Join-Path $repoRoot "docs\QUICKSTART.md") -Raw -Encoding UTF8
$limitations = Get-Content -LiteralPath (Join-Path $repoRoot "docs\LIMITATIONS.md") -Raw -Encoding UTF8
$migration = Get-Content -LiteralPath (Join-Path $repoRoot "docs\MIGRATION.md") -Raw -Encoding UTF8
$traceability = Get-Content -LiteralPath (Join-Path $repoRoot "docs\CLAIM_TRACEABILITY.md") -Raw -Encoding UTF8
$baseline = Get-Content -LiteralPath (Join-Path $repoRoot "docs\TURNAROUND_BASELINE_2026-07-28.md") -Raw -Encoding UTF8
$strategyCase = Get-Content -LiteralPath (Join-Path $repoRoot "docs\cases\2026-07-25-readme-strategy-review\README.md") -Raw -Encoding UTF8
$strategyDiscussion = Get-Content -LiteralPath (Join-Path $repoRoot "docs\cases\2026-07-25-readme-strategy-review\strategy-discussion.md") -Raw -Encoding UTF8
$launchIndex = Get-Content -LiteralPath (Join-Path $repoRoot "docs\launch\README.md") -Raw -Encoding UTF8
$socialPreview = Get-Content -LiteralPath (Join-Path $repoRoot "assets\social-preview.svg") -Raw -Encoding UTF8
$release = Get-Content -LiteralPath (Join-Path $repoRoot ".github\RELEASE_v0.2.0.md") -Raw -Encoding UTF8
$releaseZh = Get-Content -LiteralPath (Join-Path $repoRoot ".github\RELEASE_v0.2.0.zh-CN.md") -Raw -Encoding UTF8

Assert ($readme.StartsWith("# Meaning Assurance")) "English README must use the canonical product brand."
Assert ($readme.Contains("[Simple Chinese]") -eq $false) "English README should link the language by its native label."
Assert ($readme.Contains("README.zh-CN.md")) "English README must link the complete Chinese counterpart."
Assert ($readme.Contains("scripts\Run-Demo.ps1")) "English README must expose the one-command demo."
Assert ($readme.Contains("first-party evidence case")) "English README must expose the bounded real case."
Assert ($readme.Contains("Current public preview")) "English README must identify the published preview."

$readmeZhNonAscii = [regex]::Matches($readmeZh, '[^\x00-\x7F]').Count
Assert ($readmeZhNonAscii -gt 1500) "Chinese README does not contain enough Chinese-language content."
Assert ($readmeZh.Contains("Meaning Assurance")) "Chinese README must preserve the canonical English brand."
Assert ($readmeZh.Contains("README.md")) "Chinese README must link back to the English entry."
Assert ($readmeZh.Contains("scripts\Run-Demo.ps1")) "Chinese README must expose the deterministic demo."

function ConvertFrom-CodePoints {
  param([int[]]$CodePoints)
  return -join ($CodePoints | ForEach-Object { [char]$_ })
}

$bilingualBoundaryPairs = @(
  @{
    English = "No hosted control plane"
    Chinese = ConvertFrom-CodePoints @(0x65E0,0x6258,0x7BA1,0x63A7,0x5236,0x9762)
  }
  @{
    English = "No stored provider API keys"
    Chinese = ConvertFrom-CodePoints @(0x4E0D,0x4FDD,0x5B58,0x4F9B,0x5E94,0x5546,0x0020,0x0041,0x0050,0x0049,0x0020,0x004B,0x0065,0x0079)
  }
  @{
    English = "No automatic merge"
    Chinese = ConvertFrom-CodePoints @(0x4E0D,0x81EA,0x52A8,0x5408,0x5E76)
  }
  @{
    English = "does not present agent agreement as proof"
    Chinese = ConvertFrom-CodePoints @(0x6CA1,0x6709,0x628A,0x0020,0x0041,0x0067,0x0065,0x006E,0x0074,0x0020,0x4E00,0x81F4,0x610F,0x89C1,0x5F53,0x6210,0x8BC1,0x660E)
  }
  @{
    English = "third-party audit, independent validation, certification"
    Chinese = ConvertFrom-CodePoints @(0x4E0D,0x662F,0x7B2C,0x4E09,0x65B9,0x5BA1,0x8BA1,0x3001,0x72EC,0x7ACB,0x9A8C,0x8BC1,0x3001,0x8BA4,0x8BC1)
  }
  @{
    English = "A guarantee that the final decision is correct"
    Chinese = ConvertFrom-CodePoints @(0x5BF9,0x6700,0x7EC8,0x51B3,0x5B9A,0x6B63,0x786E,0x6027,0x7684,0x4FDD,0x8BC1)
  }
  @{
    English = "not operating-system sandboxes"
    Chinese = ConvertFrom-CodePoints @(0x4E0D,0x662F,0x64CD,0x4F5C,0x7CFB,0x7EDF,0x7EA7,0x6C99,0x7BB1)
  }
  @{
    English = "Strategic planning brainstorm"
    Chinese = ConvertFrom-CodePoints @(0x6218,0x7565,0x89C4,0x5212,0x5934,0x8111,0x98CE,0x66B4)
  }
)

foreach ($pair in $bilingualBoundaryPairs) {
  Assert ($readme.Contains($pair.English)) "English README is missing a required bilingual boundary: $($pair.English)"
  Assert ($readmeZh.Contains($pair.Chinese)) "Chinese README is missing a required bilingual boundary: $($pair.Chinese)"
}

Assert ($quickstart.Contains("deterministic demo")) "Quick start must separate the deterministic demo."
Assert ($quickstart.Contains("live workflow")) "Quick start must explain the live workflow boundary."
Assert ($limitations.Contains("does not claim to")) "Limitations must state prohibited claims."
Assert ($migration.Contains("completed public repository rename")) "Migration doc must record the completed rename."
Assert ($migration.Contains("AGENT_WORKBENCH_HOME")) "Migration doc must preserve compatibility identifiers."
Assert ($traceability.Contains("tests/test-run-demo.ps1")) "Claim ledger must map the demo claim to a test."
Assert ($traceability.Contains("Claims prohibited")) "Claim ledger must include prohibited launch claims."
Assert ($traceability.Contains("strategic planning brainstorming")) "Claim ledger must bound the strategic-planning claim."
Assert ($baseline.Contains("PowerShell 7")) "Day 0 baseline must record the PowerShell 7 environment gap."
Assert ($baseline.Contains("not a passing result")) "Day 0 baseline must not misstate the PowerShell 7 result."
Assert ($strategyCase.Contains("Strategic Planning Brainstorm")) "The real case must expose strategic planning brainstorming."
Assert ($strategyCase.Contains("competing directions")) "The real case must show divergent planning before convergence."
Assert ($strategyDiscussion.Contains("Brainstorming Frame")) "The strategy record must identify the brainstorming phase."
Assert ($strategyDiscussion.Contains("candidate directions")) "The strategy record must preserve candidate directions."
Assert ($launchIndex.Contains("Draft only")) "Launch pack must remain explicitly draft-only."
Assert ($launchIndex.Contains("delivery receipt")) "Launch pack must require delivery evidence after publication."
Assert ($socialPreview.Contains('width="1280"')) "Social Preview source must use the GitHub preview width."
Assert ($socialPreview.Contains('height="640"')) "Social Preview source must use the GitHub preview height."
Assert ($socialPreview.Contains("Meaning Assurance")) "Social Preview source must contain the canonical brand."
Assert ($socialPreview.Contains("Agents propose. Evidence is verified. Humans decide. by LEVIUS.")) "Social Preview description must include all visible messaging."
$socialPreviewPng = Get-Item -LiteralPath (Join-Path $repoRoot "assets\social-preview.png")
Assert ($socialPreviewPng.Length -gt 10000) "Rendered Social Preview PNG is unexpectedly small."
Assert (-not $release.Contains("Release candidate")) "English v0.2.0 material must not retain candidate status."
Assert ($releaseZh.Contains("v0.2.0")) "Chinese v0.2.0 material must identify the published version."

$canonicalEvidenceLine = "Evidence: one declared test is missing; one changed file is outside scope"
$canonicalReviewLine = "Review outcomes: 2 confirmed, 1 rejected, 1 not testable"
$demoSummaryDocuments = @(
  "README.md",
  "README.zh-CN.md",
  "examples\demo-fixture\summary.md",
  "docs\launch\REDDIT_CLAUDECODE.md",
  "docs\launch\V2EX.md",
  ".github\RELEASE_v0.2.0.md",
  ".github\RELEASE_v0.2.0.zh-CN.md"
)

foreach ($relativeDocument in $demoSummaryDocuments) {
  $summaryContent = Get-Content -LiteralPath (Join-Path $repoRoot $relativeDocument) -Raw -Encoding UTF8
  Assert ($summaryContent.Contains($canonicalEvidenceLine)) "Demo evidence summary drifted in: $relativeDocument"
  Assert ($summaryContent.Contains($canonicalReviewLine)) "Demo review summary drifted in: $relativeDocument"
}

$linkDocuments = @(
  "README.md",
  "README.zh-CN.md",
  "docs\QUICKSTART.md",
  "docs\LIMITATIONS.md",
  "docs\MIGRATION.md",
  "docs\launch\README.md",
  ".github\RELEASE_v0.2.0.md",
  ".github\RELEASE_v0.2.0.zh-CN.md"
)

foreach ($relativeDocument in $linkDocuments) {
  $documentPath = Join-Path $repoRoot $relativeDocument
  $documentRoot = Split-Path -Parent $documentPath
  $content = Get-Content -LiteralPath $documentPath -Raw -Encoding UTF8
  foreach ($match in [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)')) {
    $target = $match.Groups[1].Value
    if ($target -match '^(https?://|mailto:|#|<)') {
      continue
    }
    $targetPath = ($target -split '#')[0]
    if ([string]::IsNullOrWhiteSpace($targetPath)) {
      continue
    }
    $resolvedTarget = [System.IO.Path]::GetFullPath((Join-Path $documentRoot $targetPath))
    Assert (Test-Path -LiteralPath $resolvedTarget) "Broken relative link in ${relativeDocument}: $target"
  }
}

Write-Output "PASS TURNAROUND-01 assets"
