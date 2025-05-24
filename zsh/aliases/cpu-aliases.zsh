cpu() {
  local options=(
    "📊 View CPU Stats"
    "🔍 Check CPU Governor"
    "🛠 Edit Auto-CPUFreq Config (System)"

    "🔌 Set Charger Governor: performance"
    "🔌 Set Charger Governor: schedutil"
    "🔌 Set Charger Governor: userspace"
    "🔌 Set Charger Governor: ondemand"
    "🔌 Set Charger Governor: conservative"
    "🔌 Set Charger Governor: powersave"

    "🔋 Set Battery Governor: performance"
    "🔋 Set Battery Governor: schedutil"
    "🔋 Set Battery Governor: userspace"
    "🔋 Set Battery Governor: ondemand"
    "🔋 Set Battery Governor: conservative"
    "🔋 Set Battery Governor: powersave"

    "🚪 Quit"
  )

  local choice=$(printf "%s\n" "${options[@]}" | fzf --height 20 --prompt "⚙️  Select CPU Mode: " --border)

  case $choice in
    "📊 View CPU Stats") sudo auto-cpufreq --stats ;;
    "🔍 Check CPU Governor") cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ;;
    "🛠 Edit Auto-CPUFreq Config (System)") sudo nvim /etc/auto-cpufreq.conf ;;

    "🔌 Set Charger Governor: performance") change_cpu_mode performance charger ;;
    "🔌 Set Charger Governor: schedutil") change_cpu_mode schedutil charger ;;
    "🔌 Set Charger Governor: userspace") change_cpu_mode userspace charger ;;
    "🔌 Set Charger Governor: ondemand") change_cpu_mode ondemand charger ;;
    "🔌 Set Charger Governor: conservative") change_cpu_mode conservative charger ;;
    "🔌 Set Charger Governor: powersave") change_cpu_mode powersave charger ;;

    "🔋 Set Battery Governor: performance") change_cpu_mode performance battery ;;
    "🔋 Set Battery Governor: schedutil") change_cpu_mode schedutil battery ;;
    "🔋 Set Battery Governor: userspace") change_cpu_mode userspace battery ;;
    "🔋 Set Battery Governor: ondemand") change_cpu_mode ondemand battery ;;
    "🔋 Set Battery Governor: conservative") change_cpu_mode conservative battery ;;
    "🔋 Set Battery Governor: powersave") change_cpu_mode powersave battery ;;

    "🚪 Quit") return ;;
    *) echo "❌ Invalid selection." ;;
  esac
}

