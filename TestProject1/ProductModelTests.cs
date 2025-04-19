using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using WebBanGiayAdidas.Models;

namespace WebBanGiayAdidas.Tests.Models
{
    [TestClass]
    public class ProductModelTests
    {
        private List<ValidationResult> ValidateModel(object model)
        {
            var results = new List<ValidationResult>();
            var context = new ValidationContext(model, null, null);
            Validator.TryValidateObject(model, context, results, true);
            return results;
        }

        [TestMethod]
        public void Product_Title_Is_Required()
        {
            var product = new Product
            {
                Title = "", // Không hợp lệ
                Price = 500,
                Quantity = 10
            };

            var results = ValidateModel(product);

            Assert.IsTrue(results.Any(v => v.ErrorMessage.Contains("Tên sản phẩm không được để trống")));
        }

        [TestMethod]
        public void Product_Price_Cannot_Be_Negative()
        {
            var product = new Product
            {
                Title = "Adidas ZX",
                Price = -10, // Không hợp lệ
                Quantity = 5
            };

            var results = ValidateModel(product);

            Assert.IsTrue(results.Any(v => v.ErrorMessage.Contains("Giá sản phẩm phải >= 0")));
        }

        [TestMethod]
        public void Product_Quantity_Cannot_Be_Negative()
        {
            var product = new Product
            {
                Title = "Adidas Ultra Boost",
                Price = 200,
                Quantity = -3 // Không hợp lệ
            };

            var results = ValidateModel(product);

            Assert.IsTrue(results.Any(v => v.ErrorMessage.Contains("Số lượng phải >= 0")));
        }

        [TestMethod]
        public void Product_Model_Is_Valid_With_Correct_Data()
        {
            var product = new Product
            {
                Title = "Adidas NMD R1",
                Price = 250,
                PriceSale = 200,
                Quantity = 10
            };

            var results = ValidateModel(product);

            Assert.AreEqual(0, results.Count); // Không có lỗi
        }
    }
}
