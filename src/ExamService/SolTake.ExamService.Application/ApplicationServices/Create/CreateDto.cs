namespace SolTake.ExamService.Application.ApplicationServices.Create
{
    public record CreateDto(string Country, string Name, string Initialism, IEnumerable<Guid> Subjects);
}
