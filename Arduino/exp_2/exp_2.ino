// 实验：查看串口数据中的 Hello world
void setup()
{
    // * 设定波特率
    Serial.begin(9600);
}

void loop()
{
    Serial.println("Hello world!");

    delay(1000);
}