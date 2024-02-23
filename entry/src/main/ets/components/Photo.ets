/**
 * @description One 摄影
 * */

import { OneService, IOnePhoto, JokeService } from 'joke_service'
import hilog from '@ohos.hilog';
import { Constants } from 'joke_constants';

@Preview
@Component
export struct Photo {

  @State onePhoto: IOnePhoto = null

  aboutToAppear() {
    this.getOnePhoto()
  }

  getOnePhoto () {
    OneService.getOnePhoto().then((data) => {
      this.onePhoto = data
      hilog.info(0xff00, 'PhotoData', JSON.stringify(data))
    })
  }

  build() {
    Column() {
       if(this.onePhoto) {
         // 展示图片
         Image(this.onePhoto.cover)
           .width(Constants.FULL_WIDTH)
           .objectFit(ImageFit.Contain)


         Text(this.onePhoto.subtitle)
           .textAlign(TextAlign.Center)
           .fontWeight(FontWeight.Bold)
           .margin({
             top: 20
           })

         Text(this.onePhoto.content)
           .margin({
             top: 20,
             right: 20,
             left: 20
           })
           .lineHeight(24)
       }
    }
    .width(Constants.FULL_WIDTH)
    .height(Constants.FULL_HEIGHT)
  }
}