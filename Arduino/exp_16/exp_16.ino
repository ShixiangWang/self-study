// 实验：舵机控制

int servoPin = 9;

void setup()
{
    pinMode(servoPin, OUTPUT);
}

void loop()
{
    // 不同的高脉冲时间决定偏转的幅度
    // 1500 us 归中

    // 中
    digitalWrite(servoPin, HIGH);
    delayMicroseconds(1500);
    digitalWrite(servoPin, LOW);
    delay(500);
    // 左
    digitalWrite(servoPin, HIGH);
    delayMicroseconds(1000);
    digitalWrite(servoPin, LOW);
    delay(500);
    // 中
    digitalWrite(servoPin, HIGH);
    delayMicroseconds(1500);
    digitalWrite(servoPin, LOW);
    delay(500);
    // 右
    digitalWrite(servoPin, HIGH);
    delayMicroseconds(2000);
    digitalWrite(servoPin, LOW);
    delay(500);
}