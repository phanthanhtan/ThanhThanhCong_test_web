//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThanhThanhCong_test_web.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Vung
    {
        public Vung()
        {
            this.HopDong_ChiTiet = new HashSet<HopDong_ChiTiet>();
        }
    
        public string MaVung { get; set; }
        public string TenVung { get; set; }
    
        public virtual ICollection<HopDong_ChiTiet> HopDong_ChiTiet { get; set; }
    }
}
