document.addEventListener("DOMContentLoaded", function () {
    // Login form validation
    const form = document.querySelector("form");
    const usernameInput = document.querySelector("input[name='username']");
    const passwordInput = document.querySelector("input[name='password']");

    form.addEventListener("submit", function (event) {
        let errors = [];

        // Validate username
        if (usernameInput.value.trim() === "") {
            errors.push("يرجى إدخال اسم المستخدم.");
        }

        // Validate password
        if (passwordInput.value.trim() === "") {
            errors.push("يرجى إدخال كلمة المرور.");
        }

        // If there are errors, prevent form submission and display them
        if (errors.length > 0) {
            event.preventDefault();
            alert(errors.join("\n"));
        }
    });
});


document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const fullNameInput = document.querySelector("input[name='fullname']");
    const usernameInput = document.querySelector("input[name='username']");
    const emailInput = document.querySelector("input[name='email']");
    const passwordInput = document.querySelector("input[name='password']");
    const confPasswordInput = document.querySelector("input[name='confpassword']");

    form.addEventListener("submit", function (event) {
        let errors = [];

        // Validate full name
        if (fullNameInput.value.trim() === "") {
            errors.push("الرجاء إدخال الاسم الكامل.");
        }

        // Validate username
        if (usernameInput.value.trim() === "") {
            errors.push("الرجاء إدخال اسم المستخدم.");
        }

        // Validate email
        if (!validateEmail(emailInput.value)) {
            errors.push("الرجاء إدخال بريد إلكتروني صحيح.");
        }

        // Validate password
        if (passwordInput.value.length < 6) {
            errors.push("يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.");
        }

        // Confirm password matches
        if (passwordInput.value !== confPasswordInput.value) {
            errors.push("كلمتا المرور غير متطابقتين.");
        }

        // If there are errors, prevent form submission and display errors
        if (errors.length > 0) {
            event.preventDefault();
            alert(errors.join("\n"));
        }
    });

    // Function to validate email format
    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
});
