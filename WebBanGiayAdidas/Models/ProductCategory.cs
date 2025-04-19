using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class ProductCategory
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public string? Icon { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? ModifierDate { get; set; }

    public string? ModifierBy { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
