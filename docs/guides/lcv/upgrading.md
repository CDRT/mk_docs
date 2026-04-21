---
title: Upgrading Commercial Vantage
description: Commercial Vantage update and upgrade procedures
---

# Upgrading

## How Updates Work

Commercial Vantage uses **Over-The-Air (OTA) updates** managed by the Vantage Service (runs in System context). This allows updates even for limited-user accounts.

**Update Cadence:**

| Component | Frequency | Notes |
| --- | --- | --- |
| Commercial Vantage app & Add-ins | Monthly | OTA automatic or via Service |
| Enterprise Package | Quarterly | New installers, ADMX templates |

---

## ADMX Template Management

New Group Policy settings are released when necessary—sometimes between quarterly Enterprise Package releases.

**Current ADMX Template:**

- **Version:** v25.09
- **Download:** [ADMX Template](https://download.lenovo.com/cdrt/tools/lcv_admx_2509.zip)

**When to update:**

- New policies are required for recent features
- Check [What's New](./whatsnew.md) for ADMX template changes per release

---

## Deployment Strategies

### Standard Flow (Recommended)

1. Deploy latest Enterprise Package version initially
2. Allow OTA updates to keep app current
3. Update ADMX templates quarterly or as needed

### Downlevel Deployment

If you need to deploy an older version:

1. Deploy downlevel Enterprise Package version
2. Allow OTA updates to automatically bring to current version
3. This is safe and automatic—no manual intervention needed

### Update Failures & Recovery

If Commercial Vantage fails to self-update or gets stuck:

**Signs of update issues:**

- Add-ins outdated or unavailable
- Service stops responding
- Updates fail with errors

**Recovery steps:**

1. Verify Vantage Service is running:
   ```powershell
   Get-Service -Name VantageService
   ```

2. Check network connectivity to Lenovo update servers

3. Review logs: `%ProgramData%\Lenovo\Vantage\Logs\`

4. If unrecoverable: Redeploy from latest Enterprise Package
   ```cmd
   VantageInstaller.exe Uninstall -Vantage
   VantageInstaller.exe Install -Vantage
   ```

---

## Key Points

- ✅ OTA updates are automatic—no admin action needed for monthly releases
- ✅ Safe to deploy downlevel versions—they'll auto-update to current
- ⚠️ ADMX templates released separately when new policies are needed
- 🔄 Enterprise Package updated quarterly with installer updates
