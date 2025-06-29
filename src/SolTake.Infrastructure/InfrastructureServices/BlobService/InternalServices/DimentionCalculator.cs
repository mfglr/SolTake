﻿using Microsoft.AspNetCore.Http;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Metadata.Profiles.Exif;
using SixLabors.ImageSharp.Processing;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class DimentionCalculator
    {
        private void Transform(Image image)
        {
            var profile = image.Metadata.ExifProfile;
            if (profile == null || !profile.TryGetValue(ExifTag.Orientation, out var orientation))
                return;

            switch (orientation.Value)
            {
                case 2:
                    image.Mutate(x => x.Flip(FlipMode.Horizontal));
                    break;
                case 3:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate180));
                    break;
                case 4:
                    image.Mutate(x => x.Flip(FlipMode.Vertical));
                    break;
                case 5:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate90).Flip(FlipMode.Horizontal));
                    break;
                case 6:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate90));
                    break;
                case 7:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate270).Flip(FlipMode.Horizontal));
                    break;
                case 8:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate270));
                    break;
            }
        }

        public async Task<Dimention> CalculateAsync(IFormFile file,CancellationToken cancellationToken)
        {
            using var stream = file.OpenReadStream();
            using var image = await Image.LoadAsync(stream, cancellationToken);
            Transform(image);
            return new(image.Height, image.Width);
        }
    }
}
