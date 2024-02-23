/**
 * @description 封装TabBar
 * */
import { Constants } from 'joke_constants'

@Builder function NavigationToolBar () {
  Text("测试一下ToolBar")
}

@Component
export struct LayoutWithTabBar {
  @BuilderParam builder: () => {}

  // 对应
  @Prop tabKey: string

  build() {
    Navigation() {
      this.builder()
    }
      .toolBar(NavigationToolBar())
  }
}