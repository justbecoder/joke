import { OneService, IOnePhoto, JokeService } from 'joke_service'
import hilog from '@ohos.hilog'
import { Constants } from 'joke_constants'
import {  Photo } from '../components/Photo'
import { Picture } from '../components/Picture'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  @State onePhoto: IOnePhoto = null

  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  tabController: TabsController = new TabsController()

  aboutToAppear() {
    // this.getBingData()
    // this.getJokeList()
  }

  getJokeList () {
    JokeService.getJokeList().then((data) => {
      hilog.info(0xff00, 'JokeList', JSON.stringify(data))
    })
  }

  @Builder TabBuilder (index: number, name: string, icon: Resource) {
      Column() {
        Divider()
          .backgroundColor($r('app.color.tab_item_border'))
          .height(0.5)
          .opacity(0.6)
          .width(Constants.FULL_WIDTH)
        Column() {
          Image(icon)
            .width(24)
            .height(24)
            .fillColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
          Text(name)
            .TabItemTextStyle(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        }
        .width(Constants.FULL_WIDTH)
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
      .height(60)
      .width(Constants.FULL_WIDTH)
      .backgroundColor($r('app.color.tab_background'))
      .justifyContent(FlexAlign.Start)
  }

  build() {
    Tabs({
      controller: this.tabController
    }) {
      TabContent() {
        Text("壁纸")
      }.tabBar(this.TabBuilder(0, "壁纸", $r('app.media.ic_gallery_aperture')))
      TabContent() {
        Text("笑话")
      }.tabBar(this.TabBuilder(1, "笑话", $r('app.media.ic_public_comments')))
      TabContent() {
        Photo()
      }.tabBar(this.TabBuilder(2, "摄影", $r('app.media.ic_public_albums')))

      TabContent() {
        Picture()
      }.tabBar(this.TabBuilder(3, "美图", $r('app.media.ic_public_favor')))
    }
    .height(Constants.FULL_HEIGHT)
    .width(Constants.FULL_WIDTH)
    .barPosition(BarPosition.End)
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .backgroundColor($r('app.color.page_background'))
    .onChange((index: number) => {
      this.currentIndex = index
      this.tabController.changeIndex(index)
    })
  }
}

@Extend(Text) function TabItemTextStyle (fontColor: string) {
  .fontColor(fontColor)
  .fontSize(14)
  .margin({
    top: 4
  })
}
