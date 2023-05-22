document.addEventListener("DOMContentLoaded", function() {
  // Đoạn script ở đây

// Lấy tất cả các nút "Lấy mã"
const layMaBtns = document.querySelectorAll('.copy-button');

// Bắt sự kiện click chuột vào từng nút
layMaBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    // Lấy mã khuyến mãi từ thuộc tính id của nút
    const maKM = btn.id;
    
    // Copy mã khuyến mãi vào bộ nhớ tạm
    navigator.clipboard.writeText(maKM)
      .then(() => {
        // Hiện thông báo khi copy thành công
        alert('Bạn đã copy mã khuyến mãi ' + maKM);
      })
      .catch(err => {
        console.error('Không thể copy mã khuyến mãi', err);
      });
  });
});
});


	
  // Lấy ngày hiện tại
  var today = new Date().toISOString().slice(0, 10);

  // Lặp qua các thẻ <td> chứa ngày kết thúc của từng mã khuyến mãi
  var endDates = document.querySelectorAll('.end-date');

  endDates.forEach(function (endDate) {
    // Nếu ngày kết thúc nhỏ hơn ngày hiện tại, ẩn thẻ cha là <tr>
    if (endDate.innerHTML < today) {
      endDate.parentNode.style.display = 'none';
    }
  });

