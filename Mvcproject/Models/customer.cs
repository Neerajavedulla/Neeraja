//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Mvcproject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class customer
    {
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CompanyName { get; set; }
        public Nullable<int> PhoneNumber { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public Nullable<int> ZipCode { get; set; }
        public Nullable<int> ProductID { get; set; }
    
        public virtual Product Product { get; set; }
    }
}
