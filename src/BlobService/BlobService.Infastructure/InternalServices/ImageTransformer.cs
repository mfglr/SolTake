using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Metadata.Profiles.Exif;
using SixLabors.ImageSharp.Processing;

namespace BlobService.Infastructure.InternalServices
{
    internal static class ImageTransformer
    {
        public static void Transform(Image image)
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
    }
}
