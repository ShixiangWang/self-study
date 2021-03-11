## 添加控件
## 包括 UI 和服务器两方面
##
## - fluidPage() 是布局函数，建立页面的基本可视化结构。
## - selectInput() 是让用户可以选择的输入控件。
## - verbatimTextOutput() 和 tableOutput() 是告诉 
## Shiny 那里对输出进行渲染的控件，前者展示代码，后者展示表格。

library(shiny)

ui = fluidPage(
  ## UI 控件一般使用
  ## xxInput：用于用户输入
  ## 或
  ## xxOutput：用于结果展示
  selectInput("dataset", label = "Dataset",
              choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)


server = function(input, output, session) {
  ## input 指代输入命名空间
  ## 如 input$dataset 指代来自用户输入（UI）ID 为 dataset 的数据
  ## output 指代输出命名空间
  ## 如 output$summary 指代输出给 UI 使用的数据，summary 是 ID

  ## Server 行为一般使用
  ## renderXXX 告诉服务器如何输出结果
  ##   output$ID <- renderTYPE({
  ##   # 生成输出的表达式
  ## })
  output$summary = renderPrint({
    dataset = get(input$dataset, "package:datasets", inherits = FALSE)
    summary(dataset)
  })
  
  output$table = renderTable({
    dataset = get(input$dataset, "package:datasets", inherits = FALSE)
    dataset
  })
}

shinyApp(ui, server)
