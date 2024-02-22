import { OneService, IOnePhoto } from 'joke_service'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  @State onePhoto: IOnePhoto = null

  aboutToAppear() {
    this.getBingData()
  }

  getBingData () {
    OneService.getOnePhoto().then((data) => {
      this.onePhoto = data
      hilog.info(0xff00, 'BingData', JSON.stringify(data))
    })
  }

  build() {
    Scroll() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("每日一图")
          .onClick(() => {
            this.getBingData()
          })

        if (this.onePhoto) {
          Image(this.onePhoto.cover)
        }
      }
      .margin(20)
      .width('100%')
    }
  }
}