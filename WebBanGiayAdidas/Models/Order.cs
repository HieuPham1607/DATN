using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class Order
{
    public int Id { get; set; }

    public int? UserId { get; set; }

    public string? OrderCode { get; set; }

    public string? CustomerName { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public decimal? TotalAmount { get; set; }

    public int? Quantity { get; set; }

    public int? Payment { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual User? User { get; set; }
}
