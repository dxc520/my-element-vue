<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>Essential Links</h2>
    <ul>
      <li>
        <a
          href="https://vuejs.org"
          target="_blank"
        >
          Core Docs
        </a>
      </li>
      <li>
        <a
          href="https://forum.vuejs.org"
          target="_blank"
        >
          Forum
        </a>
      </li>
      <li>
        <a
          href="https://chat.vuejs.org"
          target="_blank"
        >
          Community Chat
        </a>
      </li>
      <li>
        <a
          href="https://twitter.com/vuejs"
          target="_blank"
        >
          Twitter
        </a>
      </li>
      <br>
      <li>
        <a
          href="http://vuejs-templates.github.io/webpack/"
          target="_blank"
        >
          Docs for This Template
        </a>
      </li>
    </ul>
    <h2>Ecosystem</h2>
    <ul>
      <li>
        <a
          href="http://router.vuejs.org/"
          target="_blank"
        >
          vue-router
        </a>
      </li>
      <li>
        <a
          href="http://vuex.vuejs.org/"
          target="_blank"
        >
          vuex
        </a>
      </li>
      <li>
        <a
          href="http://vue-loader.vuejs.org/"
          target="_blank"
        >
          vue-loader
        </a>
      </li>
      <li>
        <a
          href="https://github.com/vuejs/awesome-vue"
          target="_blank"
        >
          awesome-vue
        </a>
      </li>
    </ul>
  </div>
</template>

<script>

import { createWallet,decryptMasterKey } from 'wallet-utils-create'


export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  mounted(){
    this.createWallet2()
  },
  methods:{
     async createWallet2(){
      let isFailed = false
      let total=200
      for (let index = 0; index < total; index++) {
           //获取钱包数据
          let dateBegin = new Date() //
          let result = await createWallet("dewe23")
          //console.log("#### 生成钱包数据 result = ", result)

          // 解密主密钥
          let result2 =  await decryptMasterKey(result.saltRandom, result.masterKeyEncryptHex,result.password)
          //console.log("#### 返解析钱包数据 DeResult = ", result2) 
          let dateEnd = new Date();//获取当前时间
          let costTimeMs=dateEnd.getTime()-dateBegin.getTime()
          if (result2.address===result.address && result2.masketKey===result.masterKey && result2.mnemonic===result.mnemonic){
            console.log(`Total=${total},index[${index}]=pass;costTime=${costTimeMs}ms.....`)
          }else{
            isFailed=true
            console.log("#### 生成钱包数据 result = ", result)
            console.log("#### 返解析钱包数据 DeResult = ", result2) 
            console.log(`Total=${total},index[${index}]=failed;costTime=${costTimeMs}ms.....`)
            break

          }
        }

        if (!isFailed){
          console.log("---- the fial result. All right" ) 
        }else{
          console.log("---- the fial result: something is wrong = ", isFailed)
        }
          
      }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
