$ErrorActionPreference = "Stop"

function Assert {
  param([bool]$Condition, [string]$Message)
  if (-not $Condition) {
    throw $Message
  }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$readmePath = Join-Path $repoRoot "README.md"
$releasePath = Join-Path $repoRoot ".github\RELEASE_v0.2.0.md"
$releaseZhPath = Join-Path $repoRoot ".github\RELEASE_v0.2.0.zh-CN.md"
$examplesPath = Join-Path $repoRoot "docs\EXAMPLES.md"
$messagingPath = Join-Path $repoRoot "docs\RELEASE_MESSAGING.md"
$publishingPath = Join-Path $repoRoot "docs\PUBLICATION_READINESS.md"
$samplePath = Join-Path $repoRoot "examples\sample-design-note.md"
$authorsPath = Join-Path $repoRoot "AUTHORS.md"
$securityPath = Join-Path $repoRoot "SECURITY.md"

foreach ($path in @($readmePath, $releasePath, $releaseZhPath, $examplesPath, $messagingPath, $publishingPath, $samplePath, $authorsPath, $securityPath)) {
  Assert (Test-Path -LiteralPath $path -PathType Leaf) "Missing public documentation artifact: $path"
}

$readme = Get-Content -LiteralPath $readmePath -Raw -Encoding UTF8
$release = Get-Content -LiteralPath $releasePath -Raw -Encoding UTF8
$releaseZh = Get-Content -LiteralPath $releaseZhPath -Raw -Encoding UTF8
$examples = Get-Content -LiteralPath $examplesPath -Raw -Encoding UTF8
$messaging = Get-Content -LiteralPath $messagingPath -Raw -Encoding UTF8
$publishing = Get-Content -LiteralPath $publishingPath -Raw -Encoding UTF8
$authors = Get-Content -LiteralPath $authorsPath -Raw -Encoding UTF8
$security = Get-Content -LiteralPath $securityPath -Raw -Encoding UTF8

Assert (-not $readme.Contains('-Title "Add a bounded validation check"')) "README uses an unsupported New-AgentTask -Title parameter."
Assert ($release.Contains("Public Preview")) "Release draft must identify the release as a public preview."
Assert ($release.Contains("not an operating-system sandbox")) "Release draft must preserve the worktree safety boundary."
Assert ($release.Contains("no automatic merge")) "Release draft must state the no-auto-merge boundary."
Assert ($release.Contains("role protocol, not a fixed agent trio")) "English release must present replaceable protocol roles."
Assert ($release -match 'formal\s+non-interactive adapters') "English release must distinguish implemented adapters."
Assert ($release.Contains("decision trail in one command")) "English release must foreground the deterministic demo."
Assert ($release.Contains("real first-party evidence case")) "English release must include the bounded real case."
Assert (-not $release.Contains("Release candidate")) "English release must not retain candidate status."
$nonAsciiCount = [regex]::Matches($releaseZh, '[^\x00-\x7F]').Count
Assert ($nonAsciiCount -gt 1000) "Chinese release does not contain enough Chinese-language content."
Assert ($releaseZh -match '(?i)adapter') "Chinese release must preserve adapter boundaries."
Assert ($releaseZh.Contains("Git worktree")) "Chinese release must preserve the worktree boundary."
Assert ($releaseZh.Contains("not-testable")) "Chinese release must explain bounded moderation outcomes."
Assert ($releaseZh.Contains("v0.2.0")) "Chinese release must identify the candidate version."
Assert ($messaging.Contains("govern multi-agent handoffs in real work")) "Messaging strategy must lead with the governed handoff problem."
Assert ($messaging.Contains("two formal non-interactive adapters")) "Messaging strategy must preserve current adapter boundaries."
Assert ($messaging.Contains("Faster to adopt")) "Messaging strategy must define the speed claim."
Assert ($messaging.Contains("Comparative Framing")) "Messaging strategy must include honest comparative framing."
foreach ($documentContent in @($readme, $release, $releaseZh, $authors)) {
  Assert ($documentContent.Contains("LEVIUS")) "Public identity document is missing the author ID."
  Assert ($documentContent.Contains("agentworkbench@proton.me")) "Public identity document is missing the contact email."
}
Assert ($security.Contains("agentworkbench@proton.me")) "Security policy is missing the fallback contact email."
Assert ($publishing.Contains("Gitleaks")) "Publication readiness must retain the full-history secret-scan gate."
Assert ($publishing.Contains("PowerShell 7")) "Publication readiness must retain the PowerShell 7 CI gate."
Assert ($publishing.Contains("Publication authorization and receipts")) "Publication readiness must record the authorized publication gate."
Assert ($examples.Contains("needs_codex_decision")) "Examples must preserve the final moderator decision gate."
Assert ($examples.Contains("create a fresh discussion")) "Examples must explain frozen snapshot freshness."

$testCount = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot "tests") -Filter "test-*.ps1" -File).Count
Assert ($release.Contains("All $testCount repository tests pass under")) "Release test count does not match the repository suite."
$zhTestLines = @($releaseZh -split '\r?\n' | Where-Object { $_ -match 'Windows PowerShell 5\.1' })
Assert ($zhTestLines.Count -ge 1) "Chinese release does not contain a Windows PowerShell 5.1 verification line."
Assert (($zhTestLines -join "`n").Contains($testCount.ToString())) "Chinese release test count does not match the repository suite."

foreach ($document in @($releasePath, $releaseZhPath, $examplesPath)) {
  $content = Get-Content -LiteralPath $document -Raw -Encoding UTF8
  $blocks = [regex]::Matches($content, '(?ms)```powershell\s*(.*?)\s*```')
  Assert ($blocks.Count -gt 0) "Expected at least one PowerShell example in $document"
  foreach ($block in $blocks) {
    $tokens = $null
    $errors = $null
    [System.Management.Automation.Language.Parser]::ParseInput($block.Groups[1].Value, [ref]$tokens, [ref]$errors) | Out-Null
    Assert ($errors.Count -eq 0) "Invalid PowerShell example in ${document}: $($errors[0].Message)"
  }
}

Write-Output "PASS public documentation contract"
