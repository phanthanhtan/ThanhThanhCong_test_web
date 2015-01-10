using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThanhThanhCong_test_web.Models;

namespace ThanhThanhCong_test_web.Controllers
{
    public class HopDongController : Controller
    {
        //
        // GET: /HopDong/
        private TTC_HopDongThueDatEntities entity = new TTC_HopDongThueDatEntities();

        public ActionResult Index(string id)//id để kiểm tra là load mới hay load sau khi xóa
        {
            if (id != null)
                ViewBag.Index_Xoa = id;
            else
                ViewBag.Index_Xoa = "Index";
            try
            {
                ViewBag.ListHopDong = entity.HopDong.ToList();
                int count = ((List<HopDong>)ViewBag.ListHopDong).Count;
                if (count > 0)
                    ViewBag.Ok = "Index1";//có list HopDong
                else
                    ViewBag.Ok = "Index2";//chưa có HopDong nào/list HopDong null
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
            return View("FormHopDong");
        }

        public ActionResult test()
        {
            return View();
        }
    }
}
