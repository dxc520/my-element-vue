<template>
     <div>
    <el-row>
        <el-form :model="numberValidateForm" ref="numberValidateForm" label-width="100px" class="demo-ruleForm">
        <el-form-item
            label="次数"
            prop="turns"
            :rules="[
            { required: true, message: '次数不能为空'},
            { type: 'number', message: '次数必须为数字值'}
            ]"
        >
            <el-input type="turns" v-model.number="numberValidateForm.turns" autocomplete="off"></el-input>
        </el-form-item>
       <br/>
        <el-form-item>
            <el-button type="primary" @click="submitForm('numberValidateForm')">提交</el-button>
            <el-button @click="resetForm('numberValidateForm')">重置</el-button>
        </el-form-item>
        </el-form>  
    </el-row>
    <el-row>
        <hr/>
    </el-row>
    <el-row>
       <p> 
       <span v-html="note"></span>
       </p>
    </el-row>
     
     </div>
</template>

<script>
 import { createWallet,decryptMasterKey } from 'wallet-utils-create'

export default {
    name: 'WalletSdk',
    data() {
      return {
        numberValidateForm: {
          turns: 2
        },
        note:""
      };
    },
    mounted(){
    //this.createWallet2()
    },
    methods:{
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
            if (valid) {
                let total = this.numberValidateForm.turns
                confirm(`Will Testing ${total}次`)
                this.note="testing"
                this.createWallet2(total)
            } else {
                console.log('error submit!!');
                return false;
            }
            });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
        async createWallet2(total){
        let isFailed = false
        //let total=2
        let message = "";
        let successTotal=0

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
               let item=`Total=${total},index[${index}]=pass;costTime=${costTimeMs}ms.....`
               //message=`${item}<br/>${message}`
               successTotal++
               message=`Total=${total},successTotal=${successTotal},currentIndex[${index}]`
               console.log(item)
            }else{
                isFailed=true
                console.log("#### 生成钱包数据 result = ", result)
                console.log("#### 返解析钱包数据 DeResult = ", result2) 
                let item=`Total=${total},index[${index}]=failed;costTime=${costTimeMs}ms.....`
                message=`${item}<br/>${message}`
                console.log(item)
                break

            }
            this.note=message
        }

            if (!isFailed){
                console.log("---- the fial result. All right" ) 
                this.note=`All success <br/> ${message}`
            }else{
                console.log("---- the fial result: something is wrong = ", isFailed)
                this.note=`something is wrong <br/> ${message}`
            }
            
        }
    }
}
</script>
<style scoped>

</style>