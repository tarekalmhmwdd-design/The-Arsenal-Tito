#!/bin/bash
# تفعيل المسارات لضمان عمل h8mail و holehe
export PATH="$PATH:/root/.local/bin:/usr/local/bin"

echo "--- 🛡️ مشروع الترسانة: جاري الاستخراج الاحترافي يا تيتو ---"
read -p "أدخل الهدف (رقم أو إيميل): " target

# تحويل الرقم إلى إيميل افتراضي للفحص العميق
if [[ $target =~ ^[0-9]+$ ]]; then
    search_target="${target}@gmail.com"
else
    search_target=$target
fi

echo "[+] جاري كشف الحسابات النشطة (Holehe)..."
python3 -m holehe.cli "$search_target" --only-used

echo "[+] جاري فحص المنصات الاجتماعية (SocialScan)..."
# استخدام خيار الفحص المباشر للأرقام
python3 -m socialscan "$target" --platforms facebook instagram twitter

echo "[+] جاري فحص تسريبات الدارك ويب (h8mail)..."
# تصحيح خيار h8mail لإزالة خطأ -q
python3 -m h8mail -t "$search_target"

echo "--- ✅ تم الانتهاء يا تيتو. راجع ملف results.log ---"
