using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.BlobService.Application.ApplicationServices.CreateContainer;
using SolTake.BlobService.Application.ApplicationServices.DeleteBlob;
using SolTake.BlobService.Application.ApplicationServices.GetBlob;
using SolTake.BlobService.Application.ApplicationServices.UploadBlob;
using SolTake.BlobService.Application.ApplicationServices.UploadSingleBlob;

namespace SolTake.BlobService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddBlobApplicationServices(this IServiceCollection services) => 
            services
                .AddMediator(cfg => {
                    cfg.AddConsumer<UploadBlobHandler>();
                    cfg.AddConsumer<UploadSingleBlobHandler>();
                    cfg.AddConsumer<DeleteBlobHandler>();
                    cfg.AddConsumer<GetBlobHandler>();
                    cfg.AddConsumer<CreateContainerHandler>();
                });
    }
}
