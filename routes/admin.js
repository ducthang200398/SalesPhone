var express = require('express');
var router = express.Router();
var csdl=require('../data-process/csdl');
var http = require('http');
var url = require('url');
const bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var session = require('express-session');
router.use(session({ secret: "Shh, its a secret!" }));
/* GET users listing. */
router.get('/', async function(req, res, next) { 
var q = url.parse(req.url, true).query;
if (q.themdt == undefined) {
    if (q.xulydonhang != undefined){
            if(q.sodhdoi!=undefined)
            {   console.log("thanh cong123");
                var sodhdoi=q.sodhdoi;
                console.log(sodhdoi);
                var kq = await csdl.DoiTrangThai(sodhdoi);
                console.log("thanh cong 456");
            }
        var dsldt = await csdl.HienThiLoaiDTadmin();
        var dsdt = await csdl.HienThiDonHangadmin()
        res.render("admin", { title: "Phone Online", dsldt:dsldt, dsdt: dsdt})}
    else if (q.suasp != undefined)
    {
        var suadt = q.suadt;
        var tendt = q.tendt;
        var gia = q.gia;
        var maloai = q.maloai;
        var mota=q.mota
        var hinh=q.hinh
        res.render("updatesp", {
            suadt: suadt, tendt:tendt,gia:gia,
            maloai: maloai, mota: mota,hinh:hinh
        });
     }
    else if(q.xoasp!=undefined)
    {   var xoadt = q.xoadt;
        console.log(xoadt);
        var kq=await csdl.XoaDT(xoadt);
        console.log(kq);
        if (kq == true)
            res.send("Xóa điện thoại thành công.");
        else
            res.send("Xóa điện thoại thất bại.");
    }
    else{
        dsldt = await csdl.HienThiLoaiDTadmin();
        var maloai = 0;
        var tenloai = "Danh Sach Dien Thoai";
        if (q.maloai != undefined) {
            maloai = q.maloai;
            dsdt = await csdl.HienThiDTadmin(maloai);
            res.render("admin", { title: "Phone Online", dsldt:dsldt, dsdt: dsdt });
        }
        else {
            dsdt = await csdl.HienThiDTadmin(maloai);
            res.render("admin", { title: "Phone Online", dsldt:dsldt, dsdt: dsdt })};
    } 
}
else {
   var dsldt = await csdl.HienThiLoaiDTCombox();
    res.render("insertdt", {dsldt: dsldt});
}



});
//upload file
var multer = require("multer");
// SET STORAGE
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public\\image')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
})
var upload = multer({ storage: storage })
router.post('/ThemDT', upload.single('file'), async function (req, res)  {
    const file = req.file
    if (!file) {
        const error = new Error('Please upload a file')

    }
    else {
        var madt = req.body.madt;
        console.log(madt);
        var tendt = req.body.ten_dt;
        console.log(tendt);
        var mota = req.body.mota;
        console.log(mota);
        var loai = req.body.loai;
        console.log(loai);
        var hinh = req.file.filename;
        console.log(hinh);
        var giaban = req.body.gia_ban;
        console.log(giaban);
        var kq = await csdl.ThemDT(madt, tendt, loai,giaban,hinh,mota);
        console.log(kq);
        if (kq == true)
            res.send("Insert thang cong");
        else
            res.send("Insert that bai");
    }
});
router.post('/SuaDT', upload.single('file'), async function (req, res)  {
    const file = req.file
    if (!file) {
        const error = new Error('Please upload a file')
  
    }
    else {
        
        var madt = req.body.suadt;
        console.log(madt);
        var tendt = req.body.tendt;
        console.log(tendt);
        var mota = req.body.mota;
        console.log(mota);
        var loai = req.body.maloai;
        console.log(loai);
        var hinh = req.file.filename;
        console.log(hinh);
        var giaban = req.body.gia;
        console.log(giaban);
        var kq = await csdl.SuaDT(madt, tendt, loai,giaban,hinh,mota);
        console.log(kq);
        if (kq == true)
            res.send("update thang cong");
        else
            res.send("update that bai");
    }
  }
);
module.exports = router;



        


   
    

