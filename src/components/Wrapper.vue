<template>
    <div class="wrapper">
        <div class="output">
        <div class="outputCalc">{{ calcul || 0 }}</div>
        <div class="outputCalc">{{ value || result }}</div>
        </div>
        <div class="buttons">
        <div
            class="button"
            v-for="n in btnArr"
            :key="n"
            :class="{ operator: ['C', '+/-', '*', '/', '-', '+', '%', '='].includes(n) }"
        >
            <div class="btn" @click="action(n)">
            {{ n }}
            </div>
        </div>
        </div>
    </div>
</template>

<script>
export default {
  name: 'Wrapper',
  data() {
    return {
      btnArr: [
        "C", 
        '+/-',
        "*",
        "/",
        "-",
        "7",
        "8",
        "9",
        "+",
        "4",
        "5",
        "6",
        "%",
        "1",
        "2",
        "3",
        "=",
        "0",
        ".",
      ],
      calcul: "",
      value: "",
      result: ""
    };
  },
  methods: {
    action(e) {
      //get stored variable
      let newCalcul = this.calcul; 
      let newValue = this.value;
      let newResult = this.result;

      console.log(newCalcul,newValue,newResult);

      //if button is not a number or .
      if(isNaN(e) && e !== ".") {
        if(e === "=") {
          //must have something in new value for calculate
          if(newValue !== ""){
            newCalcul = ""; 
            newValue = "";
            //twice eval to avoid js decimal problems
            //Number() to delete leading 0
            newResult = eval(eval(this.calcul + Number(this.value)).toFixed(13));
          }
        } else if(e === "C") {
          newCalcul = ""; 
          newValue = "";
          newResult = "";
        } else if(e === "+/-") {
          if(newResult !== "") {
            newValue = eval(newResult * -1);
            newResult = "";
          } else {
            newValue = eval(newValue * -1);
          }
        //all operators
        } else if(e === "%") {
          if(newResult !== "") {
            newValue = eval(eval(newResult / 100).toFixed(13));
            newResult = "";
          } else {
            newCalcul = "";
            newValue = eval(eval("(" + this.calcul + Number(this.value) +") / 100").toFixed(13));
          }
        } else {
          if(newResult !== "") {
            newCalcul = newResult + e;
            newResult = "";
          } else {
            if(newValue === ""){
              //replace previous operator 
              newCalcul = newCalcul.replace(/.$/, e);
            } else {
              newCalcul = eval(eval(this.calcul + Number(this.value)).toFixed(13)) + e;
              newValue = "";
            }
          }
        }
      } else {
        //check if never use dot
        if((e === "." && newValue.indexOf(".") === -1) || e !== ".") {
          if(newResult !== "") {
            newResult = "";
          }
          newValue += e;
        }
      }

      this.calcul = newCalcul;
      this.value = newValue;
      this.result = newResult;
    },
  },
};
</script>

<style>
.buttons {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: minmax(50px, auto);
  width: min(300px, 70%);
  border-radius: 4px;
  align-items: center;
  background-color: #7da095;
  justify-content: center;
  margin: 10px auto;
  gap: 5px;
  box-shadow: 2.8px 2.8px 2.2px rgba(0, 0, 0, 0.008),
    6.7px 6.7px 5.3px rgba(0, 0, 0, 0.012),
    12.5px 12.5px 10px rgba(0, 0, 0, 0.015),
    22.3px 22.3px 17.9px rgba(0, 0, 0, 0.018),
    41.8px 41.8px 33.4px rgba(0, 0, 0, 0.022),
    100px 100px 80px rgba(0, 0, 0, 0.03);
}
.button {
  background-color: #acc1c9;
  padding: 6px;
  border-radius: 3px;
  margin: 4px;
  font-size: 1.5em;
  font-weight: bold;
  color: rgb(255, 255, 255);
  text-align: center;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
}
.button:hover {
  background-color: #98A7AC;
  color: rgb(255, 255, 255);
}
.operator {
  background-color: #188674;
  color: rgb(255, 255, 255);
}
.operator:hover {
  background-color: #707e68
}
.output {
  text-align: right;
  background-color: #e7d9d5c2;
  width: min(300px, 70%);
  margin: 10px auto;
  border-radius: 6px;
  box-shadow: 2.8px 2.8px 2.2px rgba(0, 0, 0, 0.008),
    6.7px 6.7px 5.3px rgba(0, 0, 0, 0.012),
    12.5px 12.5px 10px rgba(0, 0, 0, 0.015),
    22.3px 22.3px 17.9px rgba(0, 0, 0, 0.018),
    41.8px 41.8px 33.4px rgba(0, 0, 0, 0.022),
    100px 100px 80px rgba(0, 0, 0, 0.03);
}
.outputCalc {
  background-color: #e7d9d5c2;
  padding: 15px;
  color: rgb(134, 117, 117);
}
.MyId:hover {
  cursor: pointer;
  filter: brightness(130%);
}
.wrapper {
    width: 340px;
    height: 400px;
    padding: 10px;
    border-radius: 10px;
    background-color: #D3A595;
}
body {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #e4d1c8;
  background-image: linear-gradient(200deg, #fefeff 0%, #d7b9aae8 80%, #707e68 0%);
}
</style>