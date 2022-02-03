using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaEverisDay.Models
{
    public class ProdutosParaPedido
    {
        public List<Produtos> ListaProduto = new List<Produtos>();
        public List<Cliente> ListaCliente = new List<Cliente>();
        public List<Cidade> ListaCidade = new List<Cidade>();
        public Endereco endereco = new Endereco();
        public Cliente cliente = new Cliente();
            
    }
}


