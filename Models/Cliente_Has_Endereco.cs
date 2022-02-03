using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaEverisDay.Models
{
        
    public class Cliente_Has_Endereco
    {
        [Key]
        public string CPF { get; set; }
        [Key]
        public int IdEndereco { get; set; }


    }
}
