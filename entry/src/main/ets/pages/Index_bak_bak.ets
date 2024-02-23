import { OneService, IOnePhoto, JokeService } from 'joke_service'
import hilog from '@ohos.hilog'
import { Constants } from 'joke_constants'
import {  Photo } from '../components/Photo'
import { Picture } from '../components/Picture'
import { LayoutWithTabBar } from '../components/LayoutWithTabBar'


@Entry
@Component
struct Index {

  @Builder Body () {
    Text("测试")
  }

  build() {
    Column() {
      LayoutWithTabBar({
        tabKey: 'index'
      }) {
        Text("测试一下")
      }
    }
    .align(Alignment.Start)
    .width(Constants.FULL_WIDTH)
    .height(Constants.FULL_HEIGHT)
  }
}


