using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class Category
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string? SeoTitle { get; set; }

    public string? SeoDescripyion { get; set; }

    public string? SeoKeywords { get; set; }

    public string? Description { get; set; }

    public int? Position { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? ModifierDate { get; set; }

    public string? ModifierBy { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<New> News { get; set; } = new List<New>();

    public virtual ICollection<Post> Posts { get; set; } = new List<Post>();
}
