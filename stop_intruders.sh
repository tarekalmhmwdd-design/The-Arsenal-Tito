#!/bin/bash
echo "--- جاري إيقاف أي أدوات مشبوهة وتأمين الترسانة ---"

# إيقاف خدمات الميتاسبلويت (Metasploit) إذا كانت تعمل
sudo systemctl stop postgresql
sudo msfconsole -q -x "exit" 2>/dev/null

# إيقاف أي عمليات تتبع أو تنصت (Sniffers)
sudo pkill -f wireshark
sudo pkill -f tcpdump
sudo pkill -f ettercap

# تفعيل جدار الحماية (UFW) ومنع جميع الاتصالات الواردة غير المصرح بها
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

echo "--- تم إيقاف الأدوات وتفعيل الدرع بنجاح يا تيتو ---"
