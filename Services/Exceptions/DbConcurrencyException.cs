using System;

namespace PizzaEverisDay.Services.Excessoes
{
    public class DbConcurrencyException : ApplicationException
    {
        public DbConcurrencyException(string message) : base(message)
        {

        }
    }
}
