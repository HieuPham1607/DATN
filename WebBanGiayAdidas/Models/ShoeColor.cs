using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class ShoeColor
{
    public int Id { get; set; }

    public string ColorName { get; set; } = null!;

    public string? ColorCode { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
