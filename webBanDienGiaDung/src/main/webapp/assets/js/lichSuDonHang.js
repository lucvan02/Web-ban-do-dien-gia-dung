const btnThanhCong=document.getElementById("btn-thanhCong");
const btnDangGiao=document.getElementById("btn-dangGiao");
const btnChoXacNhan=document.getElementById("btn-choXacNhan");
const btnDaHuy=document.getElementById("btn-daHuy");

const grThanhCong=document.getElementById("group-thanhCong");
const grDangGiao=document.getElementById("group-dangGiao");
const grChoXacNhan=document.getElementById("group-choXacNhan");
const grDaHuy=document.getElementById("group-daHuy");

btnThanhCong.addEventListener("click",function(){
	grThanhCong.classList.remove("display-none");
	grDangGiao.classList.add("display-none");
	grChoXacNhan.classList.add("display-none");
	grDaHuy.classList.add("display-none");
	
	btnThanhCong.classList.add("focus");
	btnDangGiao.classList.remove("focus");
	btnChoXacNhan.classList.remove("focus");
	btnDaHuy.classList.remove("focus");
	
})
btnDangGiao.addEventListener("click",function(){
	grThanhCong.classList.add("display-none");
	grDangGiao.classList.remove("display-none");
	grChoXacNhan.classList.add("display-none");
	grDaHuy.classList.add("display-none");
	
	btnThanhCong.classList.remove("focus");
	btnDangGiao.classList.add("focus");
	btnChoXacNhan.classList.remove("focus");
	btnDaHuy.classList.remove("focus");
	
})
btnChoXacNhan.addEventListener("click",function(){
	grThanhCong.classList.add("display-none");
	grDangGiao.classList.add("display-none");
	grChoXacNhan.classList.remove("display-none");
	grDaHuy.classList.add("display-none");
	
	btnThanhCong.classList.remove("focus");
	btnDangGiao.classList.remove("focus");
	btnChoXacNhan.classList.add("focus");
	btnDaHuy.classList.remove("focus");
	
})
btnDaHuy.addEventListener("click",function(){
	grThanhCong.classList.add("display-none");
	grDangGiao.classList.add("display-none");
	grChoXacNhan.classList.add("display-none");
	grDaHuy.classList.remove("display-none");
	
	btnThanhCong.classList.remove("focus");
	btnDangGiao.classList.remove("focus");
	btnChoXacNhan.classList.remove("focus");
	btnDaHuy.classList.add("focus");
	
})

function topFunction() {
  document.body.scrollTop = 0; // cho Safari
  document.documentElement.scrollTop = 0; // cho Chrome, Firefox, IE và Opera
}

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("back-top").style.display = "block";
  } else {
    document.getElementById("back-top").style.display = "none";
  }
}