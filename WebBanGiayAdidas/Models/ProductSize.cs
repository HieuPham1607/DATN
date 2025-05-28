using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class ProductSize
{
    public int Id { get; set; }

    public int? ProductId { get; set; }

    public string? Size { get; set; }

    public int? Quantity { get; set; }

    public virtual Product? Product { get; set; }
}
