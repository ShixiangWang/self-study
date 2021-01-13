// 实验: 单 led 闪烁
//
// * Arduino 代码
// * 需要硬件电路配合

// * 设定数字 IO 脚为 5
int ledPin = 5;  

// ! 由 setup() 进行初始化
void setup() {
    // * 设定数字 IO 模式
    pinMode(ledPin, OUTPUT);
}

// ! 由 loop() 调用逻辑

void loop() {
    digitalWrite(ledPin, HIGH);// 设定高电平
    delay(100);                // 设定延时，以毫秒为单位
    digitalWrite(ledPin, LOW); // 设定低电平
    delay(100);
}

// TODO Nothing left to do
// FIXME Nothing left to fix
