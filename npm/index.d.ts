declare module '@apiverve/morsecode' {
  export interface morsecodeOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface morsecodeResponse {
    status: string;
    error: string | null;
    data: MorseCodeData;
    code?: number;
  }


  interface MorseCodeData {
      text:  string;
      morse: string;
      stats: Stats;
      valid: boolean;
      audio: Audio;
  }
  
  interface Audio {
      audioFile:   string;
      format:      string;
      downloadURL: string;
      duration:    string;
      frequency:   string;
      sampleRate:  string;
      expires:     number;
  }
  
  interface Stats {
      characters: number;
      dits:       number;
      dahs:       number;
  }

  export default class morsecodeWrapper {
    constructor(options: morsecodeOptions);

    execute(callback: (error: any, data: morsecodeResponse | null) => void): Promise<morsecodeResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: morsecodeResponse | null) => void): Promise<morsecodeResponse>;
    execute(query?: Record<string, any>): Promise<morsecodeResponse>;
  }
}
