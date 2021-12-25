public class DanhSachKhachHang {
    private String Name;
    private String DateofBirth;
    private String Address;
    private String Picture;

    public DanhSachKhachHang(String name, String dateofBirth, String address, String picture) {
        Name = name;
        DateofBirth = dateofBirth;
        Address = address;
        Picture = picture;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getDateofBirth() {
        return DateofBirth;
    }

    public void setDateofBirth(String dateofBirth) {
        DateofBirth = dateofBirth;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }
    public String getPicture() {
        return Picture;
    }

    public void setPicture(String picture) {
        Name = picture;
    }

    @Override
    public String toString() {
        return
               Name + "," +  DateofBirth + "," + Address+ ","+ Picture;
    }
}


