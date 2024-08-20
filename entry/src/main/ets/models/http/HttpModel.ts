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
 * {@code AnyQuery}
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface AnyQuery {
  [key: string]: any;
}

// ----------------------------------------------------------------

/**
 * {@code AnyPayload}
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 */
export interface AnyPayload {
  [key: string]: any;
}

// ----------------------------------------------------------------

/**
 * {@code ApiResponse}
 *
 * @author photowey
 * @since 2024/08/20
 * @version 1.0.0
 * @param T 泛型 <T>
 */
export interface ApiResponse<T> {
  code: number;
  message: string;
  data: T,
}
