var express = require('express');
var router = express.Router();
var csdl=require('../data-process/csdl');
var http = require('http');
var url = require('url');
const bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var session = require('express-session');
router.use(session({ secret: "Shh, its a secret!" }));

/* GET home page. */
XuatDuLieu = async function (req, res){
    dsldt = await csdl.HienThiLoaiDT();
    // X? lý l?y mã lo?i
    var q = url.parse(req.url, true).query;

    var dt = "";
    //X? lý mua hoa
    if (q.muadt != undefined)//ki?m tra có ch?n mua hàng
    {//Ki?m tra ?ã có gi? hàng ch?a
        if (req.session.giohang == undefined)//Ch?a có
        {
            // Tao moi gio hang
            req.session.giohang = [];
            // Tao moi dt mua
            dt = {
                madt: q.muadt, tendt: q.tendt,
                gia: q.gia, soluong: 1
            };
            // Them vao gio hang
            req.session.giohang[0] = dt;   
        }
        else// Da co gio hang
        {// Kiem tra dien thoai chon mua da co truoc do chua
            var co = 0;
            for (i = 0; i < req.session.giohang.length; i++)
            {
                if (req.session.giohang[i].madt == q.muadt)
                {//n?u ?ã có :t?ng s? l??ng 1
                    req.session.giohang[i].soluong++;
                    co = 1;
                    break;
                }
            }
            // Neu chua co trong gio hang
            if (co == 0) {
                // Tao moi va dua vao gio hang
                dt = {
                    madt: q.muadt, tendt: q.tendt,
                    gia: q.gia, soluong: 1
                };
                req.session.giohang[req.session.giohang.length] = dt;

            }
            console.log(req.session.giohang);
        }
    }

    var dsdt = "";
    if (q.tendt != undefined) {
        tendt = q.tendt;
        dsdt = await csdl.HienThiChiTietDT("", tendt);
    }
    else
    if (q.madt != undefined) {
        var madt = q.madt;
        dsdt = await csdl.HienThiChiTietDT(madt,"");
    }   
    else if (q.ttgh != undefined) {
        if (q.xoagh != undefined) {
            giohang = [];
            vt = 0;
            for (i = 0; i < req.session.giohang.length; i++) {
                if (req.session.giohang[i].madt != q.xoagh) {
                    giohang[vt] = req.session.giohang[i];
                    vt++;
                }
            }
            req.session.giohang = giohang;
        }
        else if (q.suagh != undefined) {
            for (i = 0; i < req.session.giohang.length; i++) {
                if (req.session.giohang[i].madt == q.suagh)
                {
                    req.session.giohang[i].soluong = q.soluong ;
                    break;
                }
            }

        }
        dsdt = csdl.HienThiGioHang(req.session.giohang);
    }
    else {

        // dsldt = await csdl.HienThiLoaiDT();
        // var dsh = "";
        var maloai = 0;
        var tenloai = "";
        if (q.maloai != undefined) {
            maloai = q.maloai; 
        }
        dsdt = await csdl.HienThiDT(maloai);  
    }

    // dsdt = await csdl.HienThiDT(maloai); 
    //  dsldt = await csdl.HienThiLoaiDT();

    
    var tenkh = "";
    var thoat = "";
    var guest = "<a href='/?dangky=1'>Đăng ký</a><a href='/?dangnhap=1'>Đăng nhập</a>";

    if (req.session.kh == "") {
        tenkh = "Thông tin đăng nhập sai";f
        req.session.kh = undefined;
    }
    else if (req.session.kh != undefined) {
        tenkh = "<a>Xin chào, " + req.session.kh.HoTen + "</a>";
        if (req.session.kh.TenDN == "admin")
            guest = "<a href='/admin'>TRANG QUẢN LÝ</a>";
        else guest = "";
        thoat = "<a href=/?thoat=1>ĐĂNG XUẤT</a>";
    }
    
    var ttgh = "";
    if (req.session.giohang != undefined && req.session.giohang.length > 0)
        ttgh = csdl.GioHangTong(req.session.giohang);
    res.render("index", {
        dsloaidt: dsldt, dsdt: dsdt,
        hoten: tenkh, thoat: thoat, thongtingiohang:ttgh, guest: guest
    });

    // var tenkh = "";
    // var thoat = "";
    // if (req.session.kh == "") {
    //     tenkh = "Thông tin dang nhap sai";
    //     req.session.kh = undefined;
    // }
    // else if (req.session.kh != undefined) {
    //     tenkh = req.session.kh.HoTen;
    //     thoat = "<a href=/?thoat=1>exit</a>";
    // }
    // var ttgh = "";
    // if (req.session.giohang != undefined && req.session.giohang.length > 0)
    //     ttgh = csdl.GioHangTong(req.session.giohang);
    // res.render("index1", {
    //     dsldt: dsldt, dsdt: dsdt,
    //     hoten: tenkh, thoat: thoat,thongtingiohang:ttgh
    // });
};

router.get('/', async function(req, res, next) {
    var q = url.parse(req.url, true).query;
    if (q.dathang != undefined)
    {
        var thoat = "";
        var guest = "<a href='/?dangky=1'>Đăng ký</a><a href='/?dangnhap=1'>Đăng nhập</a>";
    
        if (req.session.kh != undefined) {
            tenkh = "<a>Xin chào, " + req.session.kh.HoTen + "</a>";
            if (req.session.kh.TenDN == "admin")
                guest = "<a href='/admin'>TRANG QUẢN LÝ</a>";
            else guest = "";
            thoat = "<a href=/?thoat=1>ĐĂNG XUẤT</a>";
        }

        var hoten1 = "";
        var diachi = "";
        var dienthoai = "";
        var email = "";
        var giohang = "";
        if (req.session.kh != undefined) {
            hoten1 = req.session.kh.HoTen;
            diachi = req.session.kh.DiaChi;
            dienthoai = req.session.kh.DienThoai;
            email = req.session.kh.Email;
        }
        res.render("submitcart", {
            ho_ten: hoten1, dia_chi: diachi,
            dien_thoai: dienthoai, email: email,
            hoten: hoten1, thoat: thoat, guest: guest
        });
     }
    else {
    if (q.thoat == 1) 
        req.session.kh = undefined;
        guest = "<a href='/?dangky=1'>Đăng ký</a><a href='/?dangnhap=1'>Đăng nhập</a>";
    if (q.dangky == 1)
        res.render("register");
    if (q.dangnhap == 1)
        res.render("login");
    else 
        await XuatDuLieu(req, res);
    }
});


router.post("/dangky", async function (req, res) {
    var tendn = req.body.ten_dn;
    var matkhau = req.body.mat_khau;
    var ho_ten = req.body.ho_ten;
    var email = req.body.email;
    var dia_chi = req.body.dia_chi;
    var so_dt = req.body.so_dt;
    console.log(tendn);
    console.log(ho_ten);
    var kq = await csdl.DangKy(tendn, matkhau, ho_ten, email, dia_chi, so_dt);
    await XuatDuLieu(req, res);
});
router.post("/dangnhap", async function (req, res) {
    var tendn = req.body.ten_dn;
    var matkhau = req.body.mat_khau;
    var kq = await csdl.DangNhap(tendn, matkhau);
    if (kq == 0) 
        req.session.kh = "";
    else
        req.session.kh = kq;
    await XuatDuLieu(req, res);
});

router.post("/dathang", async function (req, res) {
    var makh = req.body.ho_ten;
    var ho_ten = req.body.ho_ten;
    var email = req.body.email;
    var dia_chi = req.body.dia_chi;
    var so_dt = req.body.dien_thoai;
    if (req.session.kh != undefined)
        makh = req.session.kh.TenDN;
    console.log(makh);
    giohang = req.session.giohang;
    console.log(giohang);
    if (giohang.length > 0) {
        var kq = await csdl.xulydathang(makh, ho_ten, email, dia_chi, so_dt, giohang);
        req.session.giohang = undefined;
        
    }
    await XuatDuLieu(req, res);
});
module.exports = router;
