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

import { IBannerItem, IBannerList } from './HomeModel'

/**
 * {@code BannerListDataSource}
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 * @see * https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-rendering-control-lazyforeach-V5
 */
@Observed
export class BannerListDataSource implements IDataSource {
  // 内部用来触发 UI 更新对象
  listeners: DataChangeListener[] = []
  // 管理数据
  bannerList: IBannerList = []

  // 实现了 IDataSource 接口
  // 接口要求我们必须定义四个方法: getData、totalCount、registerDataChangeListener、unregisterDataChangeListener
  // 读取对应下标的数据
  getData(index: number): IBannerItem {
    return this.bannerList[index]
  }

  // 返回数据总长度
  totalCount(): number {
    return this.bannerList.length
  }

  // 保存单个数据
  setData(item: IBannerItem) {
    // 只会更新数据,不会更新 UI
    this.bannerList.push(item);
    // 更新 UI
    this.notifyDataAdd(this.bannerList.length - 1);
  }

  // 更新所有数据
  setList(list: IBannerList) {
    this.bannerList = list;
    this.notifyDataReload();
  }

  // 该方法为框架侧调用,为 LazyForEach 组件向其数据源处添加 listener 监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用,为对应的 LazyForEach 组件在数据源处去除 listener 监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知 LazyForEach 组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知 LazyForEach组 件需要在 index 对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知 LazyForEach 组件在 index 对应索引处数据有变化,需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知 LazyForEach 组件需要在 index 对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知 LazyForEach 组件将 from 索引和 to 索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}
