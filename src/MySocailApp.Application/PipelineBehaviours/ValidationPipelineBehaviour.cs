using FluentValidation;
using MediatR;
using MySocailApp.Application.Exceptions;

namespace MySocailApp.Application.PipelineBehaviours
{
    public class ValidationPipelineBehaviour<TRequest,TResponse>(IEnumerable<IValidator<TRequest>> validators) : IPipelineBehavior<TRequest,TResponse> where TRequest : notnull
    {
        private readonly IEnumerable<IValidator<TRequest>> _validators = validators;

        public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
        {
            if(_validators.Any())
            {
                var validator = _validators.First();
                var result = validator.Validate(request);
                if (!result.IsValid)
                {
                    var messages = result.Errors.Select(x => x.ErrorMessage).ToList();
                    throw new CustomValidationException(messages);
                }
            }
            return await next();

        }
    }
}
