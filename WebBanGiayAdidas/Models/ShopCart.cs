using System.Collections.Generic;
using System.Linq;

namespace WebBanGiayAdidas.Models
{
    public class ShopCart
    {
        public List<ShopCartItem> items { get; set; }
        public ShopCart()
        {
            this.items = new List<ShopCartItem>();
        }

        // Thêm sản phẩm, phân biệt theo Id và Size
        public void AddToCart(ShopCartItem item, int quantity)
        {
            var existingItem = items.FirstOrDefault(x => x.Id == item.Id && x.Size == item.Size);
            if (existingItem != null)
            {
                existingItem.Quantity += quantity;
                existingItem.TotalPrice = existingItem.Price * existingItem.Quantity;
            }
            else
            {
                item.Quantity = quantity;
                item.TotalPrice = item.Price * quantity;
                items.Add(item);
            }
        }

        // Xóa sản phẩm theo Id và Size
        public void Remove(int id, string size)
        {
            var existingItem = items.SingleOrDefault(x => x.Id == id && x.Size == size);
            if (existingItem != null)
            {
                items.Remove(existingItem);
            }
        }

        // Cập nhật số lượng theo Id và Size
        public void Update(int id, string size, int quantity)
        {
            var existingItem = items.SingleOrDefault(x => x.Id == id && x.Size == size);
            if (existingItem != null)
            {
                existingItem.Quantity = quantity;
                existingItem.TotalPrice = existingItem.Price * quantity;
            }
        }

        public decimal GetTotalPrice()
        {
            return items.Sum(x => x.TotalPrice);
        }

        public int GetTotalQuantity()
        {
            return items.Sum(x => x.Quantity);
        }

        public void ClearCart()
        {
            items.Clear();
        }
    }

    public class ShopCartItem
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Alias { get; set; }
        public string? CateName { get; set; }
        public string? Img { get; set; }
        public int Quantity { get; set; }
        public string? Size { get; set; }
        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }
    }
}
