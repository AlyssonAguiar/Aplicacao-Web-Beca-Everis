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
    public class ClientesController : Controller
    {
        private readonly PizzaContext _context;

        public ClientesController(PizzaContext context)
        {
            _context = context;
        }

        // GET: Clientes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Cliente.ToListAsync());
        }

        // GET: Clientes/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ProdutosParaPedido edit = RetornaCidades();
            edit.cliente = await _context.Cliente.FindAsync(id);
            var existe = _context.Cliente_Has_Endereco.ToList().Where(x => x.CPF == edit.cliente.CPF).First();
            edit.endereco = await _context.Endereco.FindAsync(existe.IdEndereco);
            

            return View(edit);
        }

        public ActionResult Create()
        {
            return View(RetornaCidades());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(string nome, string data_Nascimento, string telefone, string cpf, string logradouro, int numero, string complemento, string bairro, string cep)
        {
         
           

            Endereco endereco = new Endereco();
            endereco.Logradouro = logradouro;
            endereco.Numero = numero;
            endereco.Complemento = complemento;
            endereco.Bairro = bairro;
            endereco.CEP = cep;
            endereco.IdCidade = Convert.ToInt32(Request.Form["IdCidade"]);

            Cliente cliente = new Cliente();
            cliente.Nome = nome;
            cliente.Data_Nascimento = data_Nascimento;
            cliente.Telefone = telefone;
            cliente.CPF = cpf;
            using (var repo = new PizzaContext())
            {
                repo.Add(cliente);
                repo.Add(endereco);
                repo.SaveChanges();
            }
            Cliente_Has_Endereco clienteE = new Cliente_Has_Endereco();
            clienteE.CPF = cpf;
            clienteE.IdEndereco = endereco.IdEndereco;
            using (var repo = new PizzaContext())
            {
                repo.Add(clienteE);                
                repo.SaveChanges();
            }
            return View(RetornaCidades());
        }
        public ProdutosParaPedido RetornaCidades()
        {
            ProdutosParaPedido listaCidade = new ProdutosParaPedido();

            using (var repo = new PizzaContext())
            {
                var cidade = repo.Cidade.ToList();
                listaCidade.ListaCidade = cidade;
            }
            return listaCidade;
        }

        // GET: Clientes/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            ProdutosParaPedido edit = RetornaCidades();
            edit.cliente = await _context.Cliente.FindAsync(id);
            var existe = _context.Cliente_Has_Endereco.ToList().Where(x => x.CPF == edit.cliente.CPF).First();
            edit.endereco = await _context.Endereco.FindAsync(existe.IdEndereco);

            var cliente = await _context.Cliente.FindAsync(id);
            if (cliente == null)
            {
                return NotFound();
            }
            return View(edit);
        }

        // POST: Clientes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("CPF,Nome,Data_Nascimento,Telefone")] Cliente cliente, 
            [Bind("IdEndereco,Logradouro,Numero,Complemento,Bairro, CEP")] Endereco endereco, string IdCidade)
        {
            endereco.IdCidade = Convert.ToInt32(Request.Form["IdCidade"]);
            if (id != cliente.CPF)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cliente);
                    _context.Update(endereco);
                    await _context.SaveChangesAsync();
                    
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ClienteExists(cliente.CPF))
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
            return View(cliente);
        }

        // GET: Clientes/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cliente = await _context.Cliente
           .FirstOrDefaultAsync(m => m.CPF == id);
            if (cliente == null)
            {
                return NotFound();
            }

            return View(cliente);
        }

        // POST: Clientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var cliente = await _context.Cliente.FindAsync(id);
            _context.Cliente.Remove(cliente);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        private bool ClienteExists(string id)
        {
            return _context.Cliente.Any(e => e.CPF == id);
        }
    }
}