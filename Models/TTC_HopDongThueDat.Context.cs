﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TTC_HopDongThueDatEntities : DbContext
    {
        public TTC_HopDongThueDatEntities()
            : base("name=TTC_HopDongThueDatEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<HopDong> HopDong { get; set; }
        public DbSet<HopDong_ChiTiet> HopDong_ChiTiet { get; set; }
        public DbSet<sysdiagrams> sysdiagrams { get; set; }
        public DbSet<Vung> Vung { get; set; }
    }
}
