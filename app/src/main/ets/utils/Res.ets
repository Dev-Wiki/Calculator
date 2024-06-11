
export class Res {
  private constructor() {
  }

  static getString(name: string): Resource {
    return $r(`app.string.${name}`)
  }

  static getImage(name: string): Resource {
    return $r(`app.media.${name}`)
  }
}