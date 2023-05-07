document.addEventListener('keydown', function(event) {
	if (event.key === "Enter") {
		event.preventDefault();
	}
});

const btnLogin = document.getElementById("btn-login")
const btnSignup = document.getElementById("btn-signup")
const login = document.getElementById("form-login")
const signup = document.getElementById("form-signup")
btnLogin.addEventListener("click", function() {

	btnLogin.classList.add("focus")
	btnSignup.classList.remove("focus")
	login.classList.remove("display-none")
	signup.classList.add("display-none")
})

btnSignup.addEventListener("click", function() {

	btnSignup.classList.add("focus")
	btnLogin.classList.remove("focus")
	signup.classList.remove("display-none")
	login.classList.add("display-none")
})



const hoverIcon = document.getElementById('show');
const passwordInput = document.getElementById('password');

// Thêm sự kiện hover vào thẻ <i>
hoverIcon.addEventListener('mouseover', function() {
	// Thay đổi loại input từ password sang text
	passwordInput.setAttribute('type', 'text');
});

hoverIcon.addEventListener('mouseout', function() {
	// Thay đổi loại input từ text sang password
	passwordInput.setAttribute('type', 'password');
});


const submit = document.getElementById("submit");
const overlay = document.getElementById("overlay");
const loading = document.getElementById("loading");

submit.addEventListener("click", function() {
	overlay.classList.add("display-flex");
	loading.classList.add("display-flex");
	alert(123);
});

