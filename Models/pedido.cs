using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaEverisDay.Models
{
    public class Pedido
    {
        [Key]
        [Display(Name = "Pedido nº")]
        public int IdPedido { get; set; }

        [StringLength(11, MinimumLength = 11, ErrorMessage = "CPF composto de 11 dígitos")]
        [Required]
        [RegularExpression(@"\d+", ErrorMessage = "Informe um CPF composto apenas de números")]
        public string CPF { get; set; }

        [Required]
        [Display(Name = "Data")]
        public string Data_Pedido { get; set; }

        [Column(TypeName = "decimal(18, 2)")]
        [Display(Name = "Total")]
        public decimal Preco_Total { get; set; }

        [Required]
        [Display(Name = "Forma de Pagamento")]
        public string Forma_De_Pagamento { get; set; }

        [Display(Name = "Status do Pedido")]
        public string Status_Pedido { get; set; }
    }
}
