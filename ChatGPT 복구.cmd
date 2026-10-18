@echo off
chcp 65001 >nul
title Codex 설정 파일 검사 및 복구

echo ==========================================
echo       Codex config.toml 자동 검사
echo ==========================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $p=Join-Path $env:USERPROFILE '.codex\config.toml'; if(-not(Test-Path -LiteralPath $p)){Write-Host '[안내] config.toml 파일이 없습니다.' -ForegroundColor Yellow; exit 2}; $b=[IO.File]::ReadAllBytes($p); $n=@($b | Where-Object {$_ -ne 0}).Count; Write-Host ('파일 크기: '+$b.Length+' bytes'); Write-Host ('0이 아닌 바이트: '+$n); if($b.Length -eq 0){Write-Host '[안내] 파일이 비어 있습니다. 자동 변경하지 않습니다.' -ForegroundColor Yellow; exit 3}; if($n -eq 0){$stamp=Get-Date -Format 'yyyyMMdd-HHmmss'; $new='config.toml.corrupt-'+$stamp; Rename-Item -LiteralPath $p -NewName $new; Write-Host ''; Write-Host '[복구 완료] 손상된 파일을 보존했습니다.' -ForegroundColor Green; Write-Host ('백업 위치: '+(Join-Path (Split-Path $p) $new)); Write-Host '이제 Codex를 다시 실행하세요.'} elseif($n -lt $b.Length){Write-Host '[주의] 일부 바이트만 0입니다. 자동 변경하지 않았습니다.' -ForegroundColor Yellow; exit 4} else {Write-Host '[정상] 파일에 0이 아닌 데이터가 있습니다.' -ForegroundColor Green; Write-Host '파일을 변경하지 않았습니다.'}"
echo.
echo ==========================================
echo 검사가 끝났습니다.
echo ==========================================
pause
