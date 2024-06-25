using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace MySocialApp.Api.Tests.AccountAggregate
{
    class Application : WebApplicationFactory<Program>
    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            var database = $"test{Guid.NewGuid()}";
            var connectionString = $"Data Source=THENQLV;Initial Catalog={database};Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False";

            var initialData = new Dictionary<string, string>
            {
                { "ConnectionStrings:SqlServer", connectionString }
            };

            var configuration = new ConfigurationBuilder()
                .AddInMemoryCollection(initialData!)
                .Build();

            builder
                .UseConfiguration(configuration)
                .ConfigureAppConfiguration(c => c.AddInMemoryCollection(initialData!));
        }
    }
}
