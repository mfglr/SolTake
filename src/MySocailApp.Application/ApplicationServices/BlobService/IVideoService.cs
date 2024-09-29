using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IVideoService
    {
        Task<AppVideo> SaveAsync(IFormFile file, CancellationToken cancellationToken);
        void RollBack();
    }
}
