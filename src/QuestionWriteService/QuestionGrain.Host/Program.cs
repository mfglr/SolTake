using Orleans;
using Orleans.Configuration;
using Orleans.Hosting;
using QuestionWriteService.Infrastructure;
using System.Net;

var silo = new SiloHostBuilder()
    .ConfigureApplicationParts(options =>
    {
        options.AddFromApplicationBaseDirectory();
        options.AddApplicationPart(typeof(QuestionGrain).Assembly).WithReferences();
    })
    .UseLocalhostClustering()
    .ConfigureEndpoints(IPAddress.Loopback, 11111, 30000)
    .Configure<ClusterOptions>(options =>
    {
        options.ClusterId = "dev";
        options.ServiceId = "Question";
    })
    .Build();

await silo.StartAsync();

Console.ReadLine();

await silo.StopAsync();