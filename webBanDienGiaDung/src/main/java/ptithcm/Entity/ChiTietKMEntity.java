package ptithcm.Entity;

import javax.persistence.*;

@Entity
@Table(name = "CTKHUYENMAI")
public class ChiTietKMEntity {
	@Id
	@GeneratedValue
	@Column(name = "MACTKM")
	private String maCTKM;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MASP")
	private SanPhamEntity sanPham;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MAKM")
	private KhuyenMaiEntity khuyenMai;

//	public String getMaCTKM() {
//		return maCTKM;
//	}
//	
//	public void setMaCTKM(String maCTKM) {
//		this.maCTKM = maCTKM;
//	}

	public SanPhamEntity getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPhamEntity sanPham) {
		this.sanPham = sanPham;
	}

	public KhuyenMaiEntity getKhuyenMai() {
		return khuyenMai;
	}

	public void setKhuyenMai(KhuyenMaiEntity khuyenMai) {
		this.khuyenMai = khuyenMai;
	}
}
