#!/bin/bash
source ~/Projects/The_Arsenal/venv/bin/activate

# ألوان للتنظيم
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}--- مشروع الترسانة: جاري بدء المسح الشامل يا تيتو ---${NC}"

read -p "أدخل الهدف (إيميل، يوزر، أو رقم دولي): " TARGET

echo -e "${GREEN}[+] جاري فحص الارتباطات الحية عبر Holehe...${NC}"
holehe $TARGET >> results.log

echo -e "${GREEN}[+] جاري تتبع اليوزرات في المنصات عبر Maigret...${NC}"
maigret $TARGET --threshold 10 --json report >> results.log

echo -e "${GREEN}[+] جاري الفحص التقني للأرقام (إذا كان الهدف رقماً)...${NC}"
if [[ $TARGET =~ ^[0-9]+$ ]]; then
    phoneinfoga scan -n $TARGET >> results.log
fi

echo -e "${GREEN}[+] جاري البحث في تسريبات الدارك ويب عبر h8mail...${NC}"
h8mail -t $TARGET >> results.log

echo -e "${GREEN}--- انتهى المسح. النتائج محفوظة في results.log يا تيتو ---${NC}"
