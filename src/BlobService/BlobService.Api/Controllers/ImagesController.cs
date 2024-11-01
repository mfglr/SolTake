using BlobService.Application;
using BlobService.Application.Objects;
using Microsoft.AspNetCore.Mvc;

namespace BlobService.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImagesController(IImageService imageService) : ControllerBase
    {
        private readonly IImageService _imageService = imageService;

        [HttpPost]
        public Task<AppImage> UpdateUserImage([FromForm]Guid userId, [FromForm]IFormFile file)
            => _imageService.UploadAsync()
    }
}
