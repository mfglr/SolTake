namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public static class ExtentionFinder
    {
        public static string GetExtention(string filename)
        {
            var startOfExtention = -1;
            for(int i = 0; i < filename.Length; i++)
            {
                if (filename[i] == '.')
                {
                    startOfExtention = i + 1;
                    break;
                }
            }

            if (startOfExtention == -1 || startOfExtention == filename.Length)
                throw new ExtentionNotFoundException();
            var extention = filename[startOfExtention..].Trim();
            if(extention == "")
                throw new ExtentionNotFoundException();

            return extention;
        }
    }
}
