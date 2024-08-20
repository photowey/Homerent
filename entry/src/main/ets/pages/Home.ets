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

import { AxiosResponse } from '@ohos/axios';
import { getHomeDataApi } from '../api/Home';
import { IHomeData, INavList, IPlanList, ITileList } from '../models/home/HomeModel';
import { ApiResponse } from '../models/http/HttpModel';
import { BannerListDataSource } from '../models/home/BannerListDataSource';
import { SwiperLayout } from '../views/Home/SwiperLayout';

/**
 * {@code Home}
 * |- 首页
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
@Component
export struct Home {

  // ----------------------------------------------------------------

  @State
  bannerList: BannerListDataSource = new BannerListDataSource()
  @State
  navList: INavList = [];
  @State
  tileList: ITileList = [];
  @State
  planList: IPlanList = [];
  @State
  adPicture: string = '';

  // ----------------------------------------------------------------

  async getHomeData() {
    const response: AxiosResponse<ApiResponse<IHomeData>> = await getHomeDataApi()

    this.bannerList.setList(response.data.data.bannerList);

    this.navList = response.data.data.navList;
    this.tileList = response.data.data.tileList;
    this.planList = response.data.data.planList;
    this.adPicture = response.data.data.adPicture;
  }

  // ----------------------------------------------------------------

  aboutToAppear(): void {
    this.getHomeData()
  }

  // ----------------------------------------------------------------

  build() {
    Scroll() {
      Column() {
        SwiperLayout({
          bannerList: this.bannerList
        })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.TopStart)
  }
}
