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
      for (let index = 0; index < 200; index++) {
           //获取钱包数据
          let result = await createWallet("dewe23")
          console.log("#### 生成钱包数据 result = ", result)

          // 解密主密钥
          let result2 =  await decryptMasterKey(result.saltRandom, result.masterKeyEncryptHex,result.password)
          console.log("result2 = ", result2) 


          console.log("result.masterKey = ", result.masterKey) 
          console.log("result.address = ", result.address) 
          console.log("result.mnemonic = ", result.mnemonic) 

          console.log("result2.masketKey = ", result2.masketKey) 
          console.log("result2.address = ", result2.address) 
          console.log("result2.mnemonic = ", result2.mnemonic) 

          if (result2.address===result.address && result2.masketKey===result.masterKey && result2.mnemonic===result.mnemonic){
            console.log("---- pass ---------------- index= ", index)
          }else{
            isFailed=true
            console.log("--------------------- failed ----->>>>>> index= ", index)

          }
        }
          console.log("---- the fial result.isFailed = ", isFailed)
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
