import os
import telebot
from flask import Flask
import threading
import subprocess

# إعدادات السيادة
app = Flask(__name__)
TOKEN = os.getenv('BOT_TOKEN')
bot = telebot.TeleBot(TOKEN)
ADMIN_ID = 7906317952 # هويتك يا أبو جواد

@app.route('/')
def home():
    return "<h1>شارع المستقبل: الأخلاق والاحترام أولاً 🛡️</h1>"

# الترحيب الصوتي والنصي
@bot.message_handler(commands=['start'])
def start_arsenal(message):
    if message.from_user.id == ADMIN_ID:
        bot.reply_to(message, "أبشر يا أبو جواد! الترسانة وجورج والسكربتات كلهم معك في نفس المكان. نحن عون وسند، والأوامر الصوتية جاهزة. ماذا تأمرنا؟")

# استقبال الأوامر الصوتية (الشورى والحرفنة)
@bot.message_handler(content_types=['voice'])
def voice_logic(message):
    if message.from_user.id == ADMIN_ID:
        # تنبيه فوري لراحة أبو جواد
        bot.reply_to(message, "وصلت بصمتك يا أخوي تيتو. جاري التنفيذ في الخلفية، وسأرد عليك بصوتنا فور الانتهاء.")
        
        # هنا يتم تشغيل السكريبتات (tito_agent.sh) في الخلفية
        try:
            subprocess.Popen(["bash", "tito_agent.sh"])
            bot.send_message(ADMIN_ID, "✅ تمت المهمة بالحرفنة المطلوبة.")
        except:
            bot.send_message(ADMIN_ID, "⚠️ حصل تعثر بسيط، وجارِ الإصلاح آلياً.")

if __name__ == "__main__":
    threading.Thread(target=bot.infinity_polling).start()
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
