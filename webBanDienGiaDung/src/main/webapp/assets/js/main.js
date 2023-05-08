$(document).ready(function() {
			$('.carousel').carousel({
				interval : 3000
			});
			
		});
		

const btnTuLanh=document.getElementById("btn-tuLanh");
const btnMayLanh=document.getElementById("btn-mayLanh");
const btnMayGiat=document.getElementById("btn-mayGiat");
const btnTuDong=document.getElementById("btn-tuDong");
const btnQuat=document.getElementById("btn-quat");
const btnNoiCom=document.getElementById("btn-noiCom");

const grTuLanh=document.getElementById("group-tuLanh");
const grMayLanh=document.getElementById("group-mayLanh");
const grMayGiat=document.getElementById("group-mayGiat");
const grTuDong=document.getElementById("group-tuDong");
const grQuat=document.getElementById("group-quat");
const grNoiCom=document.getElementById("group-noiCom");

btnTuLanh.addEventListener("click",function(){
	grTuLanh.classList.remove("display-none");
	grMayLanh.classList.add("display-none");
	grMayGiat.classList.add("display-none");
	grTuDong.classList.add("display-none");
	grQuat.classList.add("display-none");
	grNoiCom.classList.add("display-none");
})
btnMayLanh.addEventListener("click",function(){
	grTuLanh.classList.add("display-none");
	grMayLanh.classList.remove("display-none");
	grMayGiat.classList.add("display-none");
	grTuDong.classList.add("display-none");
	grQuat.classList.add("display-none");
	grNoiCom.classList.add("display-none");
})
btnMayGiat.addEventListener("click",function(){
	grTuLanh.classList.add("display-none");
	grMayLanh.classList.add("display-none");
	grMayGiat.classList.remove("display-none");
	grTuDong.classList.add("display-none");
	grQuat.classList.add("display-none");
	grNoiCom.classList.add("display-none");
})
btnTuDong.addEventListener("click",function(){
	grTuLanh.classList.add("display-none");
	grMayLanh.classList.add("display-none");
	grMayGiat.classList.add("display-none");
	grTuDong.classList.remove("display-none");
	grQuat.classList.add("display-none");
	grNoiCom.classList.add("display-none");
})
btnQuat.addEventListener("click",function(){
	grTuLanh.classList.add("display-none");
	grMayLanh.classList.add("display-none");
	grMayGiat.classList.add("display-none");
	grTuDong.classList.add("display-none");
	grQuat.classList.remove("display-none");
	grNoiCom.classList.add("display-none");
})
btnNoiCom.addEventListener("click",function(){
	grTuLanh.classList.add("display-none");
	grMayLanh.classList.add("display-none");
	grMayGiat.classList.add("display-none");
	grTuDong.classList.add("display-none");
	grQuat.classList.add("display-none");
	grNoiCom.classList.remove("display-none");
})


window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("back-top").style.display = "block";
  } else {
    document.getElementById("back-top").style.display = "none";
  }
}

// Cuộn lên đầu trang khi nhấn nút



function topFunction() {
  document.body.scrollTop = 0; // cho Safari
  document.documentElement.scrollTop = 0; // cho Chrome, Firefox, IE và Opera
}

