const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

// إعداد مكونات التطبيق
app.use(bodyParser.json());

// نقطة النهاية لاستقبال المدخلات
app.post('/recommendation', (req, res) => {
  const { abilities, focus } = req.body;

  // تحديد التوصية بناءً على المدخلات
  const recommendation = getRecommendation(abilities, focus);
  res.json({ recommendation });
});

function getRecommendation(abilities, focus) {
  if (abilities === "coding" && focus === "AI") {
    return "تخصص الذكاء الاصطناعي";
  } else if (abilities === "data-analysis" && focus === "web-dev") {
    return "تحليل البيانات لتطوير الويب";
  } else if (abilities === "networking" && focus === "cyber-sec") {
    return "تخصص الأمن السيبراني";
  }
  return "يرجى تقديم تفاصيل أوضح لتحديد التوصية.";
}

// تشغيل الخادم
app.listen(port, () => {
  console.log(`الخادم يعمل على الرابط: http://localhost:${port}`);
});
