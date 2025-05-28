using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class Contact
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Website { get; set; }

    public string? Email { get; set; }

    public string? Message { get; set; }

    public bool? Read { get; set; }

    public DateTime? CreatedDate { get; set; }
}
