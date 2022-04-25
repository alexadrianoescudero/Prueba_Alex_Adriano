using DatosAdriano.Data;
using Microsoft.EntityFrameworkCore;

namespace PruebasAdriano
{
    public class BasePrueba
    {
        protected AdrianoBaseContext ConstruirContext(string nombrebd)
        {
            var option = new DbContextOptionsBuilder<AdrianoBaseContext>()
                .UseInMemoryDatabase(nombrebd).Options;

            var dbContext = new AdrianoBaseContext(option);
            return dbContext;
        }
    }
}
