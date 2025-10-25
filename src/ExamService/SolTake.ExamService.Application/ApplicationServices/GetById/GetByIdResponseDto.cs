namespace SolTake.ExamService.Application.ApplicationServices.GetById
{
    public record GetByIdResponseDto(string Name, string Intialism, IEnumerable<string> Subjects);
}
