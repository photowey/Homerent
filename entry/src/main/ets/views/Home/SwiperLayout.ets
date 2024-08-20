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

import { IBannerItem } from '../../models/home/HomeModel'
import { BannerListDataSource } from '../../models/home/BannerListDataSource'

/**
 * {@code SwiperLayout}
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */

@Component
export struct SwiperLayout {

  @ObjectLink
  bannerList: BannerListDataSource

  build() {

    Swiper() {
      LazyForEach(
        this.bannerList,
        (banner: IBannerItem) => {
          Image(banner.imageURL)
            .swiperImageStyle()
        },
        (item: IBannerItem) => {
          // 自定义 KeyGenerator
          return item.id.toString()
        })
    }
    .width('100%')
    .height(211 - 36)
    .autoPlay(true) // 自动轮播
    .interval(2_000) // 切换间隔
    .indicator( // 小原点
      Indicator.dot()
        .color($r('app.color.indicator_dot_color'))
        .selectedColor($r('app.color.indicator_dot_selected_color'))
    )
  }
}

// ----------------------------------------------------------------

@Extend(Image)
function swiperImageStyle() {
  .width('100%')
  .height('100%')
  .objectFit(ImageFit.Fill)
}

// ----------------------------------------------------------------

/*
@Component
export struct SwiperLayout {

  @Prop
  bannerList: IBannerList = []

  build() {

    Swiper() {
      ForEach(
        this.bannerList,
        (banner: IBannerItem) => {
          Image(banner.imageURL)
            .swiperImageStyle()
        },
        (item: IBannerItem) => {
          return item.id.toString()
        })
    }
    .width('100%')
    .height(211 - 36)
    .autoPlay(true) // 自动轮播
    .interval(2_000) // 切换间隔
    .indicator( // 小原点
      Indicator.dot()
        .color($r('app.color.indicator_dot_color'))
        .selectedColor($r('app.color.indicator_dot_selected_color'))
    )
  }
}
*/

// ----------------------------------------------------------------
