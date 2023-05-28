package ptithcm.Entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "KHUYENMAI")
public class KhuyenMaiEntity {
	@Id
	@Column(name = "MAKM")
	private String maKM;
	@Column(name = "GIATRI")
	private int giaTri;
	@Temporal(TemporalType.DATE)
	@Column(name = "NGAYBATDAU")
	private Date ngayBatDau;
	@Temporal(TemporalType.DATE)
	@Column(name = "NGAYKETTHUC")
	private Date ngayKetThuc;
	@Column(name = "SOLUONG")
	private int soLuong;
	@Column(name = "TRANGTHAI")
	private boolean trangThai;
	//@Column(name = "MAND")
	//private int maND;
	@OneToMany(mappedBy = "khuyenMai", fetch = FetchType.LAZY)
	private List<ChiTietKMEntity> SP_KM;
	
	
			
			
	public String getMaKM() {
		return maKM;
	}

	public void setMaKM(String maKM) {
		this.maKM = maKM;
	}

	public int getGiaTri() {
		return giaTri;
	}

	public void setGiaTri(int giaTri) {
		this.giaTri = giaTri;
	}

	public Date getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public boolean isTrangThai() {
		return trangThai;
	}

	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}

//	public int getMaND() {
//		return maND;
//	}
//
//	public void setMaND(int maND) {
//		this.maND = maND;
//	}

//	public List<SanPhamEntity> getSanPhams() {
//		return sanPhams;
//	}
//
//	public void setSanPhams(List<SanPhamEntity> sanPhams) {
//		this.sanPhams = sanPhams;
//	}
}
