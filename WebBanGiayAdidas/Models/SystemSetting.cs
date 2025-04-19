using System;
using System.Collections.Generic;

namespace WebBanGiayAdidas.Models;

public partial class SystemSetting
{
    public string SettingKey { get; set; } = null!;

    public string? SettingValue { get; set; }

    public string? SettingDescription { get; set; }
}
