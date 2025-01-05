document.getElementById("specialization-form").addEventListener("submit", function(event) {
  event.preventDefault();

  const abilities = document.getElementById("abilities").value;
  const focus = document.getElementById("focus").value;

  // استدعاء وظيفة تحديد التوصية
  const recommendation = determineSpecialization(abilities, focus);

  // عرض التوصية على الصفحة
  const resultDiv = document.getElementById("result");
  resultDiv.textContent = `التوصية: ${recommendation}`;
});

function determineSpecialization(abilities, focus) {
  if (abilities === "coding" && focus === "AI") {
    return "مجال الذكاء الاصطناعي";
  } else if (abilities === "data-analysis" && focus === "web-dev") {
    return "مجال تحليل البيانات لتطوير المواقع";
  } else if (abilities === "networking" && focus === "cyber-sec") {
    return "مجال حماية الشبكات";
  } else {
    return "يرجى اختيار مهارات واهتمامات أكثر وضوحًا";
  }
}
