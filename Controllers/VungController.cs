using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThanhThanhCong_test_web.Models;

namespace ThanhThanhCong_test_web.Controllers
{
    public class VungController : Controller
    {
        //
        // GET: /Vung/
        private TTC_HopDongThueDatEntities entity = new TTC_HopDongThueDatEntities();

        public ActionResult Index(string id)//id để kiểm tra là load mới hay load sau khi xóa
        {
            if (id != null)
                ViewBag.Index_Xoa = id;
            else
                ViewBag.Index_Xoa = "Index";
            try
            {
                ViewBag.ListVung = entity.Vung.ToList();
                int count = ((List<Vung>)ViewBag.ListVung).Count;
                if (count > 0)
                    ViewBag.Ok = "Index1";//có list vùng
                else
                    ViewBag.Ok = "Index2";//chưa có vùng nào/list vùng null
            }
            catch
            {
                ViewBag.Ok = "Index3";//lỗi
            }
            return View();
        }

        public ActionResult Them()
        {
            ViewBag.Ok = "Them";
            ViewBag.Action = "Them";
            return View("FormVung");
        }
        [HttpPost]
        public ActionResult ThemForm(FormCollection fc)
        {
            ViewBag.Action = "Them";
            try
            {
                Vung v = new Vung();
                v.MaVung = fc["txtMaVung"].ToString();
                v.TenVung = fc["txtTenVung"].ToString();
                entity.Vung.Add(v);
                entity.SaveChanges();
                ViewBag.Ok = "ThemOk";
            }
            catch
            {
                ViewBag.Ok = "ThemError";
            }
            return View("FormVung");
        }

        public ActionResult Sua(string id)//id là MaVung
        {
            ViewBag.Ok = "Sua";
            ViewBag.Action = "Sua";
            try
            {
                Vung vung = entity.Vung.Where(item => item.MaVung == id).FirstOrDefault();
                if (vung != null)
                    ViewBag.Vung = vung;
                else
                {
                    ViewBag.Ok = "SuaNull";
                    ViewBag.Vung = null;
                }
            }
            catch
            {
                ViewBag.Ok = "SuaGetDataError";
                ViewBag.Vung = null;
            }
            return View("FormVung");
        }
        [HttpPost]
        public ActionResult SuaForm(FormCollection fc)
        {
            ViewBag.Action = "Sua";
            try
            {
                Vung v = new Vung();
                v.MaVung = fc["txtMaVung"].ToString();
                v.TenVung = fc["txtTenVung"].ToString();
                entity.Vung.Attach(v);
                entity.Entry(v).State = EntityState.Modified;
                entity.SaveChanges();
                ViewBag.Ok = "SuaOk";

                ViewBag.Vung = entity.Vung.Where(item => item.MaVung == v.MaVung).FirstOrDefault();
            }
            catch
            {
                ViewBag.Ok = "SuaError";
            }
            return View("FormVung");
        }

        public ActionResult Xoa(string id)//id là MaVung
        {
            try
            {
                Vung vung = entity.Vung.Where(item => item.MaVung == id).FirstOrDefault();
                if (vung != null)
                {
                    HopDong_ChiTiet hd_ct = entity.HopDong_ChiTiet.Where(item => item.MaVung == id).FirstOrDefault();
                    if (hd_ct != null)
                        return RedirectToAction("Index/Xoa_Exist");
                    else
                    {
                        try
                        {
                            Vung v = entity.Vung.Single(item => item.MaVung == id);
                            entity.Vung.Remove(v);
                            entity.SaveChanges();
                            return RedirectToAction("Index/XoaOk");
                        }
                        catch
                        {
                            return RedirectToAction("Index/XoaError");
                        }
                    }
                }
                else
                    return RedirectToAction("Index/XoaNull");
            }
            catch
            {
                return RedirectToAction("Index/XoaError");
            }
        }


    }
}
