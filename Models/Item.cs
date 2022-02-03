using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaEverisDay.Models
{
    public class Item
    {
        [Key]
        public int IdItem { get; set; }
        public int IdPedido { get; set; }
        public int Quantidade { get; set; }
        [Display(Name = "Preço Unitário")]
        public decimal Preco_Unitario { get; set; }
        public int Id_Produto { get; set; }

    }
}
