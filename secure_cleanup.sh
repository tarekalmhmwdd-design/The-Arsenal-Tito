#!/bin/bash
echo "جاري تنظيف أثر العمليات وتشفير التقارير..."
sudo apt autoremove -y && sudo apt autoclean
rm -rf ~/.cache/maigret
# تشفير ملف النتائج (سيطلب منك كلمة مرور)
ccrypt ~/Projects/The_Arsenal/results.log
echo "تم التأمين بنجاح يا تيتو."
