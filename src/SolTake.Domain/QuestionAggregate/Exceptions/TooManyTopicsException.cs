﻿using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionAggregate.Exceptions
{
    public class TooManyTopicsException : AppException
    {
        private readonly static string _messageEn = $"You can add up to {Question.MaxTopicCountPerQuestion} topics per question!";
        private readonly static string _messageTr = $"Bir soru için en fazla {Question.MaxTopicCountPerQuestion} konu ekleyebilirsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyTopicsException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
