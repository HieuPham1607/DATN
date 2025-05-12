namespace WebBanGiayAdidas.Models
{
	public class ShopCart
	{
		public List<ShopCartItem> items { get; set; }
		public ShopCart() 
		{
			this.items = new List<ShopCartItem>();
		}
		public void AddToCart(ShopCartItem item,int quantity)
		{
			var checkExits= items.FirstOrDefault(x=>x.Id == item.Id);
			if (checkExits != null)
			{
				checkExits.Quantity += quantity;
				checkExits.TotalPrice = checkExits.Price * checkExits.Quantity;
			}
			else 
			{
				items.Add(item);
			}
		}
		public void Remove(int id)
		{
			var checkExits = items.SingleOrDefault(x=>x.Id == id);
			if (checkExits != null)
			{
				items.Remove(checkExits);
			}
		}
        public void Update(int id, int quantity)
        {
            var existing = items.SingleOrDefault(x => x.Id == id);
            if (existing != null)
            {
                existing.Quantity = quantity;
                existing.TotalPrice = existing.Price * quantity;
            }
        }

        public decimal GetTotalPrice()
		{
			return items.Sum(x => x.TotalPrice);
		}
		public decimal GetTotalQuantity()
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
		public decimal Price { get; set; }
		public decimal TotalPrice { get; set; }
	}
}
