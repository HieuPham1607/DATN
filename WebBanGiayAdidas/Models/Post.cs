using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class Post
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Alias { get; set; } = null!;

    public string? Description { get; set; }

    public string? Detail { get; set; }

    public string? Image { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? ModifierDate { get; set; }

    public string? ModifierBy { get; set; }

    public bool IsActive { get; set; }
}
