using DatosAdriano.Model;
using Microsoft.EntityFrameworkCore;


namespace DatosAdriano.Data
{
    public partial class AdrianoBaseContext : DbContext
    {

        public AdrianoBaseContext(DbContextOptions<AdrianoBaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cliente> Clientes { get; set; }
        public virtual DbSet<Cuenta> Cuentas { get; set; }
        public virtual DbSet<Movimiento> Movimientos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.ClIdCliente)
                    .HasName("PK__cliente__0ED7ADE5641E56A2");

                entity.ToTable("cliente");

                entity.Property(e => e.ClIdCliente).HasColumnName("cl_id_cliente");

                entity.Property(e => e.ClContrasenia)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cl_contrasenia");

                entity.Property(e => e.PDireccion)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("cl_direccion");

                entity.Property(e => e.PEdad).HasColumnName("cl_edad");

                entity.Property(e => e.ClEstado).HasColumnName("cl_estado");

                entity.Property(e => e.PGenero)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cl_genero");

                entity.Property(e => e.PIdentificacion)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cl_identificacion");

                entity.Property(e => e.PNombre)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cl_nombre");

                entity.Property(e => e.PTelefono)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("cl_telefono");
            });

            modelBuilder.Entity<Cuenta>(entity =>
            {
                entity.HasKey(e => e.CuNumeroCuenta)
                    .HasName("PK__cuentas__5138EEC71FAE4CF6");

                entity.ToTable("cuentas");

                entity.Property(e => e.CuNumeroCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cu_numero_cuenta");

                entity.Property(e => e.CuEstado).HasColumnName("cu_estado");

                entity.Property(e => e.CuIdCliente).HasColumnName("cu_id_cliente");

                entity.Property(e => e.CuTipo)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cu_tipo");

                entity.HasOne(d => d.CuIdClienteNavigation)
                    .WithMany(p => p.Cuenta)
                    .HasForeignKey(d => d.CuIdCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__cuentas__cu_id_c__286302EC");
            });

            modelBuilder.Entity<Movimiento>(entity =>
            {
                entity.HasKey(e => e.MoIdMovimiento)
                    .HasName("PK__movimien__2D96FD74D4DB75A6");

                entity.ToTable("movimientos");

                entity.Property(e => e.MoIdMovimiento).HasColumnName("mo_id_movimiento");

                entity.Property(e => e.MoFecha)
                    .HasColumnType("datetime")
                    .HasColumnName("mo_fecha");

                entity.Property(e => e.MoMovimiento)
                    .HasColumnType("money")
                    .HasColumnName("mo_movimiento");

                entity.Property(e => e.MoNumeroCuenta)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("mo_numero_cuenta");

                entity.Property(e => e.MoSaldoDisponible)
                    .HasColumnType("money")
                    .HasColumnName("mo_saldo_disponible");

                entity.Property(e => e.MoSaldoInicial)
                    .HasColumnType("money")
                    .HasColumnName("mo_saldo_inicial");

                entity.Property(e => e.MoTipoMovimiento)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("mo_tipo_movimiento");

                entity.HasOne(d => d.MoNumeroCuentaNavigation)
                    .WithMany(p => p.Movimientos)
                    .HasForeignKey(d => d.MoNumeroCuenta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_movimientos_cuentas");
            });
        }
    }
}
