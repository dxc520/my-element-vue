# my-element-vue

> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).


## 2、run docker
### 2.1 build
```
./runBuild
```

### 2.2 run with docker

```
docker run -d --name wallet-sdk -p 8080:80 registry.paradeum.com/nft/wallet-sdk:v0.0.4
```

### 2.3 visit
```
http://localhost:8080
```
