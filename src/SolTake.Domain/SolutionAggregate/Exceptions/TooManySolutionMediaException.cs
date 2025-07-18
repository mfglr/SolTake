﻿using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionAggregate.Exceptions
{
    public class TooManySolutionMediaException : AppException
    {
        private readonly static string _messageEn = $"You can upload a maximum of {Solution.MaxNumberOfMultimedia} pieces of content per solution!";
        private readonly static string _messageTr = $"Çözüm başına en fazla {Solution.MaxNumberOfMultimedia} içerik yükleyebilirsiniz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManySolutionMediaException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
