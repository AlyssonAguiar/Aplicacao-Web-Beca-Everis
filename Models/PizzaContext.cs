using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PizzaEverisDay.Models;

namespace PizzaEverisDay.Models
{
    public class PizzaContext : DbContext
    {

        public DbSet<Pedido> Pedido { get; set; }
        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<Endereco> Endereco { get; set; }
        public DbSet<Produtos> Produtos { get; set; }
        public DbSet<Cidade> Cidade { get; set; }
        public virtual DbSet<Cliente_Has_Endereco> Cliente_Has_Endereco { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=LAPTOP-JPN4FCGK\MSSQLSERVER2;Initial Catalog=Pizza;Integrated Security=True");
        }

        public DbSet<PizzaEverisDay.Models.Item> Item { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cliente_Has_Endereco>().HasKey(vf => new { vf.CPF, vf.IdEndereco });
        }
        

        
    }
}