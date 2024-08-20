/*
 * Copyright © 2024 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Discovery } from './Discovery';
import { Home } from './Home';
import { Service } from './Service';
import { View } from './View';
import { Mine } from './Mine';

// ----------------------------------------------------------------

/**
 * {@code Index}
 * |- 底部导航
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
@Entry
@Component
struct Index {

  // ----------------------------------------------------------------

  @State
  currentTabIndex: number = 0;

  // ----------------------------------------------------------------

  tabSelected(index: number): boolean {
    return this.currentTabIndex === index
  }

  // ----------------------------------------------------------------

  build() {
    Tabs({ index: this.currentTabIndex }) {
      TabContent() {
        Home()
      }.tabBar(this.tabbarBuilder(0, $r('app.media.tabbar_home'), $r('app.media.tabbar_home_active'), '首页'))

      TabContent() {
        View()
      }.tabBar(this.tabbarBuilder(1, $r('app.media.tabbar_see'), $r('app.media.tabbar_see_active'), '想看'))

      TabContent() {
        Service()
      }.tabBar(this.tabbarBuilder(2, $r('app.media.tabbar_service'), $r('app.media.tabbar_service_active'), '服务'))

      TabContent() {
        Discovery()
      }.tabBar(this.tabbarBuilder(3, $r('app.media.tabbar_discover'), $r('app.media.tabbar_discover_active'), '发现'))

      TabContent() {
        Mine()
      }.tabBar(this.tabbarBuilder(4, $r('app.media.tabbar_my'), $r('app.media.tabbar_my_active'), '我的'))
    }
    .barHeight(50) // tab 栏 高度 (默认: 56)
    .scrollable(false) // 禁止滚动切换 tab
    .barPosition(BarPosition.End)
    .onChange((index: number) => {
      this.currentTabIndex = index
    })
  }

  @Builder
  tabbarBuilder(index: number, icon: Resource, selectedIcon: Resource, title: string) {
    Column() {
      Image(this.tabSelected(index) ? selectedIcon : icon)
        .tabbarIconStyle()
      Text(title)
        .tabbarTitleStyle(this.tabSelected(index) ? $r('app.color.black') : $r('app.color.gray_text'))
    }
  }
}

@Styles
function tabbarIconStyle() {
  .width(28)
  .height(28)
}

@Extend(Text)
function tabbarTitleStyle(color: ResourceColor) {
  .fontSize(10)
  .fontWeight(FontWeight.Medium)
  .fontColor(color)
}
