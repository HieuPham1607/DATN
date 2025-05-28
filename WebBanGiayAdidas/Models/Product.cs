using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class Product
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Alias { get; set; } = null!;

    public int? ProductCategoryId { get; set; }

    public string? ProductCode { get; set; }

    public string? Description { get; set; }

    public string? Detail { get; set; }

    public string? Image { get; set; }

    public decimal? Price { get; set; }

    public decimal? PriceSale { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? ModifierDate { get; set; }

    public string? ModifierBy { get; set; }

    public bool IsActive { get; set; }

    public bool IsHome { get; set; }

    public bool IsHot { get; set; }

    public bool IsFeature { get; set; }

    public bool IsSale { get; set; }

    public int? ShoeColorId { get; set; }

    public int? ProductGroupId { get; set; }

    public virtual ICollection<ChildImage> ChildImages { get; set; } = new List<ChildImage>();

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ProductCategory? ProductCategory { get; set; }

    public virtual ICollection<ProductSize> ProductSizes { get; set; } = new List<ProductSize>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();

    public virtual ShoeColor? ShoeColor { get; set; }
}
