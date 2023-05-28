package ptithcm.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="HINHANH")
public class HinhAnhEntity{
	@Id
	@GeneratedValue
	@Column(name = "MAHINHANH")
	private Integer maHinhAnh;
	@Column(name = "LINK")
	private String link;
	@ManyToOne
	@JoinColumn(name="MASP")
	private SanPhamEntity sanPham;
	public Integer getMaHinhAnh() {
		return maHinhAnh;
	}
	public void setMaHinhAnh(Integer maHinhAnh) {
		this.maHinhAnh = maHinhAnh;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public SanPhamEntity getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPhamEntity sanPham) {
		this.sanPham = sanPham;
	}
	
}