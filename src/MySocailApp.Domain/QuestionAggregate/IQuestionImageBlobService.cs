namespace MySocailApp.Domain.QuestionAggregate
{
    public interface IQuestionImageBlobService
    {
        Task<List<string>> UpdloadAsync(IEnumerable<Stream> streams, CancellationToken cancellationToken);
        Stream Read(string blobName);
    }
}
