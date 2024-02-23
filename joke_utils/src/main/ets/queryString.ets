
class SearchParams {
  constructor() {
  }
}


/**
 * @description 解析query参数，返回对象
 * */
export const parse = (url: string) => {
  // 查询问号位置
  const index = url.indexOf('?')

  if (index === -1) {
    return new SearchParams()
  }


}

export const queryString = {

}