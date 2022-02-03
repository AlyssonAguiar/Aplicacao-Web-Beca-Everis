using System;

namespace PizzaEverisDay.Services.Excessoes
{
    public class NotFoundException : ApplicationException
    {
        public NotFoundException(string message) : base(message)
        {

        }
    }
}
