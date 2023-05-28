package ptithcm.Entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="THUONGHIEU")
public class ThuongHieuEntity{
	@Id
	@Column(name="MATH")
	private String maTh;
	@Column(name = "TENTHUONGHIEU")
	private String tenThuongHieu;
	@Column(name="TRANGTHAI")
	private boolean trangThai;
	@OneToMany(mappedBy = "thuongHieu", fetch = FetchType.LAZY )
	private Collection<SanPhamEntity> sanPhams;
	public String getMaTh() {
		return maTh;
	}
	public void setMaTh(String maTh) {
		this.maTh = maTh;
	}
	public String getTenThuongHieu() {
		return tenThuongHieu;
	}
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	public void setTenThuongHieu(String tenThuongHieu) {
		this.tenThuongHieu = tenThuongHieu;
	}
	public Collection<SanPhamEntity> getSanPhams() {
		return sanPhams;
	}
	public void setSanPhams(Collection<SanPhamEntity> sanPhams) {
		this.sanPhams = sanPhams;
	}
	
}