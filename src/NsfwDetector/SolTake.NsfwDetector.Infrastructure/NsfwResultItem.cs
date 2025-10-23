using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfwResultItem(bool flagged, NsfwCategoryResult categories, NsfwScoreResult categoryScores)
    {
        [JsonPropertyName("flagged")]
        public bool Flagged { get; private set; } = flagged;
        [JsonPropertyName("categories")]
        public NsfwCategoryResult Categories { get; private set; } = categories;
        [JsonPropertyName("category_scores")]
        public NsfwScoreResult CategoryScores { get; private set; } = categoryScores;
    }
}
