using Microsoft.AspNetCore.Mvc;
using PizzaEverisDay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaEverisDay.Controllers
{
    public class ProdutoController : Controller
    {
        [HttpGet]
        public ActionResult Read()
        {
            using (var repo = new PizzaContext())
            {
                var data = repo.Produtos.ToList();
                return View(data);
            }
        }
    }
}
