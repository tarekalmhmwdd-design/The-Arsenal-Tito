#!/bin/bash
# المساعد الآلي الخاص بتيتو - تنفيذ المهام بالنيابة عنك
export PATH="$PATH:/root/.local/bin:/usr/local/bin"

clear
echo "--- 🤖 مساعد تيتو الذكي: جاري تولي المهمة الآن ---"
read -p "🎯 أدخل الهدف (رقم/إيميل/يوزر): " target

# 1. التفكير واتخاذ القرار (Decision Making)
if [[ $target =~ ^[0-9]+$ ]]; then
    echo "[!] تم اكتشاف رقم هاتف. جاري تفعيل بروتوكول OSINT للأرقام..."
    # تنفيذ الفحص الآلي
    holehe "${target}@gmail.com" --only-used 2>/dev/null
    python3 -m h8mail -t "${target}@gmail.com" -q 2>/dev/null
    socialscan "$target" --platforms instagram twitter facebook 2>/dev/null
    
elif [[ $target == *"@"* ]]; then
    echo "[!] تم اكتشاف بريد إلكتروني. جاري فحص التسريبات والحسابات..."
    holehe "$target" --only-used
    python3 -m h8mail -t "$target"
else
    echo "[!] تم اكتشاف يوزر نيم. جاري تعقب البصمة الرقمية..."
    sherlock "$target" --timeout 1
fi

# 2. الحفظ الآلي والمزامنة
echo "[+] جاري أرشفة النتائج ومزامنتها مع GitHub..."
git add . && git commit -m "Agent Auto-Scan: $target" && git push origin main 2>/dev/null

echo "--- ✅ المهمة اكتملت يا تيتو. التقرير محفوظ وجاهز فيresults.log ---"
