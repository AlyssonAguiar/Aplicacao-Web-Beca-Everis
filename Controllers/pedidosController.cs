using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PizzaEverisDay.Models;

namespace PizzaEverisDay.Controllers
{
    public class PedidosController : Controller
    {
        private readonly PizzaContext _context;

        public PedidosController(PizzaContext context)
        {
            _context = context;
        }

        // GET: pedidoes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Pedido.ToListAsync());
        }



        // GET: pedidoes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pedido = await _context.Pedido
                .FirstOrDefaultAsync(m => m.IdPedido == id);
            if (pedido == null)
            {
                return NotFound();
            }

            return View(pedido);
        }

        // GET: pedidoes/Create
        public ActionResult Create()
        {
            ProdutosParaPedido lista = new ProdutosParaPedido();
            
            using (var repo = new PizzaContext())
            {
                var clientes = repo.Cliente.ToList();
                var produtos = repo.Produtos.ToList();
                lista.ListaCliente = clientes;
                lista.ListaProduto = produtos;
                return View(lista);
            }          
        }

        [HttpPost]        
        public ActionResult Cadastrar()
        {
            using (var repo = new PizzaContext())
            {
                var data = repo.Produtos.ToList();
                var listaProdutos = new List<Item>();
                decimal total = 0;
                foreach (var item in data)
                {
                    int quantidade = Convert.ToInt32(Request.Form["Produto[" + item.Id_Produto + "]"].ToString());
                    if (quantidade > 0)
                    {
                        listaProdutos.Add(new Item()
                        {
                            Id_Produto = item.Id_Produto,
                            Preco_Unitario = item.Preco,
                            Quantidade = quantidade
                        });
                    }
                        total += item.Preco * quantidade;
                }
                var pedido = new Pedido();
                pedido.CPF = Request.Form["CPF"];
                pedido.Data_Pedido = DateTime.Now.ToString();
                pedido.Forma_De_Pagamento = Request.Form["FormaPagamento"];
                pedido.Preco_Total = total;
                pedido.Status_Pedido = Request.Form["StatusDoPedido"];

                repo.Add(pedido);
                repo.SaveChanges();

                for (int i = 0; i < listaProdutos.Count; i++)
                {
                    listaProdutos[i].IdPedido = pedido.IdPedido;
                }
                repo.AddRange(listaProdutos);
                repo.SaveChanges();
            }
            return RedirectToAction("Index");
        }
         
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pedido = await _context.Pedido.FindAsync(id);
            if (pedido == null)
            {
                return NotFound();
            }
            return View(pedido);
        }

        // POST: pedidoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdPedido,CPF,Data_Pedido,Preco_Total,Forma_De_Pagamento,Status_Pedido")] Pedido pedido)
        {
            if (id != pedido.IdPedido)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(pedido);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!pedidoExists(pedido.IdPedido))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(pedido);
        }

        // GET: pedidoes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pedido = await _context.Pedido
                .FirstOrDefaultAsync(m => m.IdPedido == id);
            if (pedido == null)
            {
                return NotFound();
            }

            return View(pedido);
        }

        // POST: pedidoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var pedido = await _context.Pedido.FindAsync(id);
            _context.Pedido.Remove(pedido);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        private bool pedidoExists(int id)
        {
            return _context.Pedido.Any(e => e.IdPedido == id);
        }
    }
}
