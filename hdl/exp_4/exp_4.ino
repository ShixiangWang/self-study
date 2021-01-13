// 实验：6 位数字跑马灯
//
// Arduino 数字 I/O 分为两部分，每部分保护 6 个 I/O 管脚
// * 2-7
// * 8-13
//
// 管脚 13 接了 1K 电阻，其他管脚都直接接在 ATmega 芯片上

int startPin = 2;
int endPin = 7;
int index = 0;

void setup()
{
  for (int i = startPin; i <= endPin; i++)
  {
    pinMode(i, OUTPUT); // 设定管脚为输出模式
  }
}


// ! 需要电路的配合
void loop()
{

  // 写入低电平，全部熄灭
  for (int i = startPin; i <= endPin; i++)
  {
    digitalWrite(i, LOW);
  }

  // 对某个管脚写入高电平
  digitalWrite(startPin + index, HIGH);

  // 更新下一个亮灯的管脚
  index = (index + 1) % (endPin - startPin + 1);

  // 设定延时
  delay(200);
}