using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Abstracts
{
    public interface ISolutionUserSaveWriteRepository
    {
        Task CreateAsync(SolutionUserSave solutionUserSave, CancellationToken cancellationToken);
        void Delete(SolutionUserSave solutionUserSave);
        void DeleteRange(IEnumerable<SolutionUserSave> solutionUserSaves);

        Task<SolutionUserSave?> GetAsync(int solutionId, int userId, CancellationToken cancellationToken);
        Task<List<SolutionUserSave>> GetByUserId(int userId,CancellationToken cancellationToken);
    }
}
