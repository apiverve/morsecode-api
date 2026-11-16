using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.MorseCode
{
    /// <summary>
    /// Query options for the Morse Code API
    /// </summary>
    public class MorseCodeQueryOptions
    {
        /// <summary>
        /// The text to encode or decode in Morse code
        /// </summary>
        [JsonProperty("text")]
        public string Text { get; set; }

        /// <summary>
        /// Set to true to include an audio file of the Morse code. Audio is generated only when the encoded morse is 300 characters or fewer (roughly 60-80 characters of text); longer input returns audio: null with an audioError
        /// </summary>
        [JsonProperty("audio")]
        public bool? Audio { get; set; }
    }
}
