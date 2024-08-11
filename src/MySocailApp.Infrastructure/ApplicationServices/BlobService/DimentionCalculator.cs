using MySocailApp.Application.ApplicationServices.BlobService;
using SixLabors.ImageSharp.Metadata.Profiles.Exif;
using SixLabors.ImageSharp.Processing;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class DimentionCalculator : IDimentionCalculator
    {
        //*
        private void TransformImage(SixLabors.ImageSharp.Image image,ushort orentation)
        {
            switch (orentation)
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

        public Dimention Calculate(Stream stream)
        {
            using var image = SixLabors.ImageSharp.Image.Load(stream);
            var profile = image.Metadata.ExifProfile;
            
            if(profile != null && profile.TryGetValue(ExifTag.Orientation, out var value))
                TransformImage(image, value.Value);
            
            return new(image.Height, image.Width);
        }
    }
}
