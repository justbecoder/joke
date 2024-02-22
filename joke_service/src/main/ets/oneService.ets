/**
 * @description 构建OneService
 * */
import { AxiosResponse } from '@ohos/axios'
import { axios } from 'joke_axios'


export interface IOnePhoto {
  // 标题
  title: string,
  // 副标题
  subtitle: string,
  // 内容
  content: string,
  // 封面
  cover: string,
  // 发布时间
  make_time: string
}


export class OneService {
  /**
   * @description 获取One一个-摄影
   * */
  static getOnePhoto (): Promise<IOnePhoto> {
    return axios.get<any, IOnePhoto>('/one/photo')
  }
}