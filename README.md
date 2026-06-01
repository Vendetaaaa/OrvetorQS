# OrvetorQS (OQS)

> A no-nonsense Windows toolkit for people who actually use their computer.

**Author:** Vendetaaaa · **Org:** Vendezela Org · **Version:** 1.0 Alpha  
**Contact:** VZVendeta@hotmail.com · **GitHub:** [Vendetaaaa](https://github.com/Vendetaaaa)

---

## What is this?

OrvetorQS is a single `.bat` file that replaces a dozen scattered Windows tools with one clean, interactive menu. System info, network diagnostics, file management, backups, disk cleanup — all in one place, all from the command line, no installation required.

If you've ever opened Task Manager, ipconfig, Event Viewer, and File Explorer at the same time just to figure out what's wrong with your machine — this is for you.

---

## Getting started

**Requirements:** Windows 10 or 11 · Administrator rights (recommended)

```
Right-click OrvetorQS.bat → Run as administrator
```

That's it. On first run, OQS creates its own folder at `%USERPROFILE%\OQS\` and sets everything up automatically. No installers, no registry edits, nothing left behind if you delete the folder.

**Command-line options:**

```
OrvetorQS.bat /?        Show help
OrvetorQS.bat --help    Same as above
OrvetorQS.bat /quick    Print a fast system + disk summary and exit
```

Run it with no arguments to get the full interactive menu.

---

## The menu at a glance

```
[1] System Information     [G] Command Guide
[2] Network Tools          [T] Theme
[3] File Operations        [F] OQS Folder
[4] Backup                 [E] Exit
[5] Cleanup
[6] View / Reload Config
```

Navigation is consistent everywhere: numbers to go in, `R` to go back.

---

## What each module does

### 1 — System Information

Gives you a full snapshot of your machine: hostname, user, domain, OS build, CPU identifier, core count, RAM usage, page file, storage (logical and physical), GPU, network adapters, MAC addresses, active connections, and power/battery status.

**When to use it:** Before calling IT support, before installing something heavy, or any time you need to know exactly what you're working with.

---

### 2 — Network Tools

| Option | What it does |
|---|---|
| Ping | Test whether a host is reachable |
| Trace Route | See every hop between you and a destination |
| DNS Lookup | Resolve a domain name to an IP address |
| Active Connections | List all current ESTABLISHED connections and ports |
| IP Configuration | Full adapter info (IP, subnet, gateway, DNS) |
| Flush DNS Cache | Clear stale DNS records when sites won't load |
| ARP Table | Show cached MAC-to-IP mappings on your network |

**When to use it:** A website won't load, you suspect a DNS issue, you want to see what your computer is connected to, or you're troubleshooting slow network speeds.

---

### 3 — File Operations

A lightweight file explorer built into the terminal. Navigate your drives, then create, rename, copy, move, or delete files and folders — all without leaving the script. A mini-preview panel shows you what's in the current directory at all times.

**When to use it:** Quick file housekeeping when you don't want to open a full Explorer window, or when working over a remote session where drag-and-drop isn't practical.

---

### 4 — Backup & Restore

Backs up any folder you choose using `robocopy`, which means it's fast, reliable, and handles large folder trees without complaint. Backups are timestamped (`BKP_YYYYMMDD_HHMMSS`) and stored under `%USERPROFILE%\OQS\AppData\Data\Backups\`.

| Option | What it does |
|---|---|
| Create Backup | Copy your source folder to a new timestamped backup |
| Restore | Pick a backup and restore it to any destination |
| View History | See a log of every backup and restore operation |
| Delete Backup | Remove a specific backup to free up space |
| Settings | Change the source folder and how many backups to keep |

Auto-cleanup is built in: once you exceed your configured limit (default: 5), the oldest backup is deleted automatically.

**When to use it:**
- Before a big system update or driver change
- Before editing important documents you might want to roll back
- As a lightweight daily backup for your Documents folder

**Set it up for daily use:** Schedule `OrvetorQS.bat /quick` as a Windows Task Scheduler job to get a daily system snapshot logged silently. For the backup itself, schedule a shortcut that runs the backup module — point it at your Documents folder and let OQS handle the rotation.

---

### 5 — Cleanup

| Option | What it does |
|---|---|
| Clean Temp Files | Delete files in `%TEMP%` older than N days |
| Empty Recycle Bin | Clear all drives' recycle bins |
| Clear Windows Temp | Wipe `C:\Windows\Temp` (requires admin) |
| Check Disk | Run `chkdsk /f` on any drive letter |
| System File Checker | Run `sfc /scannow` to repair corrupted Windows files |
| Secure Wipe Free Space | Overwrite unallocated space (slow but thorough) |

**When to use it:** Disk getting full, system acting slow, or after removing malware. SFC in particular is underused — it can quietly fix a lot of stability issues.

---

### 6 — Config

View and live-reload `Configuration.ini` without restarting the script. You can also open it in Notepad directly from this menu to change settings like your backup source path, how many backups to keep, or the log level.

---

### T — Theme

Change the terminal's foreground and background colors using standard Windows console color codes (0–F). Reset to default with `[3]`. The active color code is displayed in the header banner on every screen.

---

## Everyday use — practical examples

**Morning system check (30 seconds)**
Run `OrvetorQS.bat /quick` from a shortcut on your taskbar. It prints CPU, RAM, OS build, and free space on every drive, then exits. Good to pin as a startup script.

**"Why is my internet slow?"**
Go to `[2] Network Tools → Ping` and test `8.8.8.8`. If that passes, try `DNS Lookup` on the site that's slow. If DNS resolves fine, use `Trace Route` to find where packets are dropping.

**"My C: drive is almost full"**
`[5] Cleanup → Clean Temp Files` first (set threshold to 7 days). Then `Empty Recycle Bin`. Usually recovers several GB immediately without touching anything important.

**"I'm about to do something risky to my files"**
`[4] Backup → Create Backup`, point it at the folder you're about to change, done. If anything goes wrong, `Restore` puts it back exactly as it was.

**"Something feels broken with Windows"**
`[5] Cleanup → System File Checker` runs `sfc /scannow`. Leave it for 10–15 minutes. It'll find and repair corrupted system files without you having to remember the command.

---

## Adding OQS to your desktop as a widget (Windows 11)

Windows 11 doesn't support native terminal widgets, but you can get close with a few approaches:

**Option A — Taskbar shortcut with auto-run**
1. Right-click `OrvetorQS.bat` → Create shortcut
2. Right-click the shortcut → Properties → Advanced → check "Run as administrator"
3. Pin the shortcut to your taskbar — one click to open

**Option B — Scheduled quick summary on login**
1. Open Task Scheduler → Create Basic Task
2. Trigger: "When I log on"
3. Action: Start a program → `OrvetorQS.bat` → Arguments: `/quick`
4. OQS will print a system summary to a console window every time you log in

**Option B — Windows Terminal profile**
Add OQS as a named profile in Windows Terminal (`settings.json`):

```json
{
  "name": "OrvetorQS",
  "commandline": "cmd.exe /k \"C:\\path\\to\\OrvetorQS.bat\"",
  "icon": "⚙️",
  "startingDirectory": "%USERPROFILE%"
}
```

This gives you a dedicated OQS tab alongside your normal terminal tabs.

**Option C — Desktop shortcut with a custom icon**
1. Create a shortcut on your desktop pointing to `OrvetorQS.bat`
2. Right-click → Properties → Change Icon → pick any `.ico` from `%SystemRoot%\System32\imageres.dll`
3. Double-click from the desktop any time you need it

---

## Directory structure

OQS creates the following on first run — don't delete this folder:

```
%USERPROFILE%\OQS\
├── AppData\
│   ├── Data\
│   │   ├── Backups\
│   │   └── Operations\
│   ├── Logs\
│   │   ├── OQS.log
│   │   ├── Crash.log
│   │   └── Error.log
│   └── TemporaryFiles\
├── Documents\
│   ├── ReadMe.txt
│   ├── License.txt
│   ├── Contact.txt
│   └── Credits.txt
├── Languages\
├── Profile\
│   └── UserProfile.txt
├── AboutUs\
└── Configuration.ini
```

---

## Configuration reference

`Configuration.ini` is plain text — open it in any editor. Key settings:

| Key | Default | What it controls |
|---|---|---|
| `language` | English | UI language (additional languages planned) |
| `theme` | default | Color theme |
| `log_level` | INFO | Logging verbosity |
| `backup_source` | `%USERPROFILE%\Documents` | What gets backed up |
| `backup_target` | OQS\AppData\Data\Backups | Where backups are stored |
| `keep_count` | 5 | How many backups to keep before auto-cleanup |
| `auto_backup` | true | Whether to enable backup rotation |
| `temp_cleanup` | true | Whether temp cleanup is available |

---

## Notes & known limitations

- `wmic` commands (used for CPU, GPU, RAM, disk info) are deprecated in Windows 11 22H2+ and may be removed in future builds. If some system info fields show blank, this is likely the cause. A PowerShell fallback is planned.
- The date parser in the clock display handles most locale formats but may show incorrectly on unusual regional settings.
- Language files are scaffolded but not yet populated — multi-language support is coming in a future update.
- Administrator rights are strongly recommended. Without them, SFC, chkdsk, Windows Temp cleanup, and some network tools will fail silently or not at all.

---

## License

You may use, edit, copy, and share this tool freely. You may not claim original authorship. See `License.txt` in the OQS Documents folder for the full terms.

---

*OrvetorQS is a Vendezela Org project. For bugs, questions, or contributions, reach out via GitHub or email above.*
