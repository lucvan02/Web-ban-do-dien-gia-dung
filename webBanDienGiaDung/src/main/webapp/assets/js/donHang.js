var ten=document.getElementById("input-ten");
var sdt=document.getElementById("input-sdt");
var diaChi=document.getElementById("input-diaChi");

var loiTen=document.getElementById("loi-ten");
var loiSdt=document.getElementById("loi-sdt");
var loiDiaChi=document.getElementById("loi-diaChi");

var btn=document.getElementById("btn-newInfo");

  var regexTen = /^[a-zA-ZÀ-ỹ. ]+$/;
	var regexSdt=/^\d{10,11}$/ ;
;

	if (!ten.value || !sdt.value ||!diaChi.value) {
 btn.classList.add("disable");
}

function checkRong(){
	if (!ten.value || !sdt.value ||!diaChi.value) {
 btn.classList.add("disable");
} else {
   btn.classList.remove("disable");
}
}

ten.addEventListener("keyup",()=>{
	
	checkRong();
	 if (!regexTen.test(ten.value)){
		 
		 loiTen.innerHTML="Họ tên không hợp lệ !";
		 btn.classList.add("disable");
	 }
	 else{
		  loiTen.innerHTML="ㅤ";
	 }
	
});
sdt.addEventListener("keyup",()=>{
	
	checkRong();
	 if (!regexSdt.test(sdt.value)){
		 
		 loiSdt.innerHTML="SĐT không hợp lệ !";
		 btn.classList.add("disable");
	 }
	 else{
		  loiSdt.innerHTML="ㅤ";
	 }
	
});
diaChi.addEventListener("keyup",()=>{
	
	checkRong();
	if(!diaChi.value){
		 loiDiaChi.innerHTML="Hãy nhập địa chỉ";
		 	 btn.classList.add("disable");
	}
	else{
		loiDiaChi.innerHTML="ㅤ";
	}
});
