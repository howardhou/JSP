# utils

- 参考了 Java 工具类项目： https://github.com/GaoFeiGit/xutils

## Create Project
- 复制一部分工具栏到 java 目录
- 在resources 目录下新建 META-INF 目录
- 在 META-INF 目录新建 web-fragment.xml 文件

## 打包 jar

- https://www.cnblogs.com/qifengshi/p/6036870.html

- 打开Project Structure
- 选择Artifacts
- 点击 + 号， 选择 Jar -> From module with dependencies ... 打开 Create Jar from modules 界面
- Main Class 可以不填，修改 META-INF 目录，不能使用默认值

