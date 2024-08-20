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

/**
 * {@code IHomeData}
 * |- 主页数据
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface IHomeData {
  "bannerList": IBannerList
  "navList": INavList
  "tileList": ITileList
  "planList": IPlanList
  "adPicture": string
}

// ----------------------------------------------------------------

/**
 * {@code IBannerItem}
 * |- 轮播图
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface IBannerItem {
  "id": number
  "name": string
  "imageURL": string
}

/**
 * {@code IBannerList}
 * |- 轮播图类型
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export type IBannerList = IBannerItem[]

// ----------------------------------------------------------------

/**
 * {@code INavItem}
 * |- 导航列表
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface INavItem {
  "id": number
  "title": string
  "imageURL": string
}

/**
 * {@code INavList}
 * |- 导航列表类型
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export type INavList = INavItem[]

// ----------------------------------------------------------------

/**
 * {@code ITileItem}
 * |- 瓷片列表
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface ITileItem {
  "id": number
  "imageURL": string
  "title": string
  "sub_title": string
}

/**
 * {@code ITileList}
 * |- 瓷片列表类型
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export type ITileList = ITileItem[]

// ----------------------------------------------------------------

/**
 * {@code IPlanItem}
 * |- 计划列表
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface IPlanItem {
  "id": number
  "imageURL": string
}

/**
 * {@code IBannerList}
 * |- 计划列表类型
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export type IPlanList = IPlanItem[]

// ----------------------------------------------------------------
