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

import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import promptAction from '@ohos.promptAction';

import { TOKEN_NAME } from '../constants/HomeConstants';
import type { AnyPayload, AnyQuery, ApiResponse } from '../models/http/HttpModel';

// ----------------------------------------------------------------

const BASE_URL: string = 'http://192.168.1.8:6060'

// ----------------------------------------------------------------

// 创建 axios 实例
const request = axios.create({
  baseURL: BASE_URL,
  timeout: 2_000
})

// ----------------------------------------------------------------

// 添加请求拦截器
request.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 通过 AppStorage(PersistStorage) 获取 token
  const token = AppStorage.get<string>(TOKEN_NAME)
  if (token) {
    // 若 token 存在,则将其添加到请求头
    config.headers[TOKEN_NAME] = token
  }

  return config;
}, (error: AxiosError) => {
  // 若出现异常,则提示异常信息
  promptAction.showToast({
    message: error.message,
    alignment: Alignment.Center
  })

  return Promise.reject(error.message);
});

// 添加响应拦截器
request.interceptors.response.use((response: AxiosResponse) => {
  // 若服务器返回的是正常数据,不做任何处理
  if (response.data.code === 200) {
    return response
  } else {
    // 若服务器返回的是异常数据,则提示异常信息
    promptAction.showToast({
      message: response.data.message,
      alignment: Alignment.Center
    })

    return Promise.reject(response.data.message)
  }
}, (error: AxiosError) => {
  // 若出现异常,则提示异常信息
  promptAction.showToast({
    message: error.message,
    alignment: Alignment.Center
  })

  return Promise.reject(error.message);
});

/**
 * {@code Http}
 *
 * @author photowey
 * @since 2024/08/20
 * @version
 */
export class Http {

  get<T>(url: string, params?: AnyQuery) {
    return request.get<ApiResponse<T>, AxiosResponse<ApiResponse<T>>>(url, {
      params
    })
  }

  post<T>(url: string, payload?: AnyPayload) {
    return request.post<ApiResponse<T>, AxiosResponse<ApiResponse<T>>, AnyPayload>(url, payload)
  }

  put<T>(url: string, payload?: AnyPayload) {
    return request.put<ApiResponse<T>, AxiosResponse<ApiResponse<T>>, AnyPayload>(url, payload)
  }

  patch<T>(url: string, payload?: AnyPayload) {
    return request.patch<ApiResponse<T>, AxiosResponse<ApiResponse<T>>, AnyPayload>(url, payload)
  }

  delete<T>(url: string, payload?: AnyQuery) {
    return request.delete<ApiResponse<T>, AxiosResponse<ApiResponse<T>>>(url, payload)
  }
}
