using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionImageBlobService(IQuestionImageBlobNameGenerator generator) : IQuestionImageBlobService
    {

        private static readonly string _rootPath = "Images";
        private static readonly string _containerName = "QuestionImages";
        private string GetPath(string blobName) => $"{_rootPath}/{_containerName}/{blobName}";
        
        private readonly IQuestionImageBlobNameGenerator _generator = generator;

        private async Task<string> UploadAsync(Stream stream, CancellationToken cancellationToken)
        {
            var blobName = _generator.Generate();
            var path = GetPath(blobName);
            try
            {
                using var fileStream = File.Create(path);
                await stream.CopyToAsync(fileStream, cancellationToken);
            }
            catch (Exception)
            {
                if (File.Exists(path))
                    File.Delete(path);
                throw;
            }
            return blobName;
        }

        public async Task<List<string>> UpdloadAsync(IEnumerable<Stream> streams,CancellationToken cancellationToken)
        {
            List<string> blobNames = [];
            try
            {
                foreach (var stream in streams)
                    blobNames.Add(await UploadAsync(stream, cancellationToken));
            }
            catch (Exception)
            {
                foreach(var blobName in blobNames)
                {
                    var path = GetPath(blobName);
                    if (File.Exists(path))
                        File.Delete(path);
                }
                throw;
            }

            return blobNames;
        }

        public Stream Read(string blobName) => File.OpenRead(GetPath(blobName));
    }
}
