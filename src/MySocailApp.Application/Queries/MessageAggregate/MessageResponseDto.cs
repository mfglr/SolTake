﻿using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.MessageAggregate
{
    public class MessageResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public bool IsOwner { get; private set; }
        public string UserName { get; private set; }
        public int ConversationId { get; private set; }
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public bool IsEdited { get; private set; }
        public string? Content { get; private set; }
        public MessageState State { get; private set; }
        public IEnumerable<MessageMultimediaResponseDto> Medias { get; private set; }
        public Multimedia? Image { get; private set; }
        public MessageResponseDto(int id, DateTime createdAt, DateTime? updatedAt, bool isOwner, string userName, int conversationId, int senderId, int receiverId, bool isEdited, string? content, MessageState state, IEnumerable<MessageMultimediaResponseDto> medias,Multimedia? image)
        {
            Id = id;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
            IsOwner = isOwner;
            UserName = userName;
            ConversationId = conversationId;
            SenderId = senderId;
            ReceiverId = receiverId;
            IsEdited = isEdited;
            Content = content;
            State = state;
            Medias = medias;
            Image = image;
        }

        private MessageResponseDto() { }
    }
}
