using DatosAdriano.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ServicioAdriano.Controllers;
using System;
using System.Threading.Tasks;

namespace PruebasAdriano
{
    [TestClass]
    public class ClientesControllerTest : BasePrueba
    {
        [TestMethod]
        public async Task ObtenerCliente()
        {
            //prepacion
            string nombreBD = Guid.NewGuid().ToString();
            var contexto = ConstruirContext(nombreBD);

            contexto.Clientes.Add(new Cliente()
            {
                PIdentificacion = "0604434571",
                ClContrasenia = "1234",
                ClEstado = true,
                PNombre = "Alex Escudero",
                PGenero = "Masculino",
                PEdad = 27,
                PDireccion = "quito",
                PTelefono = "0945736789"
            });
            contexto.Clientes.Add(new Cliente()
            {
                PIdentificacion = "1704434231",
                ClContrasenia = "4321",
                ClEstado = true,
                PNombre = "Pedro Alvares",
                PGenero = "Masculino",
                PEdad = 27,
                PDireccion = "Guayaquil",
                PTelefono = "0914536789"
            });
            await contexto.SaveChangesAsync();

            var contexto2 = ConstruirContext(nombreBD);

            //Prueba
            var controlador = new ClientesController(contexto2);
            var respuesta = await controlador.GetPClientes();
            //verificacion
            var cliente = respuesta.Value;
            Assert.AreEqual(2, cliente.Count);

        }
        [TestMethod]
        public async Task ObtenerMovimiento()
        {
            //prepacion
            string nombreBD = Guid.NewGuid().ToString();
            var contexto = ConstruirContext(nombreBD);

            contexto.Movimientos.Add(new Movimiento()
            {
                MoNumeroCuenta = "2324442",
                MoFecha = DateTime.Now,
                MoTipoMovimiento = "Deposito",
                MoSaldoInicial = 1000,
                MoMovimiento = 100,
                MoSaldoDisponible = 1100

            });
            contexto.Movimientos.Add(new Movimiento()
            {
                MoNumeroCuenta = "232222",
                MoFecha = DateTime.Now,
                MoTipoMovimiento = "Retiro",
                MoSaldoInicial = 1000,
                MoMovimiento = 200,
                MoSaldoDisponible = 800

            });
            await contexto.SaveChangesAsync();

            var contexto2 = ConstruirContext(nombreBD);

            //Prueba
            var controlador = new MovimientosController(contexto2);
            var respuesta = await controlador.GetPMovimientos();
            //verificacion
            var cliente = respuesta.Value;
            Assert.AreEqual(2, cliente.Count);

        }

    }
}

