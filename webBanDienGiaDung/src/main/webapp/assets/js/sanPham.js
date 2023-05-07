// Lấy ra các phần tử cần sử dụng
const decreaseBtn = document.getElementById("decreaseBtn");
const increaseBtn = document.getElementById("increaseBtn");
const inputQuantity = document.getElementById("inputQuantity");
const conLaiAn = document.getElementById("conLaiAn");
// Đặt giá trị mặc định là 1
let quantity = 1;
let spConLai=conLaiAn.value;
inputQuantity.value = quantity;

// Thiết lập sự kiện cho các nút
decreaseBtn.addEventListener("click", function() {
	if (quantity > 1) {
		quantity--;
		inputQuantity.value = quantity;
	}
});

increaseBtn.addEventListener("click", function() {
	if (quantity <spConLai) {
		quantity++;
		inputQuantity.value = quantity;
	}
});

// Kiểm tra tính hợp lệ của dữ liệu nhập vào
inputQuantity.addEventListener("change", function() {
	let value = parseInt(this.value);
	if (isNaN(value) || value < 1 || value>spConLai) {
		quantity = 1;
		this.value = 1;
	} else {
		quantity = value;
	}
});

// Lấy danh sách các ảnh thu nhỏ
	var thumbnails = document.getElementsByClassName('product-thumbnail');
		
	// Lấy ảnh đại diện sản phẩm
						var productImage = document.getElementById('product-image');
		
	// Lấy nút prev và next
						var prevButton = document.getElementById('prev-button');
	var nextButton = document.getElementById('next-button');
					  
	// Thiết lập chỉ số ban đầu
						var currentIndex = 0;
		
						// Thêm sự kiện click cho nút prev
						prevButton.addEventListener('click', function() {
	  currentIndex--;
	  if (currentIndex < 0) {
		currentIndex = thumbnails.length - 1;
	  }
	  productImage.setAttribute('src', thumbnails[currentIndex].getAttribute('src'));
	});
		
	// Thêm sự kiện click cho nút next
	nextButton.addEventListener('click', function() {
	  currentIndex++;
	  if (currentIndex >= thumbnails.length) {
		currentIndex = 0;
	  }
	  productImage.setAttribute('src', thumbnails[currentIndex].getAttribute('src'));
	});
		
	// Thêm sự kiện click cho mỗi ảnh thu nhỏ
	for (var i = 0; i < thumbnails.length; i++) {
	  thumbnails[i].addEventListener('click', function() {
		// Lấy chỉ số của ảnh được click
		currentIndex = Array.from(thumbnails).indexOf(this);
		
		// Thay đổi đường dẫn của ảnh đại diện sản phẩm
		productImage.setAttribute('src', this.getAttribute('src'));
	  });
	}