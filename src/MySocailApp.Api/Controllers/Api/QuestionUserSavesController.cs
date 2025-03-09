using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.DeleteQuestionUserSave;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Application.Queries.QuestionDomain.GetQuestionUserSaves;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckUserFilterAttribute))]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
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
