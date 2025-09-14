# 🐧 Linux Scripts Collection

A curated set of **useful Bash scripts** for automating and monitoring various tasks in Linux environments. These scripts aim to simplify system maintenance, performance monitoring, and routine admin tasks — making your life as a DevOps engineer or sysadmin a little easier.

---

## 📁 Repository Structure

| Script                   | Description                                                              |
| ------------------------ | ------------------------------------------------------------------------ |
| `auto-system-update.sh`  | Automatically updates and upgrades the system packages using `apt`.      |
| `cpu-load-monitor.sh`    | Monitors CPU usage and logs system load metrics for analysis.            |
| `disk-usage-notifier.sh` | Sends alerts if disk usage crosses a specified threshold.                |
| `hello-user-script.sh`   | Greets the logged-in user with system info; useful for onboarding demos. |
| `log-cleaner.sh`         | Cleans up large log files and reports space saved.                       |
| `ssh-logger.sh`          | Intended to log SSH login attempts (currently not functional).           |
| `uptime-monitor.sh`      | Reports system uptime and alerts if downtime is detected.                |

---

## 🚀 Getting Started

1. Clone the repo:

```bash
git clone https://github.com/amitkumar0128/bash-scripts.git
cd bash-scripts
```

2. Make a script executable:

```bash
chmod +x script-name.sh
```

3. Run the script:

```bash
./script-name.sh
```

> Note: Some scripts may require `sudo` permissions or specific packages (like `mailutils`, `bc`, etc.)

---

## 🛠️ Use Cases

* 💻 System boot auto-updates
* 📊 CPU and uptime monitoring
* 📦 Disk space alerts
* 🧹 Log maintenance
* 🔐 SSH event tracking (in-progress)

---

## 📌 Planned Improvements

* [ ] Fix and enhance `ssh-logger.sh`
* [ ] Add system resource graphing (via `gnuplot` or `rrdtool`)
* [ ] Add cronjob integration examples
* [ ] Log rotation and archiving utilities

---

## 🧪 Dependencies

Some scripts may require the following:

* `mailutils` (for sending email alerts)
* `bc` (for arithmetic)
* `awk`, `grep`, `sed` (standard CLI tools)

Install missing dependencies via:

```bash
sudo apt install mailutils bc
```

---

## 🧑‍💻 Author

**Amit Kumar**
🔗 [GitHub](https://github.com/amitkumar0128)

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.
