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

import { CURRENT_TAB_INDEX_NAME } from '../constants/HomeConstants';

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

  @StorageLink(CURRENT_TAB_INDEX_NAME)
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
      }.tabBar(this.barBuilder(0, $r('app.media.tabbar_home'), $r('app.media.tabbar_home_active'), '首页'))

      TabContent() {
        View()
      }.tabBar(this.barBuilder(0, $r('app.media.tabbar_see'), $r('app.media.tabbar_see_active'), '想看'))

      TabContent() {
        Service()
      }.tabBar(this.barBuilder(0, $r('app.media.tabbar_service'), $r('app.media.tabbar_service_active'), '服务'))

      TabContent() {
        Discovery()
      }.tabBar(this.barBuilder(0, $r('app.media.tabbar_discover'), $r('app.media.tabbar_discover_active'), '发现'))

      TabContent() {
        Mine()
      }.tabBar(this.barBuilder(0, $r('app.media.tabbar_my'), $r('app.media.tabbar_my_active'), '我的'))
    }
    .barPosition(BarPosition.End)
    .onChange((index) => {
      this.currentTabIndex = index
    })
  }

  @Builder
  barBuilder(index: number, icon: Resource, selectedIcon: Resource, title: string) {
    Column() {
      Image(this.tabSelected(index) ? selectedIcon : icon)
        .tabIconStyle()
      Text(title)
        .tabTitleStyle(this.tabSelected(index) ? Color.Black : '#959595')
    }
  }
}

@Styles
function tabIconStyle() {
  .width(25)
  .height(25)
}

@Extend(Text)
function tabTitleStyle(color: ResourceColor) {
  .fontSize(10)
  .fontWeight(FontWeight.Medium)
  .fontColor(color)
  .margin({ bottom: 2 })
}
