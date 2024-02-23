/**
 * @description 美图 - AIGC
 * */
import { Constants } from 'joke_constants'
import { PictureService, IPicture } from 'joke_service'

@Component
export struct Picture {
  @State picture: IPicture = null

  async aboutToAppear() {
    // const info = await PictureService.getAcgPicture()
    // this.picture = info
  }

  build() {
    if (this.picture) {
      Image(this.picture.url)
        .width(Constants.FULL_WIDTH)
        .height(Constants.FULL_HEIGHT)
        .objectFit(ImageFit.Contain)
    }
  }
}