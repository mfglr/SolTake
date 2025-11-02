using SolTake.NsfwDetector.Infrastructure.Exceptions;
using System.Text;
using System.Text.Json;

namespace SolTake.NsfwDetector.Infrastructure
{
    internal class OpenAINsfwDetector(NsfwClient client, ImageToBase64Convertor imageToBase64) : IInternalNsfwDetector
    {
        private readonly NsfwClient _client = client;
        private readonly ImageToBase64Convertor _imageToBase64 = imageToBase64;

        private readonly static string _model = "omni-moderation-latest";

        private static NsfwScoreResult GetMaxScores(IEnumerable<NsfwScoreResult> scores)
        {
            double harassment = 0, harassmentThreatening = 0, sexual = 0, hate = 0, hateThreatening = 0, illicit = 0, illicitViolent = 0, selfHarmIntent = 0, selfHarmInstructions = 0, selfHarm = 0, sexualMinors = 0, violence = 0, violenceGraphic = 0;

            foreach (var score in scores)
            {
                if (score.Harassment > harassment) harassment = score.Harassment;
                if (score.HarassmentThreatening > harassmentThreatening) harassmentThreatening = score.Harassment;
                if (score.Sexual > sexual) sexual = score.Sexual;
                if (score.Hate > hate) hate = score.Hate;
                if (score.HarassmentThreatening > hateThreatening) hateThreatening = score.HateThreatening;
                if (score.Illicit > illicit) illicit = score.Illicit;
                if (score.IllicitViolent > illicitViolent) illicitViolent = score.IllicitViolent;
                if (score.SelfHarmIntent > selfHarmIntent) selfHarmIntent = score.SelfHarmIntent;
                if (score.SelfHarmInstructions > selfHarmInstructions) selfHarmInstructions = score.SelfHarmInstructions;
                if (score.SelfHarm > selfHarm) selfHarm = score.SelfHarm;
                if (score.SexualMinors > sexualMinors) sexualMinors = score.SexualMinors;
                if (score.Violence > violence) violence = score.Violence;
                if (score.ViolenceGraphic > violenceGraphic) violenceGraphic = score.ViolenceGraphic;
            }

            return new(harassment, harassmentThreatening, sexual, hate, hateThreatening, illicit, illicitViolent, selfHarmIntent, selfHarmInstructions, selfHarm, sexualMinors, violence, violenceGraphic);
        }


        public async Task<NsfwScoreResult> ClassifyAsync(string text, CancellationToken cancellationToken)
        {
            var json = JsonSerializer.Serialize(new { model = _model, input = text });
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _client.PostAsync("", content, cancellationToken);
            using var stream = await response.Content.ReadAsStreamAsync(cancellationToken);
            if (!response.IsSuccessStatusCode)
            {
                using var reader = new StreamReader(stream);
                throw new NsfwDetectorException(await reader.ReadToEndAsync(cancellationToken));
            }
            var nsfwResult = (await JsonSerializer.DeserializeAsync<NsfwResult>(stream, cancellationToken: cancellationToken))!;

            if (nsfwResult.Error != null)
                throw new NsfwDetectorException(nsfwResult.Error.Message);

            return nsfwResult.Results!.First().CategoryScores;
        }

        public async Task<NsfwScoreResult> ClassifyImageAsync(string inputPath, CancellationToken cancellationToken)
        {
            using var stream = File.OpenRead(inputPath);
            var url = await _imageToBase64.ConvertAsync(stream, cancellationToken);

            var json = JsonSerializer.Serialize(
                new
                {
                    model = _model,
                    input = new[] { new { type = "image_url", image_url = new { url } } }
                }
            );
            using var request = new StringContent(json, Encoding.UTF8, "application/json");
            var response = await _client.PostAsync("", request, cancellationToken);
            using var contentStream = await response.Content.ReadAsStreamAsync(cancellationToken);
            if (!response.IsSuccessStatusCode)
            {
                using var reader = new StreamReader(contentStream);
                throw new NsfwDetectorException(await reader.ReadToEndAsync(cancellationToken));
            }
            var nsfwResult = (await JsonSerializer.DeserializeAsync<NsfwResult>(contentStream, cancellationToken: cancellationToken))!;

            if (nsfwResult.Error != null)
                throw new NsfwDetectorException(nsfwResult.Error.Message);
            return nsfwResult.Results!.First().CategoryScores;
        }

        public async Task<NsfwScoreResult> ClassifyImagesAsync(IEnumerable<string> inputPaths, CancellationToken cancellationToken)
        {
            List<Task<NsfwScoreResult>> tasks = [];
            foreach (var path in inputPaths)
                tasks.Add(ClassifyImageAsync(path, cancellationToken));

            await Task.WhenAll(tasks);

            List<NsfwScoreResult> results = [];
            tasks.ForEach(x => results.Add(x.Result));

            return GetMaxScores(results);
        }
    }
}
