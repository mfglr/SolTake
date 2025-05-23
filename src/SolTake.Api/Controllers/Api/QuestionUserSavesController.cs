using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using SolTake.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave;
using SolTake.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.DeleteQuestionUserSave;
using SolTake.Application.Queries.QuestionDomain;
using SolTake.Application.Queries.QuestionDomain.GetQuestionUserSaves;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class QuestionUserSavesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateQuestionUserSaveResponseDto> Create(CreateQuestionUserSaveDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task Delete(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteQuestionUserSaveDto(questionId), cancellationToken);

        [HttpGet]
        public async Task<List<QuestionUserSaveResponseDto>> Get([FromQuery]int? offset, [FromQuery]int take, [FromQuery]bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetQuestionUserSavesDto(offset,take,isDescending),cancellationToken);
    }
}
