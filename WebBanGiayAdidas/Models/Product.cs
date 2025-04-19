using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebBanGiayAdidas.Models;

public partial class Product
{
    public int Id { get; set; }
    [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
    public string Title { get; set; } = null!;

    public int? ProductCategoryId { get; set; }

    public string? ProductCode { get; set; }

    public string? Description { get; set; }

    public string? Detail { get; set; }

    public string? Image { get; set; }
    [Range(0, double.MaxValue, ErrorMessage = "Giá sản phẩm phải >= 0")]
    public decimal? Price { get; set; }
    [Range(0, double.MaxValue, ErrorMessage = "Giá khuyến mãi phải >= 0")]
    public decimal? PriceSale { get; set; }
    [Range(0, int.MaxValue, ErrorMessage = "Số lượng phải >= 0")]
    public int? Quantity { get; set; }

    public string? SeoTitle { get; set; }

    public string? SeoDescripyion { get; set; }

    public string? SeoKeywords { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? ModifierDate { get; set; }

    public string? ModifierBy { get; set; }

    public bool IsActive { get; set; }

    public bool IsHome { get; set; }

    public bool IsHot { get; set; }

    public bool IsFeature { get; set; }

    public bool IsSale { get; set; }

    public virtual ICollection<ChildImage> ChildImages { get; set; } = new List<ChildImage>();

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ProductCategory? ProductCategory { get; set; }
}
