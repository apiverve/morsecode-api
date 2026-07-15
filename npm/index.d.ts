declare module '@apiverve/morsecode' {
  export interface morsecodeOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface morsecodeResponse {
    status: string;
    error: string | null;
    data: MorseCodeData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface MorseCodeData {
      text:  null | string;
      morse: null | string;
      stats: Stats;
      valid: boolean | null;
      audio: Audio;
  }
  
  interface Audio {
      audioFile:   null | string;
      format:      null | string;
      downloadURL: null | string;
      duration:    null | string;
      frequency:   null | string;
      sampleRate:  null | string;
      expires:     number | null;
  }
  
  interface Stats {
      characters: number | null;
      dits:       number | null;
      dahs:       number | null;
  }

  export default class morsecodeWrapper {
    constructor(options: morsecodeOptions);

    execute(callback: (error: any, data: morsecodeResponse | null) => void): Promise<morsecodeResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: morsecodeResponse | null) => void): Promise<morsecodeResponse>;
    execute(query?: Record<string, any>): Promise<morsecodeResponse>;
  }
}
