import axios from '@ohos/axios'
import promptAction from '@ohos.promptAction'
import { Token } from './TokenConfig'
import Url from '@ohos.url';

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

function formatToken (url: string): string {
  let newUrl = url;
  // 处理?
  const index = newUrl.indexOf('?')
  if (index === -1) {
    newUrl = newUrl + `?token=${Token}`
  } else {
    // 处理参数
    let path = newUrl.slice(0, index)
    // URLParams只能解析query字符串，不能携带path
    let params = new Url.URLParams(newUrl.slice(index + 1))
    // 追加token
    params.append('token', Token)
    // 拼接最终url地址
    newUrl = `${path}${params.toString()}`
  }
  return newUrl
}


instance.interceptors.request.use((config) => {
  config.url = formatToken(config.url)

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