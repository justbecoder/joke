import axios from '@ohos/axios'
import promptAction from '@ohos.promptAction'
import { Token } from './TokenConfig'

interface HttpError {
  code: number,
  message: string
}

// 网络错误
const NetworkError: HttpError = {
  code: 10000,
  message: '网络异常，请重试'
}

// 服务器错误
const ServerError: HttpError = {
  code: 10001,
  message: '服务异常，请重试'
}

const instance = axios.create({
  baseURL: 'https://v2.alapi.cn/api',
  timeout: 20000
})

instance.interceptors.request.use((config) => {
  // 对请求token处理

  // const urlObj = Url.URL.parseURL(config.url)
  //
  // const params = new Url.URLParams(urlObj.search)
  // params.append('token', 'c9rPz6mELIYYHnUq')
  //
  //
  // config.url = `${urlObj.pathname}?${params.toString()}`


  config.url = config.url + '?token='


  return config
})

instance.interceptors.response.use((data) => {
  // 判断是否获取数据正常
  const result = data.data
  if (result && result.code === 200) {
    return Promise.resolve(result.data)
  } else {
    promptAction.showToast({
      message: ServerError.message
    })
    return Promise.reject(ServerError)
  }

}, () => {
  // 网络异常
  promptAction.showToast({
    message: NetworkError.message
  })

  return Promise.reject(NetworkError)
})


export default instance