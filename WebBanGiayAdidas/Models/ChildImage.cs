using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class ChildImage
{
    public int Id { get; set; }

    public int? ProductId { get; set; }

    public string? ImagePath { get; set; }

    public virtual Product? Product { get; set; }
}
